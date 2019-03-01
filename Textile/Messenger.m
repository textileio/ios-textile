//
//  Messenger.m
//  Textile
//
//  Created by Aaron Sutula on 2/28/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "Messenger.h"

@implementation Messenger

- (void) notify: (MobileEvent *)event {
  NSLog(@"got an event: %@", event.name);
}

@end
