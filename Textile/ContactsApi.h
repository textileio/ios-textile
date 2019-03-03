//
//  ContactsApi.h
//  Textile
//
//  Created by Aaron Sutula on 3/1/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "ApiModule.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/Model.pbobjc.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/Query.pbobjc.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactsApi : ApiModule

- (void)addContact:(Contact *)contact error:(NSError **)error;
- (Contact *)contact:(NSString *)contactId error:(NSError **)error;
- (ContactList *)contacts:(NSError **)error;
- (void)removeContact:(NSString *)contactId error:(NSError **)error;
- (ThreadList *)contactThreads:(NSString *)contactId error:(NSError **)error;
- (MobileSearchHandle *)searchContacts:(ContactQuery *)query options:(QueryOptions *)options error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
