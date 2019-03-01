//
//  CommentsApi.m
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "CommentsApi.h"
#import <Mobile/Mobile.h>

@implementation CommentsApi

- (NSString *)addComment:(NSString *)blockId body:(NSString *)body error:(NSError **)error {
  return [self.textile.node addComment:blockId body:body error:error];
}

@end
