//
//  XSMineHeaderView.m
//  XSCoding
//
//  Created by apple on 16/10/8.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSMineHeaderView.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>


#define FONTSIZE 18

@interface XSMineHeaderView ()

@property (strong, nonatomic) XSTapImageView *icon;//用户图片

@property (strong, nonatomic) UILabel *nameLabel;//用户名

@property (strong, nonatomic) UIButton *fansBtn;//粉丝数

@property (strong, nonatomic) UIButton *focusBtn;//关注数

@property (strong, nonatomic) UIView *dividerView;//分割线

@property (strong, nonatomic) UIView *maskBackView;//背景视图





@end

@implementation XSMineHeaderView


+ (instancetype)shareUserInfo:(XSUserInfo *)user withBackgroundImageName:(NSString *)backgroundName{
    
    XSMineHeaderView *mineView = [[XSMineHeaderView alloc] init];
    mineView.contentMode = UIViewContentModeScaleAspectFill;//图片模式
    mineView.clipsToBounds = YES;
    mineView.userInfo = user;
    mineView.backgroundImage = [UIImage imageNamed:backgroundName];
    
    [mineView refreshData];
    return mineView;
}

//设置用户信息显示
- (void)refreshData{
    self.image = self.backgroundImage;
    
    NSString *sexName = [self.userInfo.sex integerValue] ? @"n_sex_woman_icon" : @"n_sex_man_icon";
//    NSLog(@"%@",self.userInfo.name);
    
    NSAttributedString *name = [NSAttributedString attributedString:self.userInfo.name font:[UIFont boldSystemFontOfSize:FONTSIZE] textColor:[UIColor whiteColor] appendingImageName:sexName imageBounds:CGRectMake(10, 0, 14, 14)];
    self.nameLabel.attributedText = name;
    
    [self.icon sd_setImageWithURL:[NSURL URLWithString:[self.userInfo.avatar imageUrlWithStringSize:75]] placeholderImage:[UIImage imageNamed:@"placeholder_monkey_round_54"]];
    
    
    [self.fansBtn setTitle:[NSString stringWithFormat:@"%ld 粉丝",[self.userInfo.fans_count integerValue]] forState:UIControlStateNormal];
    
    [self.focusBtn setTitle:[NSString stringWithFormat:@"%ld 关注",[self.userInfo.follows_count integerValue]] forState:UIControlStateNormal];
    
    
    
    
}


#pragma mark - 初始化视图
//初始化方法
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self viewDidLoadSubViews];//加载所有的子视图
        [self viewDidAdjustAutoLayout];//调整子视图的位置及大小
    }
    return self;
}


- (void)viewDidLoadSubViews{
    [self addSubview:self.maskBackView];
    [self addSubview:self.dividerView];
    [self addSubview:self.fansBtn];
    [self addSubview:self.focusBtn];
    [self addSubview:self.nameLabel];
    [self addSubview:self.icon];
    
}

- (void)viewDidAdjustAutoLayout{
    
    [self.maskBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.dividerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.mas_equalTo(-15);
        make.size.mas_equalTo(CGSizeMake(1, 15));
    }];
    
    [self.fansBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.dividerView.mas_leading).offset(-15);
        make.centerY.equalTo(self.dividerView);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
    
    [self.focusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.dividerView.mas_trailing).offset(15);
        make.centerY.equalTo(self.dividerView);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.fansBtn.mas_top).offset(-20);
        make.centerX.equalTo(self);
        make.width.mas_equalTo(200);
    }];
    
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.nameLabel.mas_top).offset(-15);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(75, 75));
    }];
    
}


#pragma mark - 懒加载视图

- (XSTapImageView *)icon{
    if (!_icon) {
        _icon = [[XSTapImageView alloc] init];
        _icon.layer.borderWidth = 2;
        _icon.layer.borderColor = [UIColor whiteColor].CGColor;
        _icon.layer.cornerRadius = 37.5;
    }
    return _icon;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLabel;
}

- (UIButton *)fansBtn{
    if (!_fansBtn) {
        _fansBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _fansBtn.titleLabel.font = [UIFont boldSystemFontOfSize:FONTSIZE - 4];
        _fansBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;//按钮整体向右偏移
    }
    return _fansBtn;
}

- (UIButton *)focusBtn{
    if (!_focusBtn) {
        _focusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _focusBtn.titleLabel.font = [UIFont boldSystemFontOfSize:FONTSIZE - 4];
        _focusBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;//按钮整体向左偏移
    }
    return _focusBtn;
}

- (UIView *)dividerView{
    if (!_dividerView) {
        _dividerView  = [[UIView alloc] init];
        _dividerView.backgroundColor = [UIColor whiteColor];
    }
    return _dividerView;
}

- (UIView *)maskBackView{
    if (!_maskBackView) {
        _maskBackView = [[UIImageView alloc] init];
        _maskBackView.backgroundColor = [UIColor colorWithHex:0x000000 alpha:0.4];
    }
    return _maskBackView;
}

@end
