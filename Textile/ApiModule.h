//
//  ApiModule.h
//  Textile
//
//  Created by Aaron Sutula on 2/28/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Textile.h"

NS_ASSUME_NONNULL_BEGIN

@interface ApiModule : NSObject

@property (nonatomic, strong) Textile *textile;

- (instancetype)initWithTextile:(Textile *)textile;

@end

NS_ASSUME_NONNULL_END
