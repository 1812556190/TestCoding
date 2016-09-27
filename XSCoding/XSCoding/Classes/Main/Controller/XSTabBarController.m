//
//  XSTabBarController.m
//  XSCoding
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSTabBarController.h"
#import "XSBaseNavigationController.h"
#import "UIColor+XSColor.h"
@interface XSTabBarController ()

@end

@implementation XSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    [self setterTabBar];
}




#pragma mark - settingTabBar

- (void)setterTabBar{
    self.tabBar.tintColor = [UIColor colorR:51 withG:179 withB:101 Alpha:1];

    NSMutableArray *arrays = [NSMutableArray arrayWithArray:self.viewControllers];
    
    
    for (NSInteger i = 0; i < arrays.count; i ++) {
        UIViewController *vc = arrays[i];
        
        XSBaseNavigationController *nva = [[XSBaseNavigationController alloc] initWithRootViewController:vc];
        
        arrays[i] = nva;
    }
    
    self.viewControllers = arrays;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
