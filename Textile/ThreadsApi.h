//
//  ThreadsApi.h
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "ApiModule.h"

@class Thread;
@class ThreadList;
@class AddThreadConfig;

NS_ASSUME_NONNULL_BEGIN

@interface ThreadsApi : ApiModule

- (Thread *)addThread:(AddThreadConfig *)config error:(NSError *__autoreleasing *)error;
- (void)addOrUpdateThread:(Thread *)thrd error:(NSError *__autoreleasing *)error;
- (Thread *)thread:(NSString *)threadId error:(NSError *__autoreleasing *)error;
- (ThreadList *)threads:(NSError *__autoreleasing *)error;
- (NSString *)removeThread:(NSString *)threadId error:(NSError *__autoreleasing *)error;

@end

NS_ASSUME_NONNULL_END
