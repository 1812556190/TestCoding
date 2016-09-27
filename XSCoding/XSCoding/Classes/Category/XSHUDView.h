//
//  HUD.h
//  MBLoadingHUD
//
//  Created by develop on 15/9/21.
//  Copyright (c) 2015年 songhailiang. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <MBProgressHUD/MBProgressHUD.h>

@interface XSHUDView : NSObject




/**
 *  隐藏hud
 */
+ (void)hideHUD;
/**
 * 提示文字
 * 显示1秒后隐藏
 */
+ (void)showHUDViewTitle:(NSString *)text;

/**
 * 加载成功时的文字与图片显示
 * 显示1秒后隐藏
 * @param text 提示文字
 */
+ (void)showLoadingCorrect:(NSString *)text;


/**
 * 加载失败时文字与图片显示
 * 显示1秒后隐藏
 * @param text 提示文字
 */
+ (void)showLoadingError:(NSString *)text;


/**
 * 加载过程时调用
 *
 * @param text  不会自动隐藏
 */
+ (void)showLoadingProcessText:(NSString *)text;

@end
