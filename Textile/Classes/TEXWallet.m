//
//  TEXWallet.m
//  Textile
//
//  Created by Aaron Sutula on 6/29/19.
//

#import "TEXWallet.h"
#import <Mobile/Mobile.h>

@implementation TEXWallet

+ (NSString *)newWallet:(long)wordCount error:(NSError * _Nullable __autoreleasing *)error {
  NSString *recoveryPhrase = MobileNewWallet(wordCount, error);
  return recoveryPhrase;
}

+ (MobileWalletAccount *)walletAccountAt:(NSString *)phrase index:(NSInteger)index password:(NSString *)password error:(NSError * _Nullable __autoreleasing *)error {
  NSData *data = MobileWalletAccountAt(phrase, index, password, error);
  if (*error) {
    return nil;
  }
  MobileWalletAccount *account = [[MobileWalletAccount alloc] initWithData:data error:error];
  if (*error) {
    return nil;
  }
  return account;
}

@end
