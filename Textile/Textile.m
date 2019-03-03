//
//  Textile.m
//  Textile
//
//  Created by Aaron Sutula on 2/28/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "Textile.h"
#import "Messenger.h"

@interface Textile()

@property (nonatomic, strong) MobileMobile *node;

@end

@implementation Textile

+ (NSString *)initializeWithDebug:(BOOL)debug logToDisk:(BOOL)logToDisk error:(NSError *__autoreleasing *)error {
  NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
  NSString *repoPath = [documents stringByAppendingPathComponent:@"textile-repo"];
  [Textile.instance newTextile:repoPath debug:debug error:error];
  if (*error && (*error).code == 1) {
    NSString *recoveryPhrase = [Textile.instance newWallet:12 error:error];
    MobileWalletAccount *account = [Textile.instance walletAccountAt:recoveryPhrase index:0 password:@"" error:error];
    [Textile.instance initRepo:account.seed repoPath:repoPath logToDisk:logToDisk debug:debug error:error];
    [Textile.instance newTextile:repoPath debug:debug error:error];
    [Textile.instance createNodeDependants];
    return recoveryPhrase;
  }
  [Textile.instance createNodeDependants];
  return nil;
}

+ (Textile *)instance {
  static Textile *instnace = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instnace = [[self alloc] init];
  });
  return instnace;
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

- (void)newTextile:(NSString *)repoPath debug:(BOOL)debug error:(NSError *__autoreleasing *)error {
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
  self.ipfsApi = [[IpfsApi alloc] initWithNode:self.node];
  self.likesApi = [[LikesApi alloc] initWithNode:self.node];
  self.logsApi = [[LogsApi alloc] initWithNode:self.node];
  self.messagesApi = [[MessagesApi alloc] initWithNode:self.node];
  self.notificationsApi = [[NotificationsApi alloc] initWithNode:self.node];
  self.profileApi = [[ProfileApi alloc] initWithNode:self.node];
  self.threadsApi = [[ThreadsApi alloc] initWithNode:self.node];
}

@end
