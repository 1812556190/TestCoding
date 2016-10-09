//
//  XSToolUserInfo.h
//  XSCoding
//
//  Created by apple on 16/10/9.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XSToolUserInfo : NSObject


/**
 保存账号到本地

 @param account 用户账号

 @return 返回是否成功
 */
+ (BOOL)saveAccount:(NSString *)account;


/**
 获取本地保存的账号

 @return 返回账号
 */
+ (NSString *)obtainAccount;

@end
