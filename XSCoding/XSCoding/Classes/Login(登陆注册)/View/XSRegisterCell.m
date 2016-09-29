//
//  XSRegisterCell.m
//  XSCoding
//
//  Created by apple on 16/9/28.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSRegisterCell.h"
#import <Masonry.h>


@interface XSRegisterCell ()



@end

@implementation XSRegisterCell




- (void)cellDidLoadSubView{
    [super cellDidLoadSubView];
    [self.contentView addSubview:self.textField];
    [self.contentView addSubview:self.capImage];
 
//    __weak typeof(self) weakSelf = self;
//    self.capImage.captchaImageBlock = ^(XSCaptchaImage *capImage){
//        [weakSelf.capImage refreshCaptchaImageUrl:@"https://coding.net/api/getCaptcha"];
//    };
}


- (void)cellDidAdjustAutoLayout{
    [super cellDidAdjustAutoLayout];
    
    //设置textField的自动布局
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(18);
            make.trailing.mas_equalTo(-18);
            make.top.bottom.mas_equalTo(0);
        }];
    }];
    
    [self.capImage mas_makeConstraints:^(MASConstraintMaker *make) {
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



#pragma mark -

- (UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.textColor = [UIColor colorWithHex:0x222222 alpha:1];
        _textField.delegate = self;
        
    }
    return _textField;
}

- (XSCaptchaImage *)capImage{
    if (!_capImage) {
        _capImage = [XSCaptchaImage buttonWithType:UIButtonTypeCustom];
    }
    return _capImage;
}


@end
