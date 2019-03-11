//
//  FilesApi.h
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import <go_textile/go-textile-umbrella.h>
#import "NodeDependant.h"

NS_ASSUME_NONNULL_BEGIN

@interface FilesApi : NodeDependant

- (MobilePreparedFiles *)prepare:(NSString *)path threadId:(NSString *)threadId error:(NSError **)error;
- (void)prepareAsync:(NSString *)path threadId:(NSString *)threadId completion:(void (^)(MobilePreparedFiles * _Nullable, NSError *))completion;
- (Block *)add:(Directory *)directory threadId:(NSString *)threadId caption:(nullable NSString *)caption error:(NSError **)error;
- (Block *)addByTarget:(NSString *)target threadId:(NSString *)threadId caption:(nullable NSString *)caption error:(NSError **)error;
- (FilesList *)list:(nullable NSString *)offset limit:(long)limit threadId:(NSString *)threadId error:(NSError **)error;
- (NSString *)data:(NSString *)hash error:(NSError **)error;
- (NSString *)imageDataForMinWidth:(NSString *)path minWidth:(long)minWidth error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
