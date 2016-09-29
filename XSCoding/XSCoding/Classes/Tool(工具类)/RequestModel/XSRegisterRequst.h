//
//  XSRegisterRequst.h
//  XSCoding
//
//  Created by apple on 16/9/28.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XSRegisterRequst : NSObject


/**
 昵称
 */
@property (nonatomic, copy) NSString *global_key;

/**
 邮箱
 */
@property (nonatomic, copy) NSString *email;

/**
 密码
 */
@property (nonatomic, copy) NSString *password;

/**
 验证密码
 */
@property (nonatomic, copy) NSString *confirm;

/**
 验证码
 */
@property (nonatomic, copy) NSString *j_captcha;

@end
