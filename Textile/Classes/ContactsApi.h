//
//  ContactsApi.h
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import <go_textile/go-textile-umbrella.h>
#import "NodeDependant.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactsApi : NodeDependant

- (void)addContact:(Contact *)contact error:(NSError **)error;
- (Contact *)contact:(NSString *)contactId error:(NSError **)error;
- (ContactList *)contacts:(NSError **)error;
- (void)removeContact:(NSString *)contactId error:(NSError **)error;
- (ThreadList *)contactThreads:(NSString *)contactId error:(NSError **)error;
- (MobileSearchHandle *)searchContacts:(ContactQuery *)query options:(QueryOptions *)options error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
