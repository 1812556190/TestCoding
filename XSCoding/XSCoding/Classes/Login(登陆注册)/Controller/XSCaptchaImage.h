//
//  XSCaptchaImage.h
//  XSCoding
//
//  Created by apple on 16/9/28.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XSCaptchaImage : UIButton


@property (nonatomic, copy) void(^captchaImageBlock)(XSCaptchaImage *captchaImage);


/**
 是否隐藏视图，默认隐藏
 */
@property (nonatomic, assign) BOOL isCaptchaHiden;


/**
 刷新验证码

 @param url 验证码的Url
 */
- (void)refreshCaptchaImageUrl:(NSString *)url;

@end
