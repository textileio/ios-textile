//
//  TextileEventsDelegate.h
//  Textile
//
//  Created by Aaron Sutula on 8/14/19.
//

#ifndef TextileEventsDelegate_h
#define TextileEventsDelegate_h

@protocol TextileEventsDelegate <NSObject>

@optional
/**
 * Called when the Textile node is started successfully
 */
- (void)nodeStarted;

/**
 * Called when the Textile node fails to start
 * @param error The error describing the failure
 */
- (void)nodeFailedToStartWithError:(NSError *)error;

/**
 * Called when the Textile node is successfully stopped
 */
- (void)nodeStopped;

/**
 * Called when the Textile node fails to stop
 * @param error The error describing the failure
 */
- (void)nodeFailedToStopWithError:(NSError *)error;

/**
 * Called when the Textile node comes online
 */
- (void)nodeOnline;

/**
 * Called when the node is scheduled to be stopped in the future
 * @param seconds The amount of time the node will run for before being stopped
 */
- (void)willStopNodeInBackgroundAfterDelay:(NSTimeInterval)seconds;

/**
 * Called when the scheduled node stop is cancelled, the node will continue running
 */
- (void)canceledPendingNodeStop;

/**
 * Called when the Textile node receives a notification
 * @param notification The received notification
 */
- (void)notificationReceived:(Notification *)notification;

/**
 * Called when any thread receives an update
 * @param threadId The id of the thread being updated
 * @param feedItemData The thread update
 */
- (void)threadUpdateReceived:(NSString *)threadId data:(FeedItemData *)feedItemData;

/**
 * Called when a new thread is successfully added
 * @param threadId The id of the newly added thread
 */
- (void)threadAdded:(NSString *)threadId;

/**
 * Called when a thread is successfully removed
 * @param threadId The id of the removed thread
 */
- (void)threadRemoved:(NSString *)threadId;

/**
 * Called when a peer node is added to the user account
 * @param peerId The id of the new account peer
 */
- (void)accountPeerAdded:(NSString *)peerId;

/**
 * Called when an account peer is removed from the user account
 * @param peerId The id of the removed account peer
 */
- (void)accountPeerRemoved:(NSString *)peerId;

/**
 * Called when any query is complete
 * @param queryId The id of the completed query
 */
- (void)queryDone:(NSString *)queryId;

/**
 * Called when any query fails
 * @param queryId The id of the failed query
 * @param error The error describing the failure
 */
- (void)queryError:(NSString *)queryId error:(NSError *)error;

/**
 * Called when there is a thread query result available
 * @param queryId The id of the corresponding query
 * @param thread A thread query result
 */
- (void)clientThreadQueryResult:(NSString *)queryId thread:(Thread *)thread;

/**
 * Called when there is a contact query result available
 * @param queryId The id of the corresponding query
 * @param contact A contact query result
 */
- (void)contactQueryResult:(NSString *)queryId contact:(Contact *)contact;

/**
 * Called when there is a cafe sync group status update
 * @param status Object containing information about a cafe sync group
 */
- (void)syncUpdate:(CafeSyncGroupStatus *)status;

/**
 * Called when a cafe sync group is complete
 * @param status Object containing information about a cafe sync group
 */
- (void)syncComplete:(CafeSyncGroupStatus *)status;

/**
 * Called when a cafe sync group fails
 * @param status Object containing information about a cafe sync group
 */
- (void)syncFailed:(CafeSyncGroupStatus *)status;

@end


#endif /* TextileEventsDelegate_h */
