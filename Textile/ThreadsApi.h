//
//  ThreadsApi.h
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "NodeDependant.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/Model.pbobjc.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/View.pbobjc.h"

NS_ASSUME_NONNULL_BEGIN

@interface ThreadsApi : NodeDependant

- (Thread *)addThread:(AddThreadConfig *)config error:(NSError *__autoreleasing *)error;
- (void)addOrUpdateThread:(Thread *)thrd error:(NSError *__autoreleasing *)error;
- (Thread *)thread:(NSString *)threadId error:(NSError *__autoreleasing *)error;
- (ThreadList *)threads:(NSError *__autoreleasing *)error;
- (NSString *)removeThread:(NSString *)threadId error:(NSError *__autoreleasing *)error;

@end

NS_ASSUME_NONNULL_END
