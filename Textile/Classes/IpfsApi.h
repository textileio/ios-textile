//
//  IpfsApi.h
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "NodeDependant.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * Provides access to IPFS releated Textile APIs
 */
@interface IpfsApi : NodeDependant

/**
 * Fetch the IPFS peer id
 * @param error A reference to an error pointer that will be set in the case of an error
 * @return The IPFS peer id of the local Textile node
 */
- (NSString *)peerId:(NSError **)error;

/**
 * Get raw data stored at an IPFS path
 * @param path The IPFS path for the data you want to retrieve
 * @param error A reference to an error pointer that will be set in the case of an error
 */
- (NSData *)dataAtPath:(NSString *)path error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
