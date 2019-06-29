//
//  TextileApi.m
//  Textile
//
//  Created by Aaron Sutula on 2/28/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "TextileApi.h"
#import "Messenger.h"
#import "LifecycleManager.h"
#import "RequestsHandler.h"
#import "TEXWallet.h"

NSString *const TEXTILE_BACKGROUND_SESSION_ID = @"textile";

@interface Textile()

@property (nonatomic, strong) Messenger *messenger;

@property (nonatomic, strong) MobileMobile *node;

@property (nonatomic, strong) AccountApi *account;
@property (nonatomic, strong) CafesApi *cafes;
@property (nonatomic, strong) CommentsApi *comments;
@property (nonatomic, strong) ContactsApi *contacts;
@property (nonatomic, strong) FeedApi *feed;
@property (nonatomic, strong) FilesApi *files;
@property (nonatomic, strong) FlagsApi *flags;
@property (nonatomic, strong) IgnoresApi *ignores;
@property (nonatomic, strong) InvitesApi *invites;
@property (nonatomic, strong) IpfsApi *ipfs;
@property (nonatomic, strong) LikesApi *likes;
@property (nonatomic, strong) LogsApi *logs;
@property (nonatomic, strong) MessagesApi *messages;
@property (nonatomic, strong) NotificationsApi *notifications;
@property (nonatomic, strong) ProfileApi *profile;
@property (nonatomic, strong) SchemasApi *schemas;
@property (nonatomic, strong) ThreadsApi *threads;

@property (nonatomic, strong) NSString *repoPath;

@property (nonatomic, strong) LifecycleManager *lifecycleManager;
@property (nonatomic, strong) RequestsHandler *requestsHandler;

+ (BOOL)initRepo:(NSString *)seed repoPath:(NSString *)repoPath logToDisk:(BOOL)logToDisk debug:(BOOL)debug error:(NSError **)error;
+ (BOOL)deleteRepo:(NSString *)repoPath error:(NSError **)error;
- (void)migrateRepo:(NSString *)repoPath error:(NSError **)error;
- (MobileMobile *)newTextile:(NSString *)repoPath debug:(BOOL)debug error:(NSError **)error;
- (void)start:(NSError **)error;
- (void)stop:(NSError **)error;

@end

@implementation Textile

+ (BOOL)initRepo:(NSString *)seed repoPath:(NSString *)repoPath logToDisk:(BOOL)logToDisk debug:(BOOL)debug error:(NSError *__autoreleasing *)error {
  MobileInitConfig *config = [[MobileInitConfig alloc] init];
  config.seed = seed;
  config.repoPath = repoPath;
  config.logToDisk = logToDisk;
  config.debug = debug;
  return MobileInitRepo(config, error);
}

+ (BOOL)deleteRepo:(NSString *)repoPath error:(NSError * _Nullable __autoreleasing *)error {
  BOOL exists = [NSFileManager.defaultManager fileExistsAtPath:repoPath];
  if (exists) {
    return [NSFileManager.defaultManager removeItemAtPath:repoPath error:error];
  } else {
    return YES;
  }
}

+ (BOOL)isInitialized:(NSString *)repoPath {
  BOOL isDir;
  BOOL exists = [NSFileManager.defaultManager fileExistsAtPath:repoPath isDirectory:&isDir];
  return exists && isDir;
}

+ (BOOL)initialize:(NSString *)repoPath seed:(NSString *)seed debug:(BOOL)debug logToDisk:(BOOL)logToDisk error:(NSError * _Nullable __autoreleasing *)error {
  BOOL deleted = [Textile deleteRepo:repoPath error:error];
  if (!deleted) {
    return NO;
  }
  return [Textile initRepo:seed repoPath:repoPath logToDisk:logToDisk debug:debug error:error];
}

+ (NSString *)initializeCreatingNewWalletAndAccount:(NSString *)repoPath debug:(BOOL)debug logToDisk:(BOOL)logToDisk error:(NSError * _Nullable __autoreleasing *)error {
  NSString *recoveryPhrase = [TEXWallet newWallet:12 error:error];
  if (!recoveryPhrase) {
    return nil;
  }
  MobileWalletAccount *account = [TEXWallet walletAccountAt:recoveryPhrase index:0 password:@"" error:error];
  if (!account) {
    return nil;
  }
  BOOL initialized = [Textile initialize:repoPath seed:account.seed debug:debug logToDisk:logToDisk error:error];
  if (!initialized) {
    return nil;
  }
  return recoveryPhrase;
}

