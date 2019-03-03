//
//  CommentsApi.m
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "CommentsApi.h"

@implementation CommentsApi

- (NSString *)addComment:(NSString *)blockId body:(NSString *)body error:(NSError **)error {
  return [self.node addComment:blockId body:body error:error];
}

@end
