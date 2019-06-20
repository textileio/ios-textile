//
//  TextileDelegateMock.h
//  Textile_Tests
//
//  Created by Aaron Sutula on 6/20/19.
//  Copyright © 2019 asutula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Textile/TextileApi.h>

NS_ASSUME_NONNULL_BEGIN

@interface TextileDelegateMock : NSObject <TextileDelegate>

@property (nonatomic, assign) BOOL startedCalled;
@property (nonatomic, assign) BOOL onlineCalled;

@end

NS_ASSUME_NONNULL_END
