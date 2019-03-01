//
//  ApiModule.m
//  Textile
//
//  Created by Aaron Sutula on 2/28/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "ApiModule.h"

@implementation ApiModule

- (instancetype)initWithTextile:(Textile *)textile {
  self = [super init];
  if (self) {
    self.textile = textile;
  }
  return self;
}

@end
