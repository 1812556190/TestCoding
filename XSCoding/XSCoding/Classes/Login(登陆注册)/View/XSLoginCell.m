//
//  XSLoginCell.m
//  XSCoding
//
//  Created by apple on 16/9/28.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSLoginCell.h"
#import <Masonry.h>

@interface XSLoginCell ()

@property (strong, nonatomic) UIView *separaLineView;;

@end

@implementation XSLoginCell





- (void)cellDidLoadSubView{
    [super cellDidLoadSubView];
    [self.contentView addSubview:self.textField];
    [self.contentView addSubview:self.separaLineView];
    [self.contentView addSubview:self.captchaImage];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
//    __weak typeof(self) weakSelf = self;
//    self.captchaImage.captchaImageBlock = ^(XSCaptchaImage *capimage){
//        [weakSelf.captchaImage refreshCaptchaImageUrl:@"https://coding.net/api/getCaptcha"];
//    };
}




- (void)cellDidAdjustAutoLayout{
    [super cellDidAdjustAutoLayout];
    
//    设置textField的自动布局
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(18);
            make.trailing.mas_equalTo(-18);
            make.top.bottom.mas_equalTo(1);
        }];
    }];
    //设置分割线
    [self.separaLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(18);
        make.trailing.mas_equalTo(-18);
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(XSSREENWIDTH - 36,1));
    }];
    
    //设置验证码图片
    [self.captchaImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(-10);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(60, 25));
    }];
    
    
    
    
}




#pragma mark - <UITextFieldDelegate>


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (self.textChangeBlock) {
        self.textChangeBlock([textField.text stringByAppendingString:string]);
    }
    
    return YES;
}
//开始编辑
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    self.separaLineView.backgroundColor = [UIColor whiteColor];
}
//结束编辑
- (void)textFieldDidEndEditing:(UITextField *)textField{
    self.separaLineView.backgroundColor = [UIColor lightGrayColor];
}



#pragma mark -

- (UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.delegate = self;
        
    }
    return _textField;
}


- (XSCaptchaImage *)captchaImage{
    if (!_captchaImage) {
        _captchaImage = [XSCaptchaImage buttonWithType:UIButtonTypeCustom];
    }
    return _captchaImage;
}


- (UIView *)separaLineView{
    if (!_separaLineView) {
        _separaLineView = [[UIView alloc] init];
        _separaLineView.backgroundColor = [UIColor lightGrayColor];
    }
    return _separaLineView;
}



@end
