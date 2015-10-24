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
@property (strong, nonatomic) dispatch_queue_t imageProcessingQueue;

@end

@implementation SGCatsViewController

- (instancetype)init {
  if (self = [super init]) {
    _imageProcessingQueue = dispatch_queue_create("imageProcessingQueue", DISPATCH_QUEUE_CONCURRENT);
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
  
  dispatch_group_t group = dispatch_group_create();
  
  // Render the cats
  [UIImage sg_enumerateCatsAndScaleFactors:^(UIImage * _Nonnull catImage, CGFloat scaleFactor) {

    dispatch_group_async(group, self.imageProcessingQueue, ^{
      UIImage *scaledImage = [catImage sg_imageResizedByScaleFactor:scaleFactor];
      dispatch_async(dispatch_get_main_queue(), ^{
        [processedCatImages addObject:scaledImage];
      });
    });
  }];
  
  dispatch_group_notify(group, dispatch_get_main_queue(), ^{
    // Add images to the scroll view sorted in size order
    [self.scrollView sg_addImageViewsInSizeOrderForImages:processedCatImages];
  });
  
  NSLog(@"cats - %lf", CACurrentMediaTime() - start);
}

@end
