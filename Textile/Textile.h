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

@interface Textile : NSObject

+ (NSString *)initializeWithDebug:(BOOL)debug logToDisk:(BOOL)logToDisk error:(NSError **)error;
+ (Textile *)instance;

@property (nonatomic, retain) AccountApi *account;
@property (nonatomic, retain) CafesApi *cafes;
@property (nonatomic, retain) CommentsApi *comments;
@property (nonatomic, retain) ContactsApi *contacts;
@property (nonatomic, retain) FeedApi *feed;
@property (nonatomic, retain) FilesApi *files;
@property (nonatomic, retain) FlagsApi *flags;
@property (nonatomic, retain) IgnoresApi *ignores;
@property (nonatomic, retain) InvitesApi *invites;
@property (nonatomic, retain) IpfsApi *ipfsApi;
@property (nonatomic, retain) LikesApi *likesApi;
@property (nonatomic, retain) LogsApi *logsApi;
@property (nonatomic, retain) MessagesApi *messagesApi;
@property (nonatomic, retain) NotificationsApi *notificationsApi;
@property (nonatomic, retain) ProfileApi *profileApi;
@property (nonatomic, retain) ThreadsApi *threadsApi;

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
