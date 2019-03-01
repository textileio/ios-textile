//
//  FeedApi.h
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "ApiModule.h"

@class FeedItemList;
@class FeedRequest;

NS_ASSUME_NONNULL_BEGIN

@interface FeedApi : ApiModule

- (FeedItemList *)feed:(FeedRequest *)request error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
