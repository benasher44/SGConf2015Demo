//
//  UIView+SGQueuedAnimationUtils.m
//  SGConfGCDDemo
//
//  Created by Ben Asher on 10/14/15.
//

#import "UIView+SGQueuedAnimationUtils.h"

@implementation UIView (SGQueuedAnimationUtils)

+ (dispatch_queue_t)animationQueue {
  
  // Setup a static animation queue once
  static dispatch_queue_t animationQueue = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    // Serial queue
    animationQueue = dispatch_queue_create("com.example.animationQueue", DISPATCH_QUEUE_SERIAL);
    
    // Animation blocks should be executed on the main queue
    dispatch_set_target_queue(animationQueue, dispatch_get_main_queue());
  });
  return animationQueue;
}

+ (void)sg_queueAnimationWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion {
  
}

@end
