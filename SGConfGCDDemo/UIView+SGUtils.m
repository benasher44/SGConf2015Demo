//
//  UIView+SGUtils.m
//  SGConfGCDDemo
//
//  Created by Ben Asher on 10/15/15.
//
//

#import "UIView+SGUtils.h"

@implementation UIView (SGUtils)

- (void)sg_animateRotateAndMoveDown:(dispatch_block_t)completion {
  [UIView animateWithDuration:0.5 animations:^{
    self.transform = CGAffineTransformRotate(self.transform, M_PI_2);
  } completion:^(BOOL finished) {
    [UIView animateWithDuration:0.5 animations:^{
      CGPoint center = self.center;
      center.y += 100.0;
      self.center = center;
    } completion:^(BOOL finished) {
      if (completion) {
        completion();
      }
    }];
  }];
}

@end
