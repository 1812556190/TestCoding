//
//  XSCaptchaRespon.h
//  XSCoding
//
//  Created by apple on 16/9/28.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XSCaptchaRespon : NSObject


/**
  请求的结果0:请求成功
 */
@property (nonatomic, copy) NSString *code;

/**
 false: 不需要验证码， true: 需要验证码
 */
@property (nonatomic, assign) BOOL data;

@end
