//
//  FeedApi.m
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "FeedApi.h"

@implementation FeedApi

- (FeedItemList *)feed:(FeedRequest *)request error:(NSError **)error {
  NSData *data = [self.node feed:request.data error:error];
  return [[FeedItemList alloc] initWithData:data error:error];
}

@end
