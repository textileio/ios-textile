//
//  ProfileApi.m
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "ProfileApi.h"
#import <Mobile/Mobile.h>
#import "../node_modules/@textile/go-mobile/dist/ios/protos/Model.pbobjc.h"

@implementation ProfileApi

- (Contact *)profile:(NSError *__autoreleasing *)error {
  NSData *data = [self.textile.node profile:error];
  return [[Contact alloc] initWithData:data error:error];
}

- (NSString *)username:(NSError *__autoreleasing *)error {
  return [self.textile.node username:error];
}

- (void)setUsername:(NSString *)username error:(NSError *__autoreleasing *)error {
  [self.textile.node setUsername:username error:error];
}

- (NSString *)avatar:(NSError *__autoreleasing *)error {
  return [self.textile.node avatar:error];
}

- (void)setAvatar:(NSString *)hash error:(NSError *__autoreleasing *)error {
  [self.textile.node setAvatar:hash error:error];
}

@end
