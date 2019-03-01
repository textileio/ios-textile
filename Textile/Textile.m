//
//  Textile.m
//  Textile
//
//  Created by Aaron Sutula on 2/28/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "Textile.h"
#import "AccountApi.h"
#import "CafesApi.h"
#import "CommentsApi.h"
#import "ContactsApi.h"
#import "FeedApi.h"
#import "FilesApi.h"
#import "FlagsApi.h"
#import "IgnoresApi.h"
#import <Mobile/Mobile.h>
#import "../node_modules/@textile/go-mobile/dist/ios/protos/Mobile.pbobjc.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/View.pbobjc.h"
#import "Messenger.h"

@implementation Textile

+ (id)instance {
  static Textile *instnace = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instnace = [[self alloc] init];
  });
  return instnace;
}

- (id)init {
  if (self = [super init]) {
    self.account = [[AccountApi alloc] initWithTextile:self];
    self.cafes = [[CafesApi alloc] initWithTextile:self];
    self.comments = [[CommentsApi alloc] initWithTextile:self];
    self.contacts = [[ContactsApi alloc] initWithTextile:self];
    self.feed = [[FeedApi alloc] initWithTextile:self];
    self.files = [[FilesApi alloc] initWithTextile:self];
    self.flags = [[FlagsApi alloc] initWithTextile:self];
    self.ignores = [[IgnoresApi alloc] initWithTextile:self];
  }
  return self;
}

- (NSString *)newWallet:(NSInteger)wordCount error:(NSError **)error {
  NSString *recoveryPhrase = MobileNewWallet(wordCount, error);
  return recoveryPhrase;
}

- (MobileWalletAccount *)walletAccountAt:(NSString *)phrase index:(NSInteger)index password:(NSString *)password error:(NSError **)error {
  NSData *data = MobileWalletAccountAt(phrase, index, password, error);
  MobileWalletAccount *account = [[MobileWalletAccount alloc] initWithData:data error:error];
  return account;
}

- (void)initRepo:(NSString *)seed repoPath:(NSString *)repoPath logToDisk:(BOOL)logToDisk debug:(BOOL)debug error:(NSError **)error {
  MobileInitConfig *config = [[MobileInitConfig alloc] init];
  config.seed = seed;
  config.repoPath = repoPath;
  config.logToDisk = logToDisk;
  config.debug = debug;
  MobileInitRepo(config, error);
}

- (void)migrateRepo:(NSString *)repoPath error:(NSError **)error {
  MobileMigrateConfig *config = [[MobileMigrateConfig alloc] init];
  config.repoPath = repoPath;
  MobileMigrateRepo(config, error);
}

- (void)newTextile:(NSString *)repoPath debug:(BOOL)debug error:(NSError **)error {
  if (!self.node) {
    MobileRunConfig *config = [[MobileRunConfig alloc] init];
    config.repoPath = repoPath;
    config.debug = debug;
    self.node = MobileNewTextile(config, [[Messenger alloc] init], error);
  }
}

- (void)start:(NSError **)error {
  [self.node start:error];
}

- (void)stop:(NSError **)error {
  [self.node stop:error];
}

- (NSString *)version {
  return [self.node version];
}

- (NSString *)gitSummary {
  return [self.node gitSummary];
}

- (Summary *)summary:(NSError **)error {
  NSData *data = [self.node summary:error];
  return [[Summary alloc] initWithData:data error:error];
}

@end
