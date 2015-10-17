//
//  SGCatsViewController.m
//  SGConfGCDDemo
//
//  Created by Ben Asher on 10/13/15.
//

#import "SGCatsViewController.h"

#import "UIImage+SGUtils.h"
#import "UIScrollView+SGUtils.h"

@interface SGCatsViewController ()

@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation SGCatsViewController

- (instancetype)init {
  if (self = [super init]) {
    
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
  [self.view addSubview:self.scrollView];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  // Start timer
  CFTimeInterval start = CACurrentMediaTime();
  
  NSMutableArray<UIImage *> *processedCatImages = [NSMutableArray array];
  
  // Render the cats
  [UIImage sg_enumerateCatsAndScaleFactors:^(UIImage * _Nonnull catImage, CGFloat scaleFactor) {

    UIImage *scaledImage = [catImage sg_imageResizedByScaleFactor:scaleFactor];
    [processedCatImages addObject:scaledImage];
  }];
  
  // Add images to the scroll view sorted in size order
  [self.scrollView sg_addImageViewsInSizeOrderForImages:processedCatImages];
  NSLog(@"cats - %lf", CACurrentMediaTime() - start);
}

@end
