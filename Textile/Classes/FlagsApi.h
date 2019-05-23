//
//  Flags.h
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "NodeDependant.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * Provides access to Flags related Textile APIs
 */
@interface FlagsApi : NodeDependant

/**
 * Flag any data by block
 * @param blockId The id of the Block to flag
 * @param error A reference to an error pointer that will be set in the case of an error
 * @return The block id of the new flag
 */
- (NSString *)add:(NSString *)blockId error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
