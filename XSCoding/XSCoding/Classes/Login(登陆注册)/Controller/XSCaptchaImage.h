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
 刷新验证码

 @param url 验证码的Url
 */
- (void)refreshCaptchaImageUrl:(NSString *)url;

@end
