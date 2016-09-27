//
//  UIViewController+XSViewController.h
//  XSCoding
//
//  Created by apple on 16/9/27.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (XSViewController)



/**
 *
 * 从故事版中获取对应标识符的控制器
 * @param name       故事版的标识
 * @param identifier 控制器的标识符
 *
 * @return 返回一控制器
 */
+ (UIViewController *)storyboardWithName:(NSString *)name instantiateViewControllerWithIdentifier:(NSString *)identifier;


@end
