//
//  LikesApi.m
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "LikesApi.h"
#import <Mobile/Mobile.h>

@implementation LikesApi

- (NSString *)addLike:(NSString *)blockId error:(NSError *__autoreleasing *)error {
  return [self.textile.node addLike:blockId error:error];
}

@end
