//
//  AppDelegate.m
//  TextileApp
//
//  Created by Aaron Sutula on 2/28/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "AppDelegate.h"
#import <Textile/Textile.h>

@interface AppDelegate () <TextileDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
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


- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)textileNodeDidStart {
  NSLog(@"delegate - node started");
}

- (void)textileNodeFailedToStartWithError:(NSError *)error {
  NSLog(@"delegate - node failed to start: %@", error.localizedDescription);
}

- (void)textileNodeDidStop {
  NSLog(@"delegate - node stopped");
}

- (void)textileNodeFailedToStopWithError:(NSError *)error {
  NSLog(@"delegate - node failed to stop: %@", error.localizedDescription);
}

- (void)textileNodeOnline {
  NSLog(@"delegate - node online");
}


@end
