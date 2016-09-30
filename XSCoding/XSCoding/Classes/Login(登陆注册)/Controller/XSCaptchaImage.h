//
//  XSCaptchaImage.h
//  XSCoding
//
//  Created by apple on 16/9/28.
//  Copyright © 2016年 Lingser. All rights reserved.
//  验证码按钮

#import <UIKit/UIKit.h>

@interface XSCaptchaImage : UIButton


@property (nonatomic, copy) void(^captchaImageBlock)(XSCaptchaImage *captchaImage);



/**
 刷新验证码
 */
- (void)refreshCaptchaImage;

@end
