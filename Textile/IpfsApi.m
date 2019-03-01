//
//  IpfsApi.m
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "IpfsApi.h"
#import <Mobile/Mobile.h>

@implementation IpfsApi

- (NSString *)peerId:(NSError *__autoreleasing *)error {
  return [self.textile.node peerId:error];
}

@end
