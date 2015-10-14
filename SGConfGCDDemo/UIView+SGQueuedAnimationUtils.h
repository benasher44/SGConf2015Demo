//
//  UIView+SGQueuedAnimationUtils.h
//  SGConfGCDDemo
//
//  Created by Ben Asher on 10/14/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (SGQueuedAnimationUtils)

+ (void)sg_queueAnimationWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion;

@end

NS_ASSUME_NONNULL_END
