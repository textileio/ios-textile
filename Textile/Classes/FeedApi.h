//
//  FeedApi.h
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import <TextileCore/View.pbobjc.h>
#import "NodeDependant.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * Provides access to Feed related Textile APIs
 */
@interface FeedApi : NodeDependant

/**
 * List thread items using a Feed view of the data, useful for timeline based views of thread data
 * @param request An object that configures the request for feed data
 * @param error A reference to an error pointer that will be set in the case of an error
 * @return An object that contains a list of feed items
 */
- (FeedItemList *)list:(FeedRequest *)request error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
