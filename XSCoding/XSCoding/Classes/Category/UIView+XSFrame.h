//
//  UIView+XSFrame.h
//  XSNews
//
//  Created by apple on 16/8/13.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XSFrame)
// 分类不能添加成员属性
// @property如果在分类里面，只会自动生成get,set方法的声明，不会生成成员属性，和方法的实现

@property (nonatomic, assign)CGFloat x;
@property (nonatomic, assign)CGFloat y;
@property (nonatomic, assign)CGFloat width;
@property (nonatomic, assign)CGFloat height;

@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

@property (nonatomic, assign) IBInspectable CGFloat borderWidth;


@property (nonatomic, assign) IBInspectable UIColor *borderColor;

@end
