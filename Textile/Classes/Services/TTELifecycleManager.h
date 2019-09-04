#import <Mobile/Mobile.h>

#ifndef TTELifecycleManager_h
#define TTELifecycleManager_h

@protocol TTELifecycleManager <NSObject>

- (id _Nonnull)initWithNode:(MobileMobile *_Nonnull)node;
- (BOOL)start:(NSError* _Nullable* _Nullable)error;
- (void)stopWithCompletion:(nullable void (^)(BOOL success, NSError * _Nullable error))completion;

@end


#endif /* TTELifecycleManager_h */
