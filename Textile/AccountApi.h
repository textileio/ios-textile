//
//  Account.h
//  Textile
//
//  Created by Aaron Sutula on 2/28/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "ApiModule.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/Model.pbobjc.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/Query.pbobjc.h"

NS_ASSUME_NONNULL_BEGIN

@interface AccountApi : ApiModule

- (NSString *)address;
- (NSString *)seed;
- (NSData *)encrypt:(NSData *)data error:(NSError **)error;
- (NSData *)decrypt:(NSData *)data error:(NSError **)error;
- (ContactList *)accountPeers:(NSError **)error;
- (MobileSearchHandle *)findThreadBackups:(ThreadBackupQuery *)query options:(QueryOptions *)options error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
