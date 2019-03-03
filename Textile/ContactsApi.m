//
//  ContactsApi.m
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "ContactsApi.h"

@implementation ContactsApi

- (void)addContact:(Contact *)contact error:(NSError **)error {
  [self.node addContact:contact.data error:error];
}

- (Contact *)contact:(NSString *)contactId error:(NSError **)error {
  NSData *data = [self.node contact:contactId error:error];
  return [[Contact alloc] initWithData:data error:error];
}

- (ContactList *)contacts:(NSError **)error {
  NSData *data = [self.node contacts:error];
  return [[ContactList alloc] initWithData:data error:error];
}

- (void)removeContact:(NSString *)contactId error:(NSError **)error {
  [self.node removeContact:contactId error:error];
}

- (ThreadList *)contactThreads:(NSString *)contactId error:(NSError **)error {
  NSData *data = [self.node contactThreads:contactId error:error];
  return [[ThreadList alloc] initWithData:data error:error];
}

- (MobileSearchHandle *)searchContacts:(ContactQuery *)query options:(QueryOptions *)options error:(NSError **)error {
  return [self.node searchContacts:query.data options:options.data error:error];
}

@end
