//
//  XSSettingController.m
//  XSCoding
//
//  Created by apple on 16/10/9.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSSettingController.h"

#import "XSUserInfo.h"

#import "XSHUDView.h"

#import "XSToolCache.h"

@interface XSSettingController ()
@property (weak, nonatomic) IBOutlet UILabel *cacheLabel;

@end

@implementation XSSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showCacheLabel];//计算当前缓存
    self.title = @"设置";
}


//退出登录按钮
- (IBAction)quitloginAction:(UIButton *)sender {
    
    UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:@"是否退出登录？" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alertCon addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self quitLoginSetting];//退出登录
    }]];
    [alertCon addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [self presentViewController:alertCon animated:YES completion:nil];
}

//退出登录的设置
- (void)quitLoginSetting{
    
    if ([XSUserInfo deleteData]) {
        [XSHUDView showLoadingCorrect:@"退出成功！"];
        [XSUserInfo shareDefaultUserInfo];//清除全局对象user
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.1 animations:^{
                //加载引导页面
                UIViewController *guideVc = [UIViewController storyboardWithName:PublicStorboard instantiateViewControllerWithIdentifier:nil];
                XSKwindow.rootViewController = guideVc;
            }];
        });
    }else{
        [XSHUDView showLoadingError:@"退出失败！"];
    }
}


//显示当前缓存
- (void)showCacheLabel{
    CGFloat size = [XSToolCache folderCacheSize];
    self.cacheLabel.text = [NSString stringWithFormat:@"%.2f M",size];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {//清除缓存
        if ([XSToolCache removeCache]) {
            [XSHUDView showLoadingCorrect:@"清除成功！"];
            [self showCacheLabel];
        }else{
            [XSHUDView showLoadingError:@"清除失败！"];
        }
    }
}




@end
