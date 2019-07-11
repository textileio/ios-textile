//
//  RequestsHandler.h
//  Textile
//
//  Created by Aaron Sutula on 5/3/19.
//

#import <Foundation/Foundation.h>
#import <Mobile/Mobile.h>
#import "TextileDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface RequestsHandler : NSObject <CoreCafeOutboxHandler>

@property (nonatomic, strong) MobileMobile *node;
@property (nonatomic, weak, nullable) id<TextileDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
