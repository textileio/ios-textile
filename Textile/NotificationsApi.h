//
//  NotificationsApi.h
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "ApiModule.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/Model.pbobjc.h"

NS_ASSUME_NONNULL_BEGIN

@interface NotificationsApi : ApiModule

- (NotificationList *)notifications:(NSString *)offset limit:(long)limit error:(NSError *__autoreleasing *)error;
- (long)countUnreadNotifications;
- (void)readNotification:(NSString *)notificationId error:(NSError *__autoreleasing *)error;
- (void)readAllNotifications:(NSError *__autoreleasing *)error;
- (NSString *)acceptInviteViaNotification:(NSString *)id_ error:(NSError *__autoreleasing *)error;
- (void)ignoreInviteViaNotification:(NSString *)id_ error:(NSError *__autoreleasing *)error;

@end

NS_ASSUME_NONNULL_END
