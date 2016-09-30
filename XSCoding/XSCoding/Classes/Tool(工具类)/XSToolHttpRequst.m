//
//  XSToolHttpRequst.m
//  XSCoding
//
//  Created by apple on 16/9/29.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSToolHttpRequst.h"
#import "XSHUDView.h"

@interface XSToolHttpRequst ()


@end


@implementation XSToolHttpRequst




//登陆请求
+ (void)requstLoginParameter:(NSDictionary *)parameter withSuccessHander:(successHandler)successHander{
    
    [[XSToolHttpManager shareInstance] postHttpUrl:XSLoginURLString Parameter:parameter withSuccessHander:^(id resulst, NSError *error) {
        NSLog(@"%@",error);
        if (error) {
            if (error.code) {
                NSDictionary *dictionary = error.userInfo[@"msg"];
                [XSHUDView showHUDViewTitle:[[dictionary allValues] firstObject]];
            }
            successHander(nil,error);
        }else{
            successHander(resulst,nil);
        }
        
    }];
}

//注册请求
+ (void)registerRequstParameter:(NSDictionary *)parameter withSuccessHander:(successHandler)successHander{
    
    [[XSToolHttpManager shareInstance] postHttpUrl:XSRegisterURLString Parameter:parameter withSuccessHander:^(id resulst, NSError *error) {
        
        error = nil;
        if (error) {
            if (error.code == ErrorTypeCaptcha ||
                error.code == ErrorTypeUserName||
                error.code == 1025) {
                NSDictionary *dictionary = error.userInfo[@"msg"];
                [XSHUDView showHUDViewTitle:[[dictionary allValues] firstObject]];
            }
            successHander(nil,error);
        }else{
            successHander(resulst,nil);
        }
    }];
}


//请求是否需要验证码
+ (void)requstIsCaptchaUrlStr:(NSString *)url withSuccessHander:(successHandler)successHander{
    
    [[XSToolHttpManager shareInstance] getHttpUrl:url Parameter:nil withSuccessHander:^(id resulst, NSError *error) {
        
        successHander(resulst,error);//请求的结果回调
        
    }];
}



@end
