//
//  InvitesApi.h
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "ApiModule.h"

@class NewInvite;

NS_ASSUME_NONNULL_BEGIN

@interface InvitesApi : ApiModule

- (NSString *)addInvite:(NSString *)threadId inviteeId:(NSString *)inviteeId error:(NSError *__autoreleasing *)error;
- (NewInvite *)addExternalInvite:(NSString *)threadId error:(NSError *__autoreleasing *)error;
- (NSString *)acceptExternalInvite:(NSString *)inviteId key:(NSString *)key error:(NSError *__autoreleasing *)error;

@end

NS_ASSUME_NONNULL_END
