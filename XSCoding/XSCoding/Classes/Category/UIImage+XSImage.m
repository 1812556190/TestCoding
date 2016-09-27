//
//  UIImage+XSImage.m
//  XSCoding
//
//  Created by apple on 16/9/27.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "UIImage+XSImage.h"

@implementation UIImage (XSImage)


+ (UIImage *)imageWithColor:(UIColor *)color{
     CGSize size = CGSizeMake(1, 1);
     UIGraphicsBeginImageContext(size);
     CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, color.CGColor);
    CGContextFillRect(ctx, CGRectMake(0, 0, 1, 1));//开始绘制
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
