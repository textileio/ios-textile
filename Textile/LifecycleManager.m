//
//  LifecycleManager.m
//  Textile
//
//  Created by Aaron Sutula on 3/3/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "LifecycleManager.h"
#import <UIKit/UIKit.h>
#import "Textile.h"

typedef NS_CLOSED_ENUM(NSInteger, AppState) {
  AppStateNone,
  AppStateBackground,
  AppStateForeground
};

@interface LifecycleManager()

@property (nonatomic, weak) Textile *textile;
@property (nonatomic, assign) AppState appState;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation LifecycleManager

- (instancetype)initWithNode:(MobileMobile *)node {
  if(self = [super initWithNode:node]) {
    self.appState = AppStateNone;
    [self setup];
  }
  return self;
}

- (void)setup {

  UIApplicationState state = UIApplication.sharedApplication.applicationState;
  NSLog(@"state: %li", (long)state);

  [NSNotificationCenter.defaultCenter addObserverForName:UIApplicationDidBecomeActiveNotification object:nil queue:nil usingBlock:^(NSNotification *notification) {
    if (self.appState != AppStateForeground) {
      self.appState = AppStateForeground;
      NSLog(@"foreground");
    }
  }];

  [NSNotificationCenter.defaultCenter addObserverForName:UIApplicationDidEnterBackgroundNotification object:nil queue:nil usingBlock:^(NSNotification *notification) {
    NSTimeInterval remaining = UIApplication.sharedApplication.backgroundTimeRemaining;
    if (self.appState == AppStateBackground) {
      return;
    }
    if (self.appState == AppStateNone) {
      NSLog(@"launched into background, %f seconds remaining", remaining);
    } else if(self.appState == AppStateForeground) {
      NSLog(@"transitioned to background, %f seconds remaining", remaining);
    }
    self.appState = AppStateBackground;
  }];
}

@end
