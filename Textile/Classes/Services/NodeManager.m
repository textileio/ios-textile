#import "NodeManager.h"
#import "AppStateHandler.h"
#import "RequestsHandler.h"
#import <UIKit/UIKit.h>

typedef NS_CLOSED_ENUM(NSInteger, NodeState) {
  NodeStateStopped,
  NodeStateStarted
};

@interface NodeManager()

@property (nonatomic, strong) AppStateHandler *appStateHandler;
@property (nonatomic, strong) RequestsHandler *requestsHandler;
@property (nonatomic, assign) NodeState nodeState;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation NodeManager

- (instancetype)initWithNode:(MobileMobile *)node {
  if(self = [super initWithNode:node]) {
    self.appStateHandler = [[AppStateHandler alloc] init];
    self.appStateHandler.nodeManager = self;

    self.requestsHandler = [[RequestsHandler alloc] init];
    self.requestsHandler.nodeManager = self;

    self.nodeState = NodeStateStopped;
  }
  return self;
}

- (void)assureStarted:(NSError *__autoreleasing *)error {
  if ([self.timer isValid]) {
    NSLog(@"Canceling previous node stop request");
    [self.timer invalidate];
  }
  NSLog(@"assuring node started");
  BOOL started = [self.node start:error];
  if (!started) {
    [self.delegate nodeFailedToStartWithError:*error];
    return;
  }
  UIApplicationState state = UIApplication.sharedApplication.applicationState;
  if (state == UIApplicationStateBackground) {
    NSLog(@"Assured start in background, so requesting stop");
    [self requestStop];
  }
}

- (void)requestStop {
  NSTimeInterval remaining = UIApplication.sharedApplication.backgroundTimeRemaining;
  [self.delegate willStopNodeInBackgroundAfterDelay:remaining];
  __weak NodeManager *weakSelf = self;
  UIBackgroundTaskIdentifier bgTaskId = [UIApplication.sharedApplication beginBackgroundTaskWithName:@"RunNode" expirationHandler:^{
    NSLog(@"background task expired");
    [weakSelf stopNode];
  }];
  NSLog(@"Allowing node to run for %d seconds before stop", (int)remaining);
  self.timer = [NSTimer scheduledTimerWithTimeInterval:remaining repeats:FALSE block:^(NSTimer * _Nonnull timer) {
    [weakSelf stopNode];
    // Dispatch this after a slight delay to allow consumers of the stop node event to process the event before app suspension
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      [UIApplication.sharedApplication endBackgroundTask:bgTaskId];
    });
  }];
}

- (void)stopNode {
  NSLog(@"stopping node");
  NSError *error;
  BOOL stopped = [self.node stop:&error];
  if (!stopped) {
    [self.delegate nodeFailedToStopWithError:error];
  }
}

@end

