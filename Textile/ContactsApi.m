//
//  ContactsApi.m
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "ContactsApi.h"
#import <Mobile/Mobile.h>
#import "../node_modules/@textile/go-mobile/dist/ios/protos/Model.pbobjc.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/Query.pbobjc.h"

@implementation ContactsApi

- (void)addContact:(Contact *)contact error:(NSError **)error {
  [self.textile.node addContact:contact.data error:error];
}

- (Contact *)contact:(NSString *)contactId error:(NSError **)error {
  NSData *data = [self.textile.node contact:contactId error:error];
  return [[Contact alloc] initWithData:data error:error];
}

- (ContactList *)contacts:(NSError **)error {
  NSData *data = [self.textile.node contacts:error];
  return [[ContactList alloc] initWithData:data error:error];
}

- (void)removeContact:(NSString *)contactId error:(NSError **)error {
  [self.textile.node removeContact:contactId error:error];
}

- (ThreadList *)contactThreads:(NSString *)contactId error:(NSError **)error {
  NSData *data = [self.textile.node contactThreads:contactId error:error];
  return [[ThreadList alloc] initWithData:data error:error];
}

- (MobileSearchHandle *)searchContacts:(ContactQuery *)query options:(QueryOptions *)options error:(NSError **)error {
  return [self.textile.node searchContacts:query.data options:options.data error:error];
}

@end
