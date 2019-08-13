#import <Foundation/Foundation.h>
#import "NodeManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppStateHandler : NSObject

@property(nonatomic, weak) NodeManager *nodeManager;

@end

NS_ASSUME_NONNULL_END
