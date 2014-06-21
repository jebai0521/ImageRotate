//
//  UIImage+Rotate.m
//  ImageRotate
//
//  Created by mingchen on 6/19/14.
//  Copyright (c) 2014 sencloudx. All rights reserved.
//

#import "UIImage+Rotate.h"

@implementation UIImage (Rotate)

- (UIImage*) rotateDegree:(CGFloat)degree
{
    CGSize size = self.size;

    CGFloat cos = cosf(degree);
    CGFloat sin = sinf(degree);

    CGFloat h1 = size.height * cos;
    CGFloat w1 = size.height * sin;

    NSLog(@"h1 %f w1 %f", h1, w1);

    CGFloat h2 = size.width * sin;
    CGFloat w2 = size.width * cos;

    NSLog(@"h2 %f w2 %f", h2, w2);

    CGSize newSize = CGSizeMake(fabsf(w1) + fabsf(w2), fabsf(h1) + fabsf(h2));

    UIGraphicsBeginImageContextWithOptions(newSize,
                                           NO,                     // Opaque
                                           self.scale);             // Use image scale
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextClearRect(contextRef, CGRectMake(0, 0, newSize.width, newSize.height));
    CGContextSetRGBFillColor(contextRef, 1, 1, 1, 0.0);
    CGContextFillRect(context, CGRectMake(0, 0, newSize.width, newSize.height));

    CGContextTranslateCTM(context, newSize.width / 2, newSize.height / 2);
    CGContextConcatCTM(context, CGAffineTransformMakeRotation(degree));
    CGContextTranslateCTM(context, newSize.width / -2, newSize.height / -2);

    CGFloat x = (newSize.width - size.width) / 2;
    CGFloat y = (newSize.height - size.height) / 2;

    [self drawInRect:CGRectMake(x, y, size.width, size.height)];
    UIImage *rotatedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return rotatedImage;
}

@end
