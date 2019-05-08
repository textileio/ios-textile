//
//  Account.m
//  Textile
//
//  Created by Aaron Sutula on 2/28/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "AccountApi.h"

@implementation AccountApi

- (NSString *)address {
  return self.node.address;
}

- (Contact *)contact:(NSError * _Nullable __autoreleasing *)error {
  NSData *data = [self.node accountContact:error];
  if (*error) {
    return nil;
  }
  return [[Contact alloc] initWithData:data error:error];
}

- (NSData *)decrypt:(NSData *)data error:(NSError * _Nullable __autoreleasing *)error {
  return [self.node decrypt:data error:error];
}

- (void)delete:(NSString *)repoPath address:(NSString *)address  error:(NSError * _Nullable __autoreleasing *)error {
  [self.node deleteAccount:repoPath address:address error:error];
}

- (NSData *)encrypt:(NSData *)data error:(NSError * _Nullable __autoreleasing *)error {
  return [self.node encrypt:data error:error];
}

- (NSString *)seed {
  return self.node.seed;
}

- (MobileSearchHandle *)sync:(QueryOptions *)options error:(NSError * _Nullable __autoreleasing *)error {
  return [self.node syncAccount:options.data error:error];
}

@end
