//
//  SGAnimationQueueViewController.m
//  SGConfGCDDemo
//
//  Created by Ben Asher on 10/13/15.
//

#import "SGAnimationQueueViewController.h"

@interface SGAnimationQueueViewController ()

@property (strong, nonatomic) dispatch_queue_t animationQueue;

@end

@implementation SGAnimationQueueViewController

- (instancetype)init {
  if (self = [super init]) {
    _animationQueue = dispatch_queue_create("com.example.animationQueue", DISPATCH_QUEUE_SERIAL);
  }
  return self;
}

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
