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
 * Provides access to Textile IPFS related APIs
 */
@interface IpfsApi : NodeDependant

/**
 * Fetch the IPFS peer id
 * @param error A reference to an error pointer that will be set in the case of an error
 * @return The IPFS peer id of the local Textile node
 */
- (NSString *)peerId:(NSError **)error;

/**
 * Open a new direct connection to a peer using an IPFS multiaddr
 * @param multiaddr Peer IPFS multiaddr
 * @param error A reference to an error pointer that will be set in the case of an error
 * @return Whether the peer swarm connect was successfull
 */
- (BOOL)swarmConnect:(NSString *)multiaddr error:(NSError **)error;

/**
 * Get raw data stored at an IPFS path
 * @param path The IPFS path for the data you want to retrieve
 * @param completion A block that will get called with the results of the query
 */
- (void)dataAtPath:(NSString *)path completion:(void (^)(NSData * _Nullable, NSString * _Nullable, NSError * _Nonnull))completion;

/**
 * Publishes a message to a given pubsub topic
 * @param topic The topic to publish to
 * @param data The payload of message to publish
 * @param error A reference to an error pointer that will be set in the case of an error
 */
- (void)pubsubPub:(NSString *)topic data:(NSString *)data error:(NSError **)error;

/**
 * Subscribes to messages on a given topic
 * @param topic The ipfs pubsub sub topic
 * @param error A reference to an error pointer that will be set in the case of an error
 * @return A query ID that can be used to cancel the sub
 */
- (NSString *)pubsubSub:(NSString *)topic error:(NSError **)error;

/**
 * Cancel subscribe to messages on a given topic
 * @param queryId The query ID that can be used to cancel the sub
 * @param error A reference to an error pointer that will be set in the case of an error
 */
- (void)cancelPubsubSub:(NSString *)queryId error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
