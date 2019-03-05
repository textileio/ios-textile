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

NS_ASSUME_NONNULL_BEGIN

@protocol TextileDelegate <NSObject>

@optional
- (void)nodeStarted;

@optional
- (void)nodeFailedToStartWithError:(NSError *)error;

@optional
- (void)nodeStopped;

@optional
- (void)nodeFailedToStopWithError:(NSError *)error;

@optional
- (void)nodeOnline;

@optional
- (void)notificationReceived:(Notification *)notification;

@optional
- (void)threadUpdateReceived:(FeedItem *)feedItem;

// TODO: should we break this down into more specfic update events?
@optional
- (void)walletUpdateReceived:(WalletUpdate *)walletUpdate;

@optional
- (void)queryDone:(NSString *)queryId;

@optional
- (void)queryError:(NSString *)queryId error:(NSError *)error;

@optional
- (void)clientThreadQueryResult:(NSString *)queryId clientThread:(CafeClientThread *)clientThread;

@optional
- (void)contactQueryResult:(NSString *)queryId contact:(Contact *)contact;

@end

NS_ASSUME_NONNULL_END


#endif /* TextileDelegate_h */
