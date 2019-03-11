//
//  ThreadsApi.m
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "ThreadsApi.h"

@implementation ThreadsApi

- (Thread *)addThread:(AddThreadConfig *)config error:(NSError * _Nullable __autoreleasing *)error {
  NSData *data = [self.node addThread:config.data error:error];
  return [[Thread alloc] initWithData:data error:error];
}

- (void)addOrUpdateThread:(Thread *)thrd error:(NSError * _Nullable __autoreleasing *)error {
  [self.node addOrUpdateThread:thrd.data error:error];
}

- (Thread *)thread:(NSString *)threadId error:(NSError * _Nullable __autoreleasing *)error {
  NSData *data = [self.node thread:threadId error:error];
  return [[Thread alloc] initWithData:data error:error];
}

- (ThreadList *)threads:(NSError * _Nullable __autoreleasing *)error {
  NSData *data = [self.node threads:error];
  return [[ThreadList alloc] initWithData:data error:error];
}

- (NSString *)removeThread:(NSString *)threadId error:(NSError * _Nullable __autoreleasing *)error {
  return [self.node removeThread:threadId error:error];
}

@end
