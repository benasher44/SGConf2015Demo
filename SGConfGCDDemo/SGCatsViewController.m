//
//  SGCatsViewController.m
//  SGConfGCDDemo
//
//  Created by Ben Asher on 10/13/15.
//

#import "SGCatsViewController.h"

#import "UIImage+SGUtils.h"

@interface SGCatsViewController ()

@property (strong, nonatomic) NSMutableArray<UIImage *> *processedCatImages;
@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation SGCatsViewController

- (instancetype)init {
  if (self = [super init]) {
    _processedCatImages = [[NSMutableArray alloc] init];
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
  [self.view addSubview:self.scrollView];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  
  // Start timer
  CFTimeInterval start = CACurrentMediaTime();
  
  // Render the cats
  [UIImage sg_enumerateCatsAndScaleFactors:^(UIImage * _Nonnull catImage, CGFloat scaleFactor) {

    UIImage *scaledImage = [catImage sg_imageResizedByScaleFactor:scaleFactor];
    [self.processedCatImages addObject:scaledImage];
  }];
  
  [self displayProcessedCatImages];
  NSLog(@"cats - %lf", CACurrentMediaTime() - start);
}

- (void)displayProcessedCatImages {
  NSArray *catImagesByWidth = [self.processedCatImages sortedArrayUsingComparator:^NSComparisonResult(UIImage *image1, UIImage *image2) {
    return [@(image1.size.width) compare:@(image2.size.width)];
  }];
  CGFloat y = 0;
  for (UIImage *catImage in catImagesByWidth) {
    UIImageView *catImageView = [[UIImageView alloc] initWithImage:catImage];
    // Center the image horizontally
    CGRect catImageFrame = CGRectMake(CGRectGetMidX(self.view.bounds) - floorf(catImage.size.width / 2.0), y,
                                      catImage.size.width, catImage.size.height);
    catImageView.frame = catImageFrame;
    
    [self.scrollView addSubview:catImageView];
    
    // Keep track of where the next cat should go
    y += catImage.size.height;
  }
  
  // Set the contentSize, so we can see all of the cats
  self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds), y);
}

@end
