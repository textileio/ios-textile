//
//  TextileDelegate.h
//  Textile
//
//  Created by Aaron Sutula on 3/4/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "../node_modules/@textile/go-mobile/dist/ios/protos/Model.pbobjc.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/View.pbobjc.h"

#ifndef TextileDelegate_h
#define TextileDelegate_h

@protocol TextileDelegate <NSObject>

@optional
- (void)nodeDidStart;

@optional
- (void)nodeFailedToStartWithError:(NSError * _Nonnull)error;

@optional
- (void)nodeDidStop;

@optional
- (void)nodeFailedToStopWithError:(NSError * _Nonnull)error;

@optional
- (void)nodeOnline;

@optional
- (void)notificationReceived:(Notification * _Nonnull)notification;

@optional
- (void)threadUpdateReceived:(FeedItem * _Nonnull)feedItem;

// TODO: should we break this down into more specfic update events?
@optional
- (void)walletUpdateReceived:(WalletUpdate * _Nonnull)walletUpdate;

@optional
- (void)queryDone:(NSString * _Nonnull)queryId;

@optional
- (void)queryError:(NSString * _Nonnull)queryId error:(NSError * _Nonnull)error;

@optional
- (void)clientThreadQueryResult:(NSString * _Nonnull)queryId clientThread:(CafeClientThread * _Nonnull)clientThread;

@optional
- (void)contactQueryResult:(NSString * _Nonnull)queryId contact:(Contact * _Nonnull)contact;

@end


#endif /* TextileDelegate_h */
