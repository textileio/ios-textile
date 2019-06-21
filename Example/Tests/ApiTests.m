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

SpecBegin(ApiSpecs)

describe(@"public api", ^{

  __block TextileDelegateMock *delegate = [[TextileDelegateMock alloc] init];
  NSString *threadKey = @"threadKey";
  __block Thread *thread;

  it(@"should be initialized", ^{
    NSError *e;
    NSString *phrase = [Textile initializeWithDebug:NO logToDisk:NO error:&e];
    Textile.instance.delegate = delegate;
    expect(phrase).notTo.beNil();
    expect(phrase.length).beGreaterThan(0);
    expect(e).beNil();
  });

  it(@"should notify node started and online", ^{
    assertWithTimeout(5, thatEventually(@(delegate.startedCalled)), isTrue());
    assertWithTimeout(60, thatEventually(@(delegate.onlineCalled)), isTrue());
  });

  it(@"should register a cafe", ^{
    NSError *e;
    [Textile.instance.cafes
     register:@"12D3KooWGN8VAsPHsHeJtoTbbzsGjs2LTmQZ6wFKvuPich1TYmYY"
     token:@"uggU4NcVGFSPchULpa2zG2NRjw2bFzaiJo3BYAgaFyzCUPRLuAgToE3HXPyo"
     error:&e];
    expect(e).beNil();
  });

  it(@"should create a thread", ^{
    AddThreadConfig_Schema *schema = [[AddThreadConfig_Schema alloc] init];
    schema.preset = AddThreadConfig_Schema_Preset_Media;
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
    assertWithTimeout(60, thatEventually(@([delegate.completeItems containsObject:val])), isTrue());
  });

  it(@"should add an image", ^{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"TEST1" ofType:@"JPG"];
    expect(path).toNot.beNil();
    Strings *strings = [[Strings alloc] init];
    [strings.valuesArray addObject:path];
    waitUntilTimeout(5, ^(DoneCallback done) {
      Strings *strings = [[Strings alloc] init];
      [strings.valuesArray addObject:path];
      [Textile.instance.files addFiles:strings threadId:thread.id_p caption:@"cool" completion:^(Block * _Nullable block, NSError * _Nonnull error) {
        expect(error).beNil();
        expect(block).notTo.beNil();
        done();
      }];
    });
  });
});

SpecEnd
