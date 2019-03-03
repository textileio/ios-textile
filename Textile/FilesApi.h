//
//  FilesApi.h
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "ApiModule.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/Model.pbobjc.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/Mobile.pbobjc.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/View.pbobjc.h"

NS_ASSUME_NONNULL_BEGIN

@interface FilesApi : ApiModule

- (FileIndex *)addSchema:(NSString *)jsonString error:(NSError **)error;
- (MobilePreparedFiles *)prepareFiles:(NSString *)path threadId:(NSString *)threadId error:(NSError **)error;
- (void)prepareFilesAsync:(NSString *)path threadId:(NSString *)threadId completion:(void (^)(MobilePreparedFiles *, NSError *))completion;
- (Block *)addFiles:(Directory *)directory threadId:(NSString *)threadId caption:(NSString *)caption error:(NSError **)error;
- (Block *)addFilesByTarget:(NSString *)target threadId:(NSString *)threadId caption:(NSString *)caption error:(NSError **)error;
- (FilesList *)files:(NSString *)offset limit:(long)limit threadId:(NSString *)threadId error:(NSError **)error;
- (MobileFileData *)fileData:(NSString *)hash error:(NSError **)error;
- (MobileFileData *)imageFileDataForMinWidth:(NSString *)path minWidth:(long)minWidth error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