+ (BOOL)launch:(NSString *)repoPath debug:(BOOL)debug error:(NSError * _Nullable __autoreleasing *)error {
  Textile.instance.repoPath = repoPath;
  Textile.instance.requestsHandler = [[RequestsHandler alloc] init];
  Textile.instance.messenger = [[Messenger alloc] init];
  MobileMobile *node = [Textile.instance newTextile:repoPath debug:debug error:error];
  if (node) {
    Textile.instance.node = node;
    [Textile.instance createNodeDependants];
    return YES;
  } else {
    return NO;
  }
}

+ (Textile *)instance {
  static Textile *instnace = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instnace = [[self alloc] init];
  });
  return instnace;
}

- (void)setDelegate:(id<TextileDelegate>)delegate {
  _delegate = delegate;
  self.lifecycleManager.delegate = delegate;
  self.messenger.delegate = delegate;
}

- (void)migrateRepo:(NSString *)repoPath error:(NSError *__autoreleasing *)error {
  MobileMigrateConfig *config = [[MobileMigrateConfig alloc] init];
  config.repoPath = repoPath;
  MobileMigrateRepo(config, error);
}

- (MobileMobile *)newTextile:(NSString *)repoPath debug:(BOOL)debug error:(NSError *__autoreleasing *)error {
  MobileRunConfig *config = [[MobileRunConfig alloc] init];
  config.repoPath = repoPath;
  config.debug = debug;
  config.cafeOutboxHandler = self.requestsHandler;
  return MobileNewTextile(config, self.messenger, error);
}

- (void)start:(NSError *__autoreleasing *)error {
  [self.node start:error];
}

- (void)stop:(NSError *__autoreleasing *)error {
  [self.node stop:error];
}

- (NSString *)version {
  return [self.node version];
}

- (NSString *)gitSummary {
  return [self.node gitSummary];
}

- (Summary *)summary:(NSError * _Nullable __autoreleasing *)error {
  NSData *data = [self.node summary:error];
  if (*error) {
    return nil;
  }
  return [[Summary alloc] initWithData:data error:error];
}

- (void)destroy:(NSError * _Nullable __autoreleasing *)error {
  [self.node stop:error];
  if (!*error) {
    self.delegate = nil;
    self.node = nil;
    self.messenger = nil;

    self.account = nil;
    self.cafes = nil;
    self.comments = nil;
    self.contacts = nil;
    self.feed = nil;
    self.files = nil;
    self.flags = nil;
    self.ignores = nil;
    self.invites = nil;
    self.ipfs = nil;
    self.likes = nil;
    self.logs = nil;
    self.messages = nil;
    self.notifications = nil;
    self.profile = nil;
    self.schemas = nil;
    self.threads = nil;

    self.repoPath = nil;

    self.lifecycleManager = nil;
  }
}

- (void)createNodeDependants {
  self.account = [[AccountApi alloc] initWithNode:self.node];
  self.cafes = [[CafesApi alloc] initWithNode:self.node];
  self.comments = [[CommentsApi alloc] initWithNode:self.node];
  self.contacts = [[ContactsApi alloc] initWithNode:self.node];
  self.feed = [[FeedApi alloc] initWithNode:self.node];
  self.files = [[FilesApi alloc] initWithNode:self.node];
  self.flags = [[FlagsApi alloc] initWithNode:self.node];
  self.ignores = [[IgnoresApi alloc] initWithNode:self.node];
  self.invites = [[InvitesApi alloc] initWithNode:self.node];
  self.ipfs = [[IpfsApi alloc] initWithNode:self.node];
  self.likes = [[LikesApi alloc] initWithNode:self.node];
  self.logs = [[LogsApi alloc] initWithNode:self.node];
  self.messages = [[MessagesApi alloc] initWithNode:self.node];
  self.notifications = [[NotificationsApi alloc] initWithNode:self.node];
  self.profile = [[ProfileApi alloc] initWithNode:self.node];
  self.schemas = [[SchemasApi alloc] initWithNode:self.node];
  self.threads = [[ThreadsApi alloc] initWithNode:self.node];

  self.lifecycleManager = [[LifecycleManager alloc] initWithNode:self.node];
  self.lifecycleManager.delegate = self.delegate;

  self.requestsHandler.node = self.node;
}

@end
