//
//  ProfileApi.h
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "ApiModule.h"

@class Contact;

NS_ASSUME_NONNULL_BEGIN

@interface ProfileApi : ApiModule

- (Contact *)profile:(NSError *__autoreleasing *)error;
- (NSString *)username:(NSError *__autoreleasing *)error;
- (void)setUsername:(NSString *)username error:(NSError *__autoreleasing *)error;
- (NSString *)avatar:(NSError *__autoreleasing *)error;
- (void)setAvatar:(NSString *)hash error:(NSError *__autoreleasing *)error;

@end

NS_ASSUME_NONNULL_END
