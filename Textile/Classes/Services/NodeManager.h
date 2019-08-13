#import <Foundation/Foundation.h>
#import "NodeDependant.h"

NS_ASSUME_NONNULL_BEGIN

@protocol NodeManagerDelegate <NSObject>

- (void)nodeFailedToStartWithError:(NSError *)error;
- (void)nodeFailedToStopWithError:(NSError *)error;
- (void)willStopNodeInBackgroundAfterDelay:(NSTimeInterval)seconds;
- (void)canceledPendingNodeStop;

@end

@interface NodeManager : NodeDependant

@property (nonatomic, weak) id<NodeManagerDelegate> delegate;
- (void)assureStarted:(NSError **)error;
- (void)requestStop;

@end

NS_ASSUME_NONNULL_END
