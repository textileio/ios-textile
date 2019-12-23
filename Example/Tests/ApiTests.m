//
//  TextileTests.m
//  TextileTests
//
//  Created by asutula on 03/11/2019.
//  Copyright (c) 2019 asutula. All rights reserved.
//

// https://github.com/Specta/Specta

#import <OCMockito/OCMockito.h>
#import <OCHamcrest/OCHamcrest.h>
#import <Textile/TextileApi.h>
#import "TextileDelegateMock.h"
#import "Callback.h"

SpecBegin(ApiSpecs)

describe(@"public api", ^{

  __block TextileDelegateMock *delegate = [[TextileDelegateMock alloc] init];
  NSString *threadKey = @"threadKey";
  __block Thread *thread;

  it(@"should be initialized", ^{
    NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *repoPath = [documents stringByAppendingPathComponent:@"textile"];

    NSError *e;
    NSString *phrase = [Textile initializeCreatingNewWalletAndAccount:repoPath debug:YES logToDisk:NO error:&e];
    expect(phrase).notTo.beNil();
    expect(phrase.length).beGreaterThan(0);
    expect(e).beNil();

    BOOL launched = [Textile launch:repoPath debug:YES error:&e];
    expect(launched).beTruthy();
    expect(e).beNil();

    Textile.instance.delegate = delegate;
  });

  it(@"should notify node started and online", ^{
    assertWithTimeout(5, thatEventually(@(delegate.startedCalledCount)), equalToInt(1));
    assertWithTimeout(60, thatEventually(@(delegate.onlineCalledCount)), equalToInt(1));
  });

  it(@"should register a cafe", ^{
    waitUntilTimeout(20, ^(DoneCallback done) {
      [Textile.instance.cafes
       register:@"https://us-west-dev.textile.cafe"
       token:@"uggU4NcVGFSPchULpa2zG2NRjw2bFzaiJo3BYAgaFyzCUPRLuAgToE3HXPyo" completion:^(NSError * _Nonnull error) {
         expect(error).beNil();
         done();
       }];
    });
  });

  it(@"should create a thread", ^{
    AddThreadConfig_Schema *schema = [[AddThreadConfig_Schema alloc] init];
    schema.preset = AddThreadConfig_Schema_Preset_Blob;
    AddThreadConfig *config = [[AddThreadConfig alloc] init];
    config.key = threadKey;
    config.name = @"test thread";
    config.schema = schema;
    config.type = Thread_Type_Public;
    config.sharing = Thread_Sharing_Shared;
    NSError *e;
    thread = [Textile.instance.threads add:config error:&e];
    expect(e).beNil();
    expect(thread).notTo.beNil();
    expect(thread.key).equal(threadKey);
  });

  it(@"should add a message", ^{
    NSError *e;
    NSString *val = [Textile.instance.messages add:thread.id_p body:@"heeey" error:&e];
    expect(e).beNil();
    expect(val).notTo.beNil();
    assertWithTimeout(60, thatEventually(@([delegate.updatedItems containsObject:val])), isTrue());
  });

  it(@"should add data", ^{
    __block Block *b;
    waitUntilTimeout(20, ^(DoneCallback done) {
      NSData* data = [@"hello again world" dataUsingEncoding:NSUTF8StringEncoding];
      NSString *dataStr = [data base64EncodedStringWithOptions:0];
      [Textile.instance.files addData:dataStr threadId:thread.id_p caption:@"cool" completion:^(Block * _Nullable block, NSError * _Nonnull error) {
        expect(error).beNil();
        expect(block).notTo.beNil();
        NSLog(@"block id = %@", block.data_p);
        b = block;
        done();
      }];
    });
    assertWithTimeout(60, thatEventually(@([delegate.updatedItems containsObject:b.id_p])), isTrue());
    assertWithTimeout(60, thatEventually(@([delegate.completeItems containsObject:b.id_p])), isTrue());
    
    NSError *e;
    Files *f = [Textile.instance.files file:b.id_p error:&e];
    expect(f).notTo.beNil();
    expect(f.block).equal(b.id_p);
  });

  it(@"should add a file before stopping", ^{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"TEST1" ofType:@"JPG"];
    expect(path).toNot.beNil();
    __block Block *b;
    waitUntilTimeout(20, ^(DoneCallback done) {
      [Textile.instance.files addFiles:path threadId:thread.id_p caption:@"cool" completion:^(Block * _Nullable block, NSError * _Nonnull error) {
        expect(error).beNil();
        expect(block).notTo.beNil();
        NSLog(@"block id = %@", block.data_p);
        b = block;
        done();
      }];
      [Textile.instance stopWithCompletion:^(BOOL success, NSError * _Nullable error) {
        NSLog(@"STOOOOOOOPPED! - %@", error.localizedDescription);
      }];
    });
    assertWithTimeout(60, thatEventually(@([delegate.updatedItems containsObject:b.id_p])), isTrue());
    assertWithTimeout(120, thatEventually(@([delegate.completeItems containsObject:b.id_p])), isTrue());
    assertWithTimeout(130, thatEventually(@(delegate.stoppedCalledCount)), equalToInt(1));
  });

  it(@"should start again", ^{
    NSError *e;
    [Textile.instance start:&e];
    expect(e).beNil();
    assertWithTimeout(5, thatEventually(@(delegate.startedCalledCount)), equalToInt(2));
    assertWithTimeout(60, thatEventually(@(delegate.onlineCalledCount)), equalToInt(2));
  });

  it(@"should stop", ^{
    waitUntilTimeout(20, ^(DoneCallback done) {
      [Textile.instance stopWithCompletion:^(BOOL success, NSError * _Nullable error) {
        expect(error).beNil();
        expect(success).beTruthy();
        done();
      }];
    });
    assertWithTimeout(5, thatEventually(@(delegate.stoppedCalledCount)), equalToInt(2));
  });

});

SpecEnd
