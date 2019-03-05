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

- (Contact *)profile:(NSError **)error;
- (NSString *)username:(NSError **)error;
- (void)setUsername:(NSString *)username error:(NSError **)error;
- (NSString *)avatar:(NSError **)error;
- (void)setAvatar:(NSString *)hash error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
