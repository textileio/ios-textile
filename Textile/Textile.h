//
//  Textile.h
//  Textile
//
//  Created by Aaron Sutula on 2/28/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AccountApi.h"
#import "CafesApi.h"
#import "CommentsApi.h"
#import "ContactsApi.h"
#import "FeedApi.h"
#import "FilesApi.h"
#import "FlagsApi.h"
#import "IgnoresApi.h"
#import "InvitesApi.h"
#import "IpfsApi.h"
#import "LikesApi.h"
#import "LogsApi.h"
#import "MessagesApi.h"
#import "NotificationsApi.h"
#import "ProfileApi.h"
#import "ThreadsApi.h"

typedef NS_CLOSED_ENUM(NSInteger, TextileNodeState) {
  TextileNodeStateStopped,
  TextileNodeStateStarted,
  TextileNodeStateOnline
};

@interface TextileNodeStatus : NSObject

@property (nonatomic, readonly, assign) TextileNodeState nodeState;
@property (nonatomic, readonly, strong) NSError *error;

@end

@interface Textile : NSObject

+ (NSString *)initializeWithDebug:(BOOL)debug logToDisk:(BOOL)logToDisk error:(NSError **)error;
+ (Textile *)instance;

@property (atomic, readonly, strong) TextileNodeStatus *status;

@property (nonatomic, readonly, strong) AccountApi *account;
@property (nonatomic, readonly, strong) CafesApi *cafes;
@property (nonatomic, readonly, strong) CommentsApi *comments;
@property (nonatomic, readonly, strong) ContactsApi *contacts;
@property (nonatomic, readonly, strong) FeedApi *feed;
@property (nonatomic, readonly, strong) FilesApi *files;
@property (nonatomic, readonly, strong) FlagsApi *flags;
@property (nonatomic, readonly, strong) IgnoresApi *ignores;
@property (nonatomic, readonly, strong) InvitesApi *invites;
@property (nonatomic, readonly, strong) IpfsApi *ipfsApi;
@property (nonatomic, readonly, strong) LikesApi *likesApi;
@property (nonatomic, readonly, strong) LogsApi *logsApi;
@property (nonatomic, readonly, strong) MessagesApi *messagesApi;
@property (nonatomic, readonly, strong) NotificationsApi *notificationsApi;
@property (nonatomic, readonly, strong) ProfileApi *profileApi;
@property (nonatomic, readonly, strong) ThreadsApi *threadsApi;

- (NSString *)newWallet:(NSInteger)wordCount error:(NSError **)error;
- (MobileWalletAccount *)walletAccountAt:(NSString *)phrase index:(NSInteger)index password:(NSString *)password error:(NSError **)error;
- (void)initRepo:(NSString *)seed repoPath:(NSString *)repoPath logToDisk:(BOOL)logToDisk debug:(BOOL)debug error:(NSError **)error;
- (void)migrateRepo:(NSString *)repoPath error:(NSError **)error;
- (void)newTextile:(NSString *)repoPath debug:(BOOL)debug error:(NSError **)error;
- (void)start:(NSError **)error;
- (void)stop:(NSError **)error;
- (NSString *)version;
- (NSString *)gitSummary;
- (Summary *)summary:(NSError **)error;

@end
