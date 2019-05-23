//
//  Ignores.h
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "NodeDependant.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * Provides access to ignores related Textile APIs
 */
@interface IgnoresApi : NodeDependant

/**
 * Ignore data by block
 * @param blockId The id of the block you want to ignore
 * @param error A reference to an error pointer that will be set in the case of an error
 * @return The block id of the newly created igore block
 */
- (NSString *)add:(NSString *)blockId error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
