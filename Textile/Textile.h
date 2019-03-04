//
//  Textile.h
//  Textile
//
//  Created by Aaron Sutula on 2/28/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TextileDelegate.h"
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

+ (NSString *_Nullable)initializeWithDebug:(BOOL)debug logToDisk:(BOOL)logToDisk error:(NSError *_Nonnull*_Nonnull)error;
+ (Textile * _Nonnull)instance;

@property (nonatomic, strong) id<TextileDelegate> _Nullable delegate;

@property (nonatomic, readonly, strong) AccountApi  * _Nonnull account;
@property (nonatomic, readonly, strong) CafesApi  * _Nonnull cafes;
@property (nonatomic, readonly, strong) CommentsApi * _Nonnull comments;
@property (nonatomic, readonly, strong) ContactsApi * _Nonnull contacts;
@property (nonatomic, readonly, strong) FeedApi * _Nonnull feed;
@property (nonatomic, readonly, strong) FilesApi * _Nonnull files;
@property (nonatomic, readonly, strong) FlagsApi * _Nonnull flags;
@property (nonatomic, readonly, strong) IgnoresApi * _Nonnull ignores;
@property (nonatomic, readonly, strong) InvitesApi * _Nonnull invites;
@property (nonatomic, readonly, strong) IpfsApi * _Nonnull ipfsApi;
@property (nonatomic, readonly, strong) LikesApi * _Nonnull likesApi;
@property (nonatomic, readonly, strong) LogsApi * _Nonnull logsApi;
@property (nonatomic, readonly, strong) MessagesApi * _Nonnull messagesApi;
@property (nonatomic, readonly, strong) NotificationsApi * _Nonnull notificationsApi;
@property (nonatomic, readonly, strong) ProfileApi * _Nonnull profileApi;
@property (nonatomic, readonly, strong) ThreadsApi * _Nonnull threadsApi;

- (NSString *_Nonnull)version;
- (NSString *_Nonnull)gitSummary;
- (Summary *_Nonnull)summary:(NSError * _Nonnull __autoreleasing *_Nonnull)error;

@end
