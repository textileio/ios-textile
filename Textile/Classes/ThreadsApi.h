//
//  ThreadsApi.h
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import <go_textile/go-textile-umbrella.h>
#import "NodeDependant.h"

NS_ASSUME_NONNULL_BEGIN

@interface ThreadsApi : NodeDependant

- (Thread *)addThread:(AddThreadConfig *)config error:(NSError **)error;
- (void)addOrUpdateThread:(Thread *)thrd error:(NSError **)error;
- (Thread *)thread:(NSString *)threadId error:(NSError **)error;
- (ThreadList *)threads:(NSError **)error;
- (NSString *)removeThread:(NSString *)threadId error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
