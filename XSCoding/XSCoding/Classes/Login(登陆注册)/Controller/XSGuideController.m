//
//  XSGuideController.m
//  XSCoding
//
//  Created by apple on 16/9/27.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSGuideController.h"
#import <Masonry.h>

#import "XSRegisterController.h"
#import "XSLoginController.h"

@interface XSGuideController ()

@property (weak, nonatomic) IBOutlet UIScrollView *loginScrollview;
@property (weak, nonatomic) IBOutlet UIPageControl *loginPage;


@end

@implementation XSGuideController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settingViews];
}

#pragma mark -setting&CreatSubViews

- (void)settingViews{
    
    [self createScrollView];
    
    self.loginScrollview.bounces = NO;//设置缓冲效果
    
}

- (void)createScrollView{
    
    //加载数据
    NSMutableArray *iconImages = [NSMutableArray array];
    NSMutableArray *tipImages = [NSMutableArray array];
    for (NSInteger i = 0; i< 7; i ++) {
        [iconImages addObject:[NSString stringWithFormat:@"intro_icon_%ld",i]];
        [tipImages addObject:[NSString stringWithFormat:@"intro_tip_%ld",i]];
    }
    //创建页面
    for (NSInteger i = 0; i < iconImages.count; i ++) {
        UIImage *iconImage = [UIImage imageNamed:iconImages[i]];
        UIImage *tipImage = [UIImage imageNamed:tipImages[i]];
        
        
        UIImageView *iconImageView = [[UIImageView alloc] initWithImage:iconImage];
        [self.loginScrollview addSubview:iconImageView];
        //自动布局
        [iconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(i * XSSREENWIDTH);
            make.centerY.equalTo(self.view).offset(-100);
        }];
        
        
        UIImageView *tipImageView = [[UIImageView alloc] initWithImage:tipImage];
        [self.loginScrollview addSubview:tipImageView];
         //自动布局
        [tipImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(iconImageView.mas_bottom).offset(25);
            make.centerX.equalTo(iconImageView.mas_centerX);
        }];
    }
    
    self.loginScrollview.contentSize = CGSizeMake(XSSREENWIDTH * 7, XSSREENHEIGHT);
 
}

#pragma mark - <UIScrollViewDelegate>

//结束减速的时候
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger pageIndex = self.loginScrollview.contentOffset.x / XSSREENWIDTH;
    self.loginPage.currentPage = pageIndex;
}




- (IBAction)reigsterAction:(UIButton *)sender {
    
    UIViewController *reigsterVc = [UIViewController storyboardWithName:PublicStorboard instantiateViewControllerWithIdentifier:RegisterController];
    UINavigationController *nva = [[UINavigationController alloc] initWithRootViewController:reigsterVc];
    
    [self presentViewController:nva animated:YES completion:nil];
    
}
- (IBAction)loginAction:(UIButton *)sender {
    
    UIViewController *loginVc = [UIViewController storyboardWithName:PublicStorboard instantiateViewControllerWithIdentifier:LoginController];
    [self presentViewController:loginVc animated:YES completion:nil];
    
}



@end
