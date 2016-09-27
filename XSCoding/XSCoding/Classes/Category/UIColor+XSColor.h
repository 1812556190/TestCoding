//
//  UIColor+XSColor.h
//  XSCoding
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (XSColor)



/**
 * rgb
 * @return 返回颜色
 */
+ (UIColor *)colorR:(CGFloat)r withG:(CGFloat)g withB:(CGFloat)b Alpha:(CGFloat)alpha;


/**
 * 返回随机颜色
 */
+ (UIColor *)colorRandom;

/**
 * 将16进制颜色转换成UIColor 可以设置透明度
 */
+ (UIColor *)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
/**
 * 将16进制颜色转换成UIColor 透明度默认为1
 */
+ (UIColor*) colorWithHex:(NSInteger)hexValue;

@end
