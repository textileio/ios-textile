//
//  FeedApi.h
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "NodeDependant.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/Model.pbobjc.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/View.pbobjc.h"

NS_ASSUME_NONNULL_BEGIN

@interface FeedApi : NodeDependant

- (FeedItemList *)feed:(FeedRequest *)request error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
