//
//  UIImage.m
//  FitFood
//
//  Created by Raman Harhun on 09.05.16.
//  Copyright © 2016 fitzoneclub. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage(Color)

+ (UIImage *)imageFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
