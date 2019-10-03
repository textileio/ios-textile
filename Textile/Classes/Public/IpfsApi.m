//
//  IpfsApi.m
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "IpfsApi.h"
#import "DataCallback.h"

@implementation IpfsApi

- (NSString *)peerId:(NSError * _Nullable __autoreleasing *)error {
  return [self.node peerId:error];
}

- (BOOL)swarmConnect:(NSString *)multiaddr error:(NSError * _Nullable __autoreleasing *)error {
  NSString *result = [self.node swarmConnect:multiaddr error:error];
  return [result length] > 0;
}

- (void)dataAtPath:(NSString *)path completion:(void (^)(NSData * _Nullable, NSString * _Nullable, NSError * _Nonnull))completion {
  DataCallback *cb = [[DataCallback alloc] initWithCompletion:^(NSData *data, NSString *media, NSError *error) {
    if (error) {
      completion(nil, nil, error);
    } else {
      NSError *error;
      completion(data, media, error);
    }
  }];
  [self.node dataAtPath:path cb:cb];
}

@end
