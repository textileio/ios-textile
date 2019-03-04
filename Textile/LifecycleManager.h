//
//  LifecycleManager.h
//  Textile
//
//  Created by Aaron Sutula on 3/3/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "NodeDependant.h"
#import "Textile.h"

NS_ASSUME_NONNULL_BEGIN

@interface LifecycleManager : NodeDependant

@property (nonatomic, strong) id<TextileDelegate> _Nullable delegate;

@end

NS_ASSUME_NONNULL_END
