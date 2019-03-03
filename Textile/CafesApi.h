//
//  Cafe.h
//  Textile
//
//  Created by Aaron Sutula on 2/28/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "ApiModule.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/Model.pbobjc.h"

NS_ASSUME_NONNULL_BEGIN

@interface CafesApi : ApiModule

- (void)registerCafe:(NSString *)host token:(NSString *)token error:(NSError **)error;
- (CafeSession *)cafeSession:(NSString *)peerId error:(NSError **)error;
- (CafeSessionList *)cafeSessions:(NSError **)error;
- (CafeSession *)refreshCafeSession:(NSString *)peerId error:(NSError **)error;
- (void)deregisterCafe:(NSString *)peerId error:(NSError **)error;
- (void)checkCafeMessages:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
