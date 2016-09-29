//
//  XSLoginRequst.h
//  XSCoding
//
//  Created by apple on 16/9/29.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XSLoginRequst : NSObject


/**
 账号
 */
@property (nonatomic, copy) NSString *account;

/**
 密码
 */
@property (nonatomic, copy) NSString *password;

/**
 记住账号
 */
@property (nonatomic, copy) NSString *remember_me;

/**
 验证码
 */
@property (nonatomic, copy) NSString *j_captcha;

@end
