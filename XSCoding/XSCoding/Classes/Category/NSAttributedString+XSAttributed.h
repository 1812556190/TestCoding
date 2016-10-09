//
//  NSAttributedString+XSAttributed.h
//  XSCoding
//
//  Created by apple on 16/10/8.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (XSAttributed)


/**
 拼接图片到富文本后面

 @param string    拼接前的字符串
 @param font      字体大小
 @param color     字体颜色
 @param imageName 需要拼接图片的名字
 @param bounds    图片的大小位置

 @return 返回一个本身对象
 */
+ (instancetype)attributedString:(NSString *)string
                            font:(UIFont *)font
                       textColor:(UIColor *)color
              appendingImageName:(NSString *)imageName
                     imageBounds:(CGRect)bounds;

@end
