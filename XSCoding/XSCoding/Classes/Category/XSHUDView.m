//
//  HUD.m
//  MBLoadingHUD
//
//  Created by develop on 15/9/21.
//  Copyright (c) 2015年 songhailiang. All rights reserved.
//

#import "XSHUDView.h"
#import <MBProgressHUD.h>

@implementation XSHUDView

#pragma mark - 创建单例
+(MBProgressHUD *)sharedHUD{
    static MBProgressHUD* hud;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hud = [[MBProgressHUD alloc] initWithView:[[UIApplication sharedApplication].delegate window]];
        hud.removeFromSuperViewOnHide = YES;
    });
    return hud;
}

#pragma mark - Public

//隐藏hud
+ (void)hideHUD
{
    if([self sharedHUD].superview){
        [[self sharedHUD] hideAnimated:YES];
    }
}


//加载成功时的文字与图片显示
+ (void)showLoadingCorrect:(NSString *)text {
    [self showLoadingHUDviewImageOrTitle:[UIImage imageNamed:@"GG"] withTitle:text];
}

//加载失败时文字与图片显示
+ (void)showLoadingError:(NSString *)text{
    [self showLoadingHUDviewImageOrTitle:[UIImage imageNamed:@"XX"] withTitle:text];
}


//直接传入错误信息
+ (void)showHUDViewError:(NSError *)error{
    NSDictionary *dictionary = error.userInfo[@"msg"];
    [self showHUDViewTitle:[[dictionary allValues] firstObject]];
}



//提示文字
+ (void)showHUDViewTitle:(NSString *)text{
    MBProgressHUD *hud = [self creatMBHUDView];
    hud.mode = MBProgressHUDModeText;
    hud.margin = 10.0f; //设置HUD和customerView的边距（默认是20）
    hud.label.text = text;
    [self afterHidenHUD];
}


//加载过程时调用

+ (void)showLoadingProcessText:(NSString *)text{
    MBProgressHUD *HUD = [self sharedHUD];
    [self appendToView:nil];
    HUD.mode = MBProgressHUDModeIndeterminate;
    [HUD showAnimated:YES];
    HUD.label.text = text;
}


#pragma mark - HUDViewSetting





//文字与图片显示
+ (void)showLoadingHUDviewImageOrTitle:(UIImage *)image withTitle:(NSString *)text{
    MBProgressHUD *hud = [self creatMBHUDView];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 0, hud.customView.width, hud.customView.height);
    hud.customView = imageView;
    hud.margin = 10;//边距
    hud.detailsLabel.text = text;
    hud.detailsLabel.font = [UIFont systemFontOfSize:15];
    
    [self afterHidenHUD];
}

//创建HUD
+ (MBProgressHUD *)creatMBHUDView{
    
    MBProgressHUD *hud = [self sharedHUD];
    [self appendToView:nil];
    hud.mode = MBProgressHUDModeCustomView;
     hud.label.text = nil;
    [hud showAnimated:YES];
    return hud;
}

//延时隐藏
+ (void)afterHidenHUD{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hideHUD];
    });
}

//计算文字的尺寸
+ (CGSize)calculateTextSize:(NSString *)text{
    CGSize textSize = [text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    
    return textSize;
}

//判断当前的Window是否有提示视图
+ (void)appendToView:(UIView *)containerView
{
    if (containerView) {
        [containerView addSubview:[self sharedHUD]];
    }
    else {
        [[[UIApplication sharedApplication].delegate window] addSubview:[self sharedHUD]];
    }
}


@end
