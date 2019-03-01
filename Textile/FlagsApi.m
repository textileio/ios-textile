//
//  Flags.m
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "FlagsApi.h"
#import <Mobile/Mobile.h>

@implementation FlagsApi

- (NSString *)addFlag:(NSString *)blockId error:(NSError **)error {
  return [self.textile.node addFlag:blockId error:error];
}

@end
