//
//  NotificationsApi.h
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import <go_textile/go-textile-umbrella.h>
#import "NodeDependant.h"

NS_ASSUME_NONNULL_BEGIN

@interface NotificationsApi : NodeDependant

- (NotificationList *)notifications:(nullable NSString *)offset limit:(long)limit error:(NSError **)error;
- (long)countUnreadNotifications;
- (void)readNotification:(NSString *)notificationId error:(NSError **)error;
- (void)readAllNotifications:(NSError **)error;
- (NSString *)acceptInviteViaNotification:(NSString *)id_ error:(NSError **)error;
- (void)ignoreInviteViaNotification:(NSString *)id_ error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
