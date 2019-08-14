#import <Foundation/Foundation.h>
#import "NodeDependant.h"
#import "NodeManagerDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface NodeManager : NodeDependant

@property (nonatomic, weak) id<NodeManagerDelegate> delegate;
- (void)assureStarted:(NSError **)error;
- (void)requestStop;

@end

NS_ASSUME_NONNULL_END
