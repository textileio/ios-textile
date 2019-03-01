//
//  Ignores.m
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "IgnoresApi.h"
#import <Mobile/Mobile.h>

@implementation IgnoresApi

- (NSString *)addIgnore:(NSString *)blockId error:(NSError **)error {
  return [self.textile.node addIgnore:blockId error:error];
}

@end
