//
//  UIImage+SGUtils.m
//  SGConfGCDDemo
//
//  Created by Ben Asher on 10/13/15.
//

#import "UIImage+SGUtils.h"

const NSUInteger kNumCatImages = 5;

@implementation UIImage (SGUtils)

+ (void)sg_enumerateCatsAndScaleFactors:(SGCatImageEnumerationBlock)block {
  for (NSUInteger i = 1; i <= kNumCatImages; i++) {
    // Get the scale factor
    CGFloat scale = (CGFloat)i / (CGFloat)kNumCatImages;
    
    // Get the base image
    UIImage *image = [UIImage imageNamed:@"cat.jpg"];
    block(image, scale);
  }
}

- (UIImage *)sg_imageResizedByScaleFactor:(CGFloat)scaleFactor {
  
  // Scale our image
  CGSize size = self.size;
  size.width *= scaleFactor;
  size.height *= scaleFactor;
  
  // Start a new image context
  UIGraphicsBeginImageContextWithOptions(size, YES, 0.0);
  
  // Draw the image at the new size we want
  [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
  
  // Get the resized image
  UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
  
  // Cleanup our image context
  UIGraphicsEndImageContext();
  
  // Return the image
  return resizedImage;
}

@end
