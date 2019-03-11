//
//  FilesApi.m
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "FilesApi.h"
#import "Callback.h"

@implementation FilesApi

- (MobilePreparedFiles *)prepare:(NSString *)path threadId:(NSString *)threadId error:(NSError * _Nullable __autoreleasing *)error {
  NSData *data = [self.node prepareFiles:path threadId:threadId error:error];
  return [[MobilePreparedFiles alloc] initWithData:data error:error];
}

- (void)prepareAsync:(NSString *)path threadId:(NSString *)threadId completion:(void (^)(MobilePreparedFiles * _Nullable, NSError * _Nonnull))completion {
  Callback *cb = [[Callback alloc] initWithCompletion:^(NSData *data, NSError *error) {
    if (error) {
      completion(nil, error);
    } else {
      NSError *error;
      MobilePreparedFiles *files = [[MobilePreparedFiles alloc] initWithData:data error:&error];
      completion(files, error);
    }
  }];
  [self.node prepareFilesAsync:path threadId:threadId cb:cb];
}

- (Block *)add:(Directory *)directory threadId:(NSString *)threadId caption:(NSString *)caption error:(NSError * _Nullable __autoreleasing *)error {
  NSData *data = [self.node addFiles:directory.data threadId:threadId caption:caption != nil ? caption : @"" error:error];
  return [[Block alloc] initWithData:data error:error];
}

- (Block *)addByTarget:(NSString *)target threadId:(NSString *)threadId caption:(NSString *)caption error:(NSError * _Nullable __autoreleasing *)error {
  NSData *data = [self.node addFilesByTarget:target threadId:threadId caption:caption != nil ? caption : @"" error:error];
  return [[Block alloc] initWithData:data error:error];
}

- (FilesList *)list:(NSString *)offset limit:(long)limit threadId:(NSString *)threadId error:(NSError * _Nullable __autoreleasing *)error {
  NSData *data = [self.node files:offset != nil ? offset : @"" limit:limit threadId:threadId error:error];
  return [[FilesList alloc] initWithData:data error:error];
}

- (NSString *)data:(NSString *)hash error:(NSError * _Nullable __autoreleasing *)error {
  NSString *data = [self.node fileData:hash error:error];
  return data;
}

- (NSString *)imageDataForMinWidth:(NSString *)path minWidth:(long)minWidth error:(NSError * _Nullable __autoreleasing *)error {
  NSString *data = [self.node imageFileDataForMinWidth:path minWidth:minWidth error:error];
  return data;
}

@end
