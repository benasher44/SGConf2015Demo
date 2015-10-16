//
//  UIScrollView+SGUtils.m
//  SGConfGCDDemo
//
//  Created by Ben Asher on 10/15/15.
//
//

#import "UIScrollView+SGUtils.h"

@implementation UIScrollView (SGUtils)

- (void)sg_addImageViewsInSizeOrderForImages:(NSArray<UIImage *>*)images {
  NSArray *imagesBySize = [images sortedArrayUsingComparator:^NSComparisonResult(UIImage *image1, UIImage *image2) {
    return [@(image1.size.width * image1.size.height) compare:@(image2.size.width * image2.size.height)];
  }];
  
  CGFloat y = 0;
  for (UIImage *image in imagesBySize) {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    // Center the image horizontally
    CGFloat xForCenteredImage = CGRectGetMidX(self.bounds) - floorf(image.size.width / 2.0);
    imageView.frame = CGRectMake(xForCenteredImage, y,
                                 image.size.width, image.size.height);
    
    [self addSubview:imageView];
    
    // Keep track of where the next image should go
    y += image.size.height;
  }
  
  // Set the contentSize, so we can see all of the images
  self.contentSize = CGSizeMake(CGRectGetWidth(self.bounds), y);
}

@end
