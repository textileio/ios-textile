//
//  Messenger.m
//  Textile
//
//  Created by Aaron Sutula on 2/28/19.
//  Copyright © 2019 Textile. All rights reserved.
//

#import "Messenger.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/Mobile.pbobjc.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/Model.pbobjc.h"
#import "../node_modules/@textile/go-mobile/dist/ios/protos/Message.pbobjc.h"

@implementation Messenger

- (void)notify: (MobileEvent *)event {
  if ([event.name  isEqual: @"NODE_START"]) {
    if ([self.delegate respondsToSelector:@selector(textileNodeDidStart)]) {
      [self.delegate textileNodeDidStart];
    }
  } else if ([event.name  isEqual: @"NODE_STOP"]) {
    if ([self.delegate respondsToSelector:@selector(textileNodeDidStop)]) {
      [self.delegate textileNodeDidStop];
    }
  } else if ([event.name  isEqual: @"NODE_ONLINE"]) {
    if ([self.delegate respondsToSelector:@selector(textileNodeOnline)]) {
      [self.delegate textileNodeOnline];
    }
  } else if ([event.name  isEqual: @"WALLET_UPDATE"]) {
    NSError *error;
    WalletUpdate *walletUpdate = [[WalletUpdate alloc] initWithData:event.data error:&error];
    // TODO: should we break this down into more specfic update events?
    if (!error && [self.delegate respondsToSelector:@selector(walletUpdateReceived:)]) {
      [self.delegate walletUpdateReceived:walletUpdate];
    }
  } else if ([event.name  isEqual: @"THREAD_UPDATE"]) {
    NSError *error;
    FeedItem *feedItem = [[FeedItem alloc] initWithData:event.data error:&error];
    if (!error && [self.delegate respondsToSelector:@selector(threadUpdateReceived:)]) {
      [self.delegate threadUpdateReceived:feedItem];
    }
  } else if ([event.name  isEqual: @"NOTIFICATION"]) {
    NSError *error;
    Notification *notification = [[Notification alloc] initWithData:event.data error:&error];
    if (!error && [self.delegate respondsToSelector:@selector(notificationReceived:)]) {
      [self.delegate notificationReceived:notification];
    }
  } else if ([event.name  isEqual: @"QUERY_RESPONSE"]) {
    NSError *error;
    MobileQueryEvent *queryEvent = [[MobileQueryEvent alloc] initWithData:event.data error:&error];
    if (error) {
      return;
    }
    switch (queryEvent.type) {
      case MobileQueryEvent_Type_Data: {
        NSString *type = queryEvent.data_p.value.typeURL;
        if ([type isEqualToString:@"/CafeClientThread"]) {
          NSError *error;
          CafeClientThread *clientThread = [[CafeClientThread alloc] initWithData:queryEvent.data_p.value.data error:&error];
          if (!error && [self.delegate respondsToSelector:@selector(clientThreadQueryResult:clientThread:)]) {
            [self.delegate clientThreadQueryResult:queryEvent.id_p clientThread:clientThread];
          }
        } else if ([type isEqualToString:@"/Contact"]) {
          NSError *error;
          Contact *contact = [[Contact alloc] initWithData:queryEvent.data_p.value.data error:&error];
          if (!error && [self.delegate respondsToSelector:@selector(contactQueryResult:contact:)]) {
            [self.delegate contactQueryResult:queryEvent.id_p contact:contact];
          }
        }
        break;
      }
      case MobileQueryEvent_Type_Done:
        if ([self.delegate respondsToSelector:@selector(queryDone:)]) {
          [self.delegate queryDone:queryEvent.id_p];
        }
        break;
      case MobileQueryEvent_Type_Error:
        if ([self.delegate respondsToSelector:@selector(queryError:error:)]) {
          Error *e = queryEvent.error;
          NSError *error = [NSError errorWithDomain:@"io.textile" code:e.code userInfo:@{ NSLocalizedDescriptionKey: e.message }];
          [self.delegate queryError:queryEvent.id_p error:error];
        }
        break;
      default:
        break;
    }
  }
}

@end
