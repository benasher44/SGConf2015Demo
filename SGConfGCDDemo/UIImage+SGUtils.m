//
//  UIImage+SGUtils.m
//  SGConfGCDDemo
//
//  Created by Ben Asher on 10/13/15.
//

#import "UIImage+SGUtils.h"

@implementation UIImage (SGUtils)

- (UIImage *)sg_imageResizedByScaleFactor:(CGFloat)scaleFactor {
  
  // Scale our image
  CGSize size = self.size;
  size.width *= scaleFactor;
  size.height *= scaleFactor;
  
  // Start a new image context
  UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
  
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
