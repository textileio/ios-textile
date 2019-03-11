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

- (MobilePreparedFiles *)prepareFiles:(NSString *)path threadId:(NSString *)threadId error:(NSError **)error;
- (void)prepareFilesAsync:(NSString *)path threadId:(NSString *)threadId completion:(void (^)(MobilePreparedFiles * _Nullable, NSError *))completion;
- (Block *)addFiles:(Directory *)directory threadId:(NSString *)threadId caption:(nullable NSString *)caption error:(NSError **)error;
- (Block *)addFilesByTarget:(NSString *)target threadId:(NSString *)threadId caption:(nullable NSString *)caption error:(NSError **)error;
- (FilesList *)files:(nullable NSString *)offset limit:(long)limit threadId:(NSString *)threadId error:(NSError **)error;
- (NSString *)fileData:(NSString *)hash error:(NSError **)error;
- (NSString *)imageFileDataForMinWidth:(NSString *)path minWidth:(long)minWidth error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
