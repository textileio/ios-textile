//
//  Textile.h
//  Textile
//
//  Created by Aaron Sutula on 2/28/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MobileMobile;
@class AccountApi;
@class CafesApi;
@class CommentsApi;
@class ContactsApi;
@class FeedApi;
@class FilesApi;
@class FlagsApi;
@class IgnoresApi;
@class InvitesApi;
@class IpfsApi;
@class LikesApi;
@class LogsApi;
@class MobileWalletAccount;
@class Summary;

@interface Textile : NSObject

+ (id)instance;

@property (nonatomic, strong) MobileMobile *node;
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
