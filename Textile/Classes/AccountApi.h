//
//  Account.h
//  Textile
//
//  Created by Aaron Sutula on 2/28/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import <TextileCore/Model.pbobjc.h>
#import <TextileCore/Query.pbobjc.h>
#import "NodeDependant.h"

NS_ASSUME_NONNULL_BEGIN

@interface AccountApi : NodeDependant

- (NSString *)address;
- (Contact *)contact:(NSError **)error;
- (nullable NSData *)decrypt:(NSData *)data error:(NSError **)error;
- (void)delete:(NSString *)repoPath address:(NSString *)address error:(NSError **)error;
- (nullable NSData *)encrypt:(NSData *)data error:(NSError **)error;
- (NSString *)seed;
- (MobileSearchHandle *)sync:(QueryOptions *)options error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
