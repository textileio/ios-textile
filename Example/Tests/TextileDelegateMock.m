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
    self.updatedItems = [[NSMutableSet alloc] init];
    self.completeItems = [[NSMutableSet alloc] init];
    self.failedItems = [[NSMutableSet alloc] init];
  }
  return self;
}

- (void)nodeStarted {
  self.startedCalled = YES;
}

- (void)nodeOnline {
  self.onlineCalled = YES;
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
