//
//  ThreadsApi.m
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "ThreadsApi.h"
#import <Mobile/Mobile.h>
#import "../node_modules/@textile/go-mobile/dist/ios/protos/Model.pbobjc.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/View.pbobjc.h"

@implementation ThreadsApi

- (Thread *)addThread:(AddThreadConfig *)config error:(NSError *__autoreleasing *)error {
  NSData *data = [self.textile.node addThread:config.data error:error];
  return [[Thread alloc] initWithData:data error:error];
}

- (void)addOrUpdateThread:(Thread *)thrd error:(NSError *__autoreleasing *)error {
  [self.textile.node addOrUpdateThread:thrd.data error:error];
}

- (Thread *)thread:(NSString *)threadId error:(NSError *__autoreleasing *)error {
  NSData *data = [self.textile.node thread:threadId error:error];
  return [[Thread alloc] initWithData:data error:error];
}

- (ThreadList *)threads:(NSError *__autoreleasing *)error {
  NSData *data = [self.textile.node threads:error];
  return [[ThreadList alloc] initWithData:data error:error];
}

- (NSString *)removeThread:(NSString *)threadId error:(NSError *__autoreleasing *)error {
  return [self.textile.node removeThread:threadId error:error];
}

@end
