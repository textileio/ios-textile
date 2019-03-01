//
//  Account.m
//  Textile
//
//  Created by Aaron Sutula on 2/28/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "AccountApi.h"
#import <Mobile/Mobile.h>
#import "../node_modules/@textile/go-mobile/dist/ios/protos/Model.pbobjc.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/Query.pbobjc.h"

@implementation AccountApi

- (NSString *)address {
  return self.textile.node.address;
}

- (NSString *)seed {
  return self.textile.node.seed;
}

- (NSData *)encrypt:(NSData *)data error:(NSError **)error {
  return [self.textile.node encrypt:data error:error];
}

- (NSData *)decrypt:(NSData *)data error:(NSError **)error {
  return [self.textile.node decrypt:data error:error];
}

- (ContactList *)accountPeers:(NSError **)error {
  NSData *data = [self.textile.node accountPeers:error];
  return [[ContactList alloc] initWithData:data error:error];
}

- (MobileSearchHandle *)findThreadBackups:(ThreadBackupQuery *)query options:(QueryOptions *)options error:(NSError **)error {
  return [self.textile.node findThreadBackups:query.data options:options.data error:error];
}

@end
