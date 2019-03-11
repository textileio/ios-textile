//
//  Cafe.h
//  Textile
//
//  Created by Aaron Sutula on 2/28/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import <go_textile/go-textile-umbrella.h>
#import "NodeDependant.h"

NS_ASSUME_NONNULL_BEGIN

@interface CafesApi : NodeDependant

- (void)registerCafe:(NSString *)host token:(NSString *)token error:(NSError **)error;
- (CafeSession *)cafeSession:(NSString *)peerId error:(NSError **)error;
- (CafeSessionList *)cafeSessions:(NSError **)error;
- (CafeSession *)refreshCafeSession:(NSString *)peerId error:(NSError **)error;
- (void)deregisterCafe:(NSString *)peerId error:(NSError **)error;
- (void)checkCafeMessages:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
