//
//  NSObject+XSAccess.h
//  XSCoding
//
//  Created by apple on 16/9/30.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (XSAccess)


/**
 存储数据到本地(归档)

 @return 返回是否成功
 */
- (BOOL)saveData;


/**
 获取本地的数据(解档)

 @return 返回解档的数据
 */
+ (instancetype)obtainData;


/**
 删除本地保存的信息

 @return 是否成功
 */
+ (BOOL)deleteData;

@end
