//
//  XSMineHeaderView.h
//  XSCoding
//
//  Created by apple on 16/10/8.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSTapImageView.h"

#import "XSUserInfo.h"

@interface XSMineHeaderView : XSTapImageView


@property (strong, nonatomic) XSUserInfo *userInfo;

@property (strong, nonatomic) UIImage *backgroundImage;

/**
 传入用户信息及背景图片

 @param user           用户信息
 @param backgroundName 背景图片的名字

 @return 返回一个对象本身
 */
+ (instancetype)shareUserInfo:(XSUserInfo *)user withBackgroundImageName:(NSString *)backgroundName;


- (void)refreshData;

@end
