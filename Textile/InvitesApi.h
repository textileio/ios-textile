//
//  InvitesApi.h
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "NodeDependant.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/View.pbobjc.h"

NS_ASSUME_NONNULL_BEGIN

@interface InvitesApi : NodeDependant

- (NSString *)addInvite:(NSString *)threadId inviteeId:(NSString *)inviteeId error:(NSError **)error;
- (NewInvite *)addExternalInvite:(NSString *)threadId error:(NSError **)error;
- (NSString *)acceptExternalInvite:(NSString *)inviteId key:(NSString *)key error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
