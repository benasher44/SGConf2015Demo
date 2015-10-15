//
//  UIImage+SGUtils.h
//  SGConfGCDDemo
//
//  Created by Ben Asher on 10/13/15.
//

#import <UIKit/UIKit.h>

typedef void(^SGCatImageEnumerationBlock)(UIImage * _Nonnull catImage, CGFloat scaleFactor);

@interface UIImage (SGUtils)

+ (void)sg_enumerateCatsAndScaleFactors:(nonnull SGCatImageEnumerationBlock)block;

- (nonnull UIImage *)sg_imageResizedByScaleFactor:(CGFloat)scaleFactor;

@end
