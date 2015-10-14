//
//  SGAnimationQueueViewController.m
//  SGConfGCDDemo
//
//  Created by Ben Asher on 10/13/15.
//

#import "SGAnimationQueueViewController.h"
#import "UIView+SGQueuedAnimationUtils.h"

@interface SGAnimationQueueViewController ()

@end

@implementation SGAnimationQueueViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  
  UIView *greenSquareView = [[UIView alloc] initWithFrame:CGRectMake(50.0, 50.0, 100.0, 100.0)];
  greenSquareView.backgroundColor = [UIColor greenColor];
  [self.view addSubview:greenSquareView];
  
  [UIView animateWithDuration:0.5 animations:^{
    greenSquareView.transform = CGAffineTransformRotate(greenSquareView.transform, M_PI_2);
  } completion:^(BOOL finished) {
    [UIView animateWithDuration:0.5 animations:^{
      CGPoint center = greenSquareView.center;
      center.y += 100.0;
      greenSquareView.center = center;
    } completion:NULL];
  }];
}

@end
