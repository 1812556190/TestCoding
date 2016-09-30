//
//  XSBaseTextFieldCell.h
//  XSCoding
//
//  Created by apple on 16/9/29.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSBaseTableViewCell.h"

@interface XSBaseTextFieldCell : XSBaseTableViewCell


/**
 获取输入框输入的值
 */
@property (nonatomic, copy) void(^textChangeBlock)(NSString *text);
/**
 输入框的提示文字
 */
@property (nonatomic, copy) NSString *textPlaceholder;

/**
 分割线选中时的颜色
 */
@property (nonatomic, strong) UIColor *separaLineSelectColor;
/**
 分割线默认的颜色
 */
@property (nonatomic, strong) UIColor *separaLineDefaultColor;
/**
 设置输入框右侧是否有验证码 默认无
 */
@property (nonatomic, assign) BOOL isCapIamgeHiden;
/**
 设置是否隐藏分割线 默认显示
 */
@property (nonatomic, assign) BOOL isSeparaLineHiden;

/**
 设置输入框提示文字颜色,设置之前必须保证提示文字已被设置
 */
@property (nonatomic, strong) UIColor *placeholderColor;


/**
 设置输入框是否以密文形式输入
 */
@property (nonatomic, assign) BOOL isTextSecureTextEntry;

/**
 是否刷新验证码
 */
@property (nonatomic, assign) BOOL isRefreshCaptcha;

@end
