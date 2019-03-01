//
//  MessagesApi.m
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "MessagesApi.h"
#import <Mobile/Mobile.h>
#import "../node_modules/@textile/go-mobile/dist/ios/protos/View.pbobjc.h"

@implementation MessagesApi

- (NSString *)addMessage:(NSString *)threadId body:(NSString *)body error:(NSError *__autoreleasing *)error {
  return [self.textile.node addMessage:threadId body:body error:error];
}

- (TextList *)messages:(NSString *)offset limit:(long)limit threadId:(NSString *)threadId error:(NSError *__autoreleasing *)error {
  NSData *data = [self.textile.node messages:offset limit:limit threadId:threadId error:error];
  return [[TextList alloc] initWithData:data error:error];
}

@end
