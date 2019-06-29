//
//  TEXWallet.h
//  Textile
//
//  Created by Aaron Sutula on 6/29/19.
//

#import <Foundation/Foundation.h>
#import <TextileCore/TextileCore-umbrella.h>

NS_ASSUME_NONNULL_BEGIN

@interface TEXWallet : NSObject

+ (NSString *)newWallet:(NSInteger)wordCount error:(NSError **)error;
+ (MobileWalletAccount *)walletAccountAt:(NSString *)phrase index:(NSInteger)index password:(NSString *)password error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
