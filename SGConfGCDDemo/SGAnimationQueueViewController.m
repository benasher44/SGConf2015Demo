//
//  SGAnimationQueueViewController.m
//  SGConfGCDDemo
//
//  Created by Ben Asher on 10/13/15.
//

#import "SGAnimationQueueViewController.h"

#import "UIView+SGUtils.h"

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
  
  [greenSquareView sg_animateWithCompletion:NULL];
}

@end
