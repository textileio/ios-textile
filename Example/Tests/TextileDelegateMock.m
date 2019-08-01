//
//  TextileDelegateMock.m
//  Textile_Tests
//
//  Created by Aaron Sutula on 6/20/19.
//  Copyright © 2019 asutula. All rights reserved.
//

#import "TextileDelegateMock.h"

@implementation TextileDelegateMock

- (instancetype)init {
  if (self = [super init]) {
    self.startedCalledCount = 0;
    self.onlineCalledCount = 0;
    self.stoppedCalledCount = 0;
    self.updatedItems = [[NSMutableSet alloc] init];
    self.completeItems = [[NSMutableSet alloc] init];
    self.failedItems = [[NSMutableSet alloc] init];
  }
  return self;
}

- (void)nodeStarted {
  self.startedCalledCount = self.startedCalledCount + 1;
}

- (void)nodeOnline {
  self.onlineCalledCount = self.onlineCalledCount + 1;
}

- (void)nodeStopped {
  self.stoppedCalledCount = self.stoppedCalledCount + 1;
}

- (void)syncUpdate:(CafeSyncGroupStatus *)status {
  [self.updatedItems addObject:status.id_p];
}

- (void)syncComplete:(CafeSyncGroupStatus *)status {
  [self.completeItems addObject:status.id_p];
}

- (void)syncFailed:(CafeSyncGroupStatus *)status {
  [self.failedItems addObject:status.id_p];
}

@end
