//
//  XSToolHttpRequst.h
//  XSCoding
//
//  Created by apple on 16/9/29.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XSToolHttpManager.h"

@interface XSToolHttpRequst : NSObject



/**
 发送请求是否需要验证码
 
 @param url          url
 @param successHande 结果回调
 */
+ (void)requstIsCaptchaUrlStr:(NSString *)url withSuccessHander:(successHandler)successHande;

/**
 登陆请求

 @param parameter     登陆传入的参数
 @param successHander 结果回调
 */
+ (void)requstLoginParameter:(NSDictionary *)parameter withSuccessHander:(successHandler)successHander;

/**
 注册请求
 post请求方式
 @param parameter     传入的参数字典
 @param successHander 成功的回调
 */
+ (void)registerRequstParameter:(NSDictionary *)parameter withSuccessHander:(successHandler)successHander;

@end
