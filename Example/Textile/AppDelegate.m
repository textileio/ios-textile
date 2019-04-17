//
//  TEXAppDelegate.m
//  Textile
//
//  Created by asutula on 03/11/2019.
//  Copyright (c) 2019 asutula. All rights reserved.
//

#import "AppDelegate.h"
#import <Textile/Textile-umbrella.h>

@interface AppDelegate () <TextileDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  NSError *error;
  NSString *recoveryPhrase = [Textile initializeWithDebug:FALSE logToDisk:FALSE error:&error];
  if (recoveryPhrase) {
    NSLog(@"recovery phrase: %@", recoveryPhrase);
  }
  if (error) {
    NSLog(@"initialize error: %@", error.localizedDescription);
  }
  Textile.instance.delegate = self;

  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)nodeStarted {
  NSLog(@"delegate - node started");
}

- (void)nodeFailedToStartWithError:(NSError *)error {
  NSLog(@"delegate - node failed to start: %@", error.localizedDescription);
}

- (void)nodeStopped {
  NSLog(@"delegate - node stopped");
}

- (void)nodeFailedToStopWithError:(NSError *)error {
  NSLog(@"delegate - node failed to stop: %@", error.localizedDescription);
}

- (void)nodeOnline {
  NSLog(@"delegate - node online");
}

- (void)willStopNodeInBackgroundAfterDelay:(NSTimeInterval)seconds {
  NSLog(@"delegate - will stop node after delay: %f", seconds);
}

- (void)canceledPendingNodeStop {
  NSLog(@"canceled pending stop");
}

@end
