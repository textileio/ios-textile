//
//  TextileDelegateMock.m
//  Textile_Tests
//
//  Created by Aaron Sutula on 6/20/19.
//  Copyright © 2019 asutula. All rights reserved.
//

#import "TextileDelegateMock.h"

@implementation TextileDelegateMock

- (void)nodeStarted {
  self.startedCalled = YES;
}

- (void)nodeOnline {
  self.onlineCalled = YES;
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

@end
