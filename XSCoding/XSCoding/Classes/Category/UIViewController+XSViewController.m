//
//  UIViewController+XSViewController.m
//  XSCoding
//
//  Created by apple on 16/9/27.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "UIViewController+XSViewController.h"

@implementation UIViewController (XSViewController)


+ (UIViewController *)storyboardWithName:(NSString *)name instantiateViewControllerWithIdentifier:(NSString *)identifier{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    if (identifier) {
          return [storyboard instantiateViewControllerWithIdentifier:identifier];
    }else{
        return [storyboard instantiateInitialViewController];
    }
}

@end
