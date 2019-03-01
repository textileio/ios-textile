//
//  FeedApi.m
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "FeedApi.h"
#import <Mobile/Mobile.h>
#import "../node_modules/@textile/go-mobile/dist/ios/protos/Model.pbobjc.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/View.pbobjc.h"

@implementation FeedApi

- (FeedItemList *)feed:(FeedRequest *)request error:(NSError **)error {
  NSData *data = [self.textile.node feed:request.data error:error];
  return [[FeedItemList alloc] initWithData:data error:error];
}

@end
