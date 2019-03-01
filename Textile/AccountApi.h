//
//  Account.h
//  Textile
//
//  Created by Aaron Sutula on 2/28/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApiModule.h"

@class ContactList;
@class MobileSearchHandle;
@class ThreadBackupQuery;
@class QueryOptions;

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
