//
//  XSToolHttpManager.h
//  XSCoding
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ErrorType) {
    ErrorTypeUserName = 1,
    ErrorTypeCaptcha = 903,
    ErrorTypeError = 1025,
};


typedef void(^successHandler)(id resulst,NSError *error);

@interface XSToolHttpManager : NSObject


+ (instancetype)shareInstance;




/**
 使用AFN进行POST请求

 @param url           Url
 @param parameter     传入的参数
 @param successHander 结果回调
 */
- (void)postHttpUrl:(NSString *)url Parameter:(NSDictionary *)parameter withSuccessHander:(successHandler)successHander;


/**
 使用AFN进行GET请求

 @param url           url
 @param parameter     传入的参数
 @param successHander 结果回调
 */
- (void)getHttpUrl:(NSString *)url Parameter:(NSDictionary *)parameter withSuccessHander:(successHandler)successHander;


@end
