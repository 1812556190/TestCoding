//
//  UIView+XSFrame.m
//  XSNews
//
//  Created by apple on 16/8/13.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "UIView+XSFrame.h"

@implementation UIView (XSFrame)

//自己实现set方法
@dynamic borderColor,borderWidth,cornerRadius;




//实现故事版设置圆角
- (void)setCornerRadius:(CGFloat)cornerRadius{
    
    self.layer.cornerRadius = cornerRadius;
}
//实现故事版设置边框宽度
- (void)setBorderWidth:(CGFloat)borderWidth{
    
    self.layer.borderWidth = borderWidth;
}

////实现故事版设置边框颜色
- (void)setBorderColor:(UIColor *)borderColor{
    
    self.layer.borderColor = borderColor.CGColor;
}






- (void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x{
    return self.frame.origin.x;
}



- (void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (CGFloat)y{
    return self.frame.origin.y;
}


- (void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (CGFloat)width{
    return self.frame.size.width;
}


- (void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (CGFloat)height{
    return self.frame.size.height;
}





@end
