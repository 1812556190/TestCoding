//
//  XSToolHttpManager.h
//  XSCoding
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^successHandler)(id resulst,NSError *error);

@interface XSToolHttpManager : NSObject



+ (instancetype)shareInstance;



/**
 *
 * 登陆请求
 * @param parameter      请求的参数
 * @param successHander  成功的回调
 */
- (void)login:(NSDictionary *)parameter withSuccessHander:(successHandler)successHander;


@end
