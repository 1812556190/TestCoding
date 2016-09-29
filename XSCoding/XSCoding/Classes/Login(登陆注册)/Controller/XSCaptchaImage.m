//
//  XSCaptchaImage.m
//  XSCoding
//
//  Created by apple on 16/9/28.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSCaptchaImage.h"



@interface XSCaptchaImage ()

@end

@implementation XSCaptchaImage





- (instancetype)init
{
    self = [super init];
    if (self) {
       [self initTapImageBtn];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       [self initTapImageBtn];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self initTapImageBtn];
}
//初始化按钮
- (void)initTapImageBtn{
    
    self.titleLabel.font = [UIFont systemFontOfSize:11];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setTitle:@"获取验证码" forState:UIControlStateNormal];
    self.backgroundColor = [UIColor colorWithHex:0xe3e3 alpha:1];
    self.hidden = YES;
//    self.isCaptchaHiden = YES;
    [self addTarget:self action:@selector(btnActon:) forControlEvents:UIControlEventTouchUpInside];
    
    
}


- (void)btnActon:(UIButton *)btn{
    
    [self refreshCaptchaImageUrl:CaptchaIamgeUrlStr];
    
//    if (self.captchaImageBlock) {
//        self.captchaImageBlock(self);
//    }
}
#pragma mark - public

- (void)refreshCaptchaImageUrl:(NSString *)url{
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url] options:NSDataReadingMappedIfSafe error:nil];
    UIImage *image= [UIImage imageWithData:data];
    [self setTitle:@"" forState:UIControlStateNormal];
    [self setImage:image forState:UIControlStateNormal];
}


//- (void)setIsCaptchaHiden:(BOOL)isCaptchaHiden{
//    _isCaptchaHiden = isCaptchaHiden;
//    if (!_isCaptchaHiden) {
//        self.hidden = NO;
//        return;
//    }
//    [self removeFromSuperview];
//}

@end
