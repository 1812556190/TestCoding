//
//  UIColor+XSColor.m
//  XSCoding
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "UIColor+XSColor.h"

@implementation UIColor (XSColor)


+ (UIColor *)colorR:(CGFloat)r withG:(CGFloat)g withB:(CGFloat)b Alpha:(CGFloat)alpha{
    return  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:alpha];
}


+ (UIColor *)colorRandom{

    return [UIColor colorR:random()%255 withG:random() % 255 withB:random() % 255 Alpha:1.0];
}

+ (UIColor *)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}


+ (UIColor*) colorWithHex:(NSInteger)hexValue
{
    return [UIColor colorWithHex:hexValue alpha:1.0];
}




@end
