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
  NSString *recoveryPhrase = [Textile initializeWithDebug:NO logToDisk:NO error:&error];
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

- (void)application:(UIApplication *)application handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)(void))completionHandler {
  if ([identifier isEqualToString:TEXTILE_BACKGROUND_SESSION_ID]) {
    Textile.instance.backgroundCompletionHandler = completionHandler;
  }
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
//  [self test];
}

- (void)willStopNodeInBackgroundAfterDelay:(NSTimeInterval)seconds {
  NSLog(@"delegate - will stop node after delay: %f", seconds);
}

- (void)canceledPendingNodeStop {
  NSLog(@"canceled pending stop");
}

- (void)threadAdded:(NSString *)threadId {
  NSLog(@"thread added: %@", threadId);
}

- (void)syncUpdate:(CafeSyncGroupStatus *)status {
  if (status.error.length > 0) {
    NSLog(@"Status error for %@: %@ (%@)", status.id_p, status.error, status.errorId);
  } else {
    NSLog(@"Status for %@: %d/%d (%d pending)", status.id_p, status.numComplete, status.numTotal, status.numPending);
  }
}

- (void)syncComplete:(CafeSyncGroupStatus *)status {
  if (status.error.length > 0) {
    NSLog(@"Complete error for %@: %@ (%@)", status.id_p, status.error, status.errorId);
  } else {
    NSLog(@"Complete for %@: %d/%d (%d pending)", status.id_p, status.numComplete, status.numTotal, status.numPending);
  }
}

- (void)syncFailed:(CafeSyncGroupStatus *)status {
  if (status.error.length > 0) {
    NSLog(@"Failed with error for %@: %@ (%@)", status.id_p, status.error, status.errorId);
  } else {
    NSLog(@"Failed witout error message for %@", status.id_p);
  }
}

- (void)test {
  [Textile.instance.cafes
   register:@"12D3KooWGN8VAsPHsHeJtoTbbzsGjs2LTmQZ6wFKvuPich1TYmYY"
   token:@"uggU4NcVGFSPchULpa2zG2NRjw2bFzaiJo3BYAgaFyzCUPRLuAgToE3HXPyo" completion:^(NSError * _Nonnull error) {
    if (error) {
      NSLog(@"error registering cafe: %@", error.localizedDescription);
    } else {
      NSLog(@"registered cafe");
    }
  }];
  AddThreadConfig_Schema *schema = [[AddThreadConfig_Schema alloc] init];
  schema.preset = AddThreadConfig_Schema_Preset_Media;
  AddThreadConfig *config = [[AddThreadConfig alloc] init];
  config.key = @"myKey";
  config.name = @"test thread";
  config.schema = schema;
  config.type = Thread_Type_Public;
  config.sharing = Thread_Sharing_Shared;
  NSError *e;
  Thread *thread = [Textile.instance.threads add:config error:&e];
  if (e) {
    NSLog(@"error creating thread: %@", e.localizedDescription);
  }
  NSString *val = [Textile.instance.messages add:thread.id_p body:@"heeey" error:&e];
  if (e) {
    NSLog(@"error adding message: %@", e.localizedDescription);
  }
  NSLog(@"ok adding message");

  NSString *path = [[NSBundle mainBundle] pathForResource:@"TEST1" ofType:@"JPG"];
  Strings *strings = [[Strings alloc] init];
  [strings.valuesArray addObject:path];
  [Textile.instance.files addFiles:strings threadId:thread.id_p caption:@"cool" completion:^(Block * _Nullable block, NSError * _Nonnull error) {
    if (error) {
      NSLog(@"error adding image: %@", error.localizedDescription);
    } else {
      NSLog(@"added image: %@", block.id_p);
    }
  }];

}

@end
