#import "AppStateHandler.h"

typedef NS_CLOSED_ENUM(NSInteger, AppState) {
  AppStateNone,
  AppStateBackground,
  AppStateForeground
};

@interface AppStateHandler()

@property (nonatomic, assign) AppState appState;

@end

@implementation AppStateHandler

- (instancetype)init {
  if (self = [super init]) {
    [self setup];
  }
  return self;
}

- (void)setup {
  dispatch_async(dispatch_get_main_queue(), ^{

    self.appState = AppStateNone;

    UIApplicationState state = UIApplication.sharedApplication.applicationState;
    if (state == UIApplicationStateActive) {
      [self processNewState:AppStateForeground];
    } else if (state == UIApplicationStateBackground) {
      [self processNewState:AppStateBackground];
    }

    __weak AppStateHandler *weakSelf = self;

    [NSNotificationCenter.defaultCenter
     addObserverForName:UIApplicationDidBecomeActiveNotification
     object:nil
     queue:nil
     usingBlock:^(NSNotification *notification) {
       [weakSelf processNewState:AppStateForeground];
     }];

    [NSNotificationCenter.defaultCenter
     addObserverForName:UIApplicationDidEnterBackgroundNotification
     object:nil
     queue:nil
     usingBlock:^(NSNotification *notification) {
       [weakSelf processNewState:AppStateBackground];
     }];
  });
}

- (void)processNewState:(AppState)newState {
  if (self.appState == newState) {
    // bail if the state isn't changing
    return;
  }
  if (newState == AppStateForeground) {
    self.appState = AppStateForeground;
    [self.nodeManager assureStarted:nil];
  } else if (newState == AppStateBackground) {
    if (self.appState == AppStateNone) {
      self.appState = AppStateBackground;
      [self.nodeManager assureStarted:nil];
    } else if(self.appState == AppStateForeground) {
      self.appState = AppStateNone;
      [self.nodeManager requestStop];
    }
  }
}


@end
