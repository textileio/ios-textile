//
//  NodeManagerDelegate.h
//  Textile
//
//  Created by Aaron Sutula on 8/14/19.
//

#ifndef NodeManagerDelegate_h
#define NodeManagerDelegate_h

@protocol NodeManagerDelegate <NSObject>

@optional
- (void)nodeFailedToStartWithError:(NSError *)error;
- (void)nodeFailedToStopWithError:(NSError *)error;
- (void)willStopNodeInBackgroundAfterDelay:(NSTimeInterval)seconds;
- (void)canceledPendingNodeStop;

@end


#endif /* NodeManagerDelegate_h */
