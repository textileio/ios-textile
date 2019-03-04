//
//  MessagesApi.h
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "NodeDependant.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/View.pbobjc.h"

NS_ASSUME_NONNULL_BEGIN

@interface MessagesApi : NodeDependant

- (NSString *)addMessage:(NSString *)threadId body:(NSString *)body error:(NSError *__autoreleasing *)error;
- (TextList *)messages:(NSString *)offset limit:(long)limit threadId:(NSString *)threadId error:(NSError *__autoreleasing *)error;

@end

NS_ASSUME_NONNULL_END
