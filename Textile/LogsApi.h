//
//  LogsApi.h
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "NodeDependant.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/View.pbobjc.h"

NS_ASSUME_NONNULL_BEGIN

@interface LogsApi : NodeDependant

- (void)setLogLevel:(LogLevel *)level error:(NSError *__autoreleasing *)error;

@end

NS_ASSUME_NONNULL_END
