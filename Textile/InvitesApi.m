//
//  InvitesApi.m
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "InvitesApi.h"

@implementation InvitesApi

- (NSString *)addInvite:(NSString *)threadId inviteeId:(NSString *)inviteeId error:(NSError *__autoreleasing *)error {
  return [self.node addInvite:threadId inviteeId:inviteeId error:error];
}

- (NewInvite *)addExternalInvite:(NSString *)threadId error:(NSError *__autoreleasing *)error {
  NSData *data = [self.node addExternalInvite:threadId error:error];
  return [[NewInvite alloc] initWithData:data error:error];
}

- (NSString *)acceptExternalInvite:(NSString *)inviteId key:(NSString *)key error:(NSError *__autoreleasing *)error {
  return [self.node acceptExternalInvite:inviteId key:key error:error];
}

@end
