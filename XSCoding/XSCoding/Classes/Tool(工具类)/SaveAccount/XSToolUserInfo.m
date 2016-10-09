//
//  XSToolUserInfo.m
//  XSCoding
//
//  Created by apple on 16/10/9.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSToolUserInfo.h"

#define CURRENTACCOUNT @"account"

@implementation XSToolUserInfo



+ (BOOL)saveAccount:(NSString *)account{
    //保存账号到偏好设置
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:account forKey:CURRENTACCOUNT];
  return  [userDefault synchronize];//同步数据
}


+ (NSString *)obtainAccount{
    
    NSString *account = [[NSUserDefaults standardUserDefaults] objectForKey:CURRENTACCOUNT];
    if (account == nil) {
        return @"";
    }
    
    return account;
}

@end
