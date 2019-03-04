//
//  ProfileApi.h
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "NodeDependant.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/Model.pbobjc.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProfileApi : NodeDependant

- (Contact *)profile:(NSError *__autoreleasing *)error;
- (NSString *)username:(NSError *__autoreleasing *)error;
- (void)setUsername:(NSString *)username error:(NSError *__autoreleasing *)error;
- (NSString *)avatar:(NSError *__autoreleasing *)error;
- (void)setAvatar:(NSString *)hash error:(NSError *__autoreleasing *)error;

@end

NS_ASSUME_NONNULL_END
