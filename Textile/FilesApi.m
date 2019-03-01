//
//  FilesApi.m
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "FilesApi.h"
#import <Mobile/Mobile.h>
#import "Callback.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/Model.pbobjc.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/Mobile.pbobjc.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/View.pbobjc.h"

@implementation FilesApi

- (FileIndex *)addSchema:(NSString *)jsonString error:(NSError **)error {
  NSData *data = [self.textile.node addSchema:jsonString error:error];
  return [[FileIndex alloc] initWithData:data error:error];
}

- (MobilePreparedFiles *)prepareFiles:(NSString *)path threadId:(NSString *)threadId error:(NSError **)error {
  NSData *data = [self.textile.node prepareFiles:path threadId:threadId error:error];
  return [[MobilePreparedFiles alloc] initWithData:data error:error];
}

- (void)prepareFilesAsync:(NSString *)path threadId:(NSString *)threadId completion:(void (^)(MobilePreparedFiles *, NSError *))completion {
  Callback *cb = [[Callback alloc] initWithCompletion:^(NSData *data, NSError *error) {
    if (error) {
      completion(nil, error);
    } else {
      NSError *error;
      MobilePreparedFiles *files = [[MobilePreparedFiles alloc] initWithData:data error:&error];
      completion(files, error);
    }
  }];

  [self.textile.node prepareFilesAsync:path threadId:threadId cb:cb];
}

- (Block *)addFiles:(Directory *)directory threadId:(NSString *)threadId caption:(NSString *)caption error:(NSError **)error {
  NSData *data = [self.textile.node addFiles:directory.data threadId:threadId caption:caption error:error];
  return [[Block alloc] initWithData:data error:error];
}

- (Block *)addFilesByTarget:(NSString *)target threadId:(NSString *)threadId caption:(NSString *)caption error:(NSError **)error {
  NSData *data = [self.textile.node addFilesByTarget:target threadId:threadId caption:caption error:error];
  return [[Block alloc] initWithData:data error:error];
}

- (FilesList *)files:(NSString *)offset limit:(long)limit threadId:(NSString *)threadId error:(NSError **)error {
  NSData *data = [self.textile.node files:offset limit:limit threadId:threadId error:error];
  return [[FilesList alloc] initWithData:data error:error];
}

- (MobileFileData *)fileData:(NSString *)hash error:(NSError **)error {
  NSData *data = [self.textile.node fileData:hash error:error];
  return [[MobileFileData alloc] initWithData:data error:error];
}

- (MobileFileData *)imageFileDataForMinWidth:(NSString *)path minWidth:(long)minWidth error:(NSError **)error {
  NSData *data = [self.textile.node imageFileDataForMinWidth:path minWidth:minWidth error:error];
  return [[MobileFileData alloc] initWithData:data error:error];
}

@end
