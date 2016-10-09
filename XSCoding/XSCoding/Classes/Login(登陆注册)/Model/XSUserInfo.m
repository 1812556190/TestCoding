//
//  XSUserInfo.m
//  XSCoding
//
//  Created by apple on 16/9/30.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSUserInfo.h"

#import <MJExtension.h>

static XSUserInfo *user = nil;

@implementation XSUserInfo


MJExtensionCodingImplementation


+ (instancetype)shareDefaultUserInfo{
    if (!user && [XSUserInfo obtainData]) {//注册登陆成功后，本地有数据时就会返回对象本身
        user = [self obtainData];//解档
    } else {//当退出登录后就会重新初始化user将其设置为nil
        user = nil;
    }
    return user;
}




@end
