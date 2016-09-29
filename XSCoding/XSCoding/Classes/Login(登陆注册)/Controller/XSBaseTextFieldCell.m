//
//  XSBaseTextFieldCell.m
//  XSCoding
//
//  Created by apple on 16/9/29.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSBaseTextFieldCell.h"
#import "XSCaptchaImage.h"

@interface XSBaseTextFieldCell ()<UITextFieldDelegate>


@property (strong, nonatomic)UITextField *textField;

@property (strong, nonatomic)UIView *separaLineView;

@property (strong, nonatomic)XSCaptchaImage *captchaImage;





@end

@implementation XSBaseTextFieldCell



- (void)cellDidLoadSubView{
    [super cellDidLoadSubView];
    [self.contentView addSubview:self.textField];
    [self.contentView addSubview:self.separaLineView];
    [self.contentView addSubview:self.captchaImage];
    
    //设置cell的选中样式
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    
    
    //设置自定义属性
    self.separaLineDefaultColor = [UIColor lightGrayColor];
    self.separaLineSelectColor = self.separaLineDefaultColor;
    self.isSeparaLineHiden = NO;//设置分割线默认显示
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
        make.trailing.mas_equalTo(-18);
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
    self.separaLineView.backgroundColor = self.separaLineSelectColor;
   
}
//结束编辑
- (void)textFieldDidEndEditing:(UITextField *)textField{
    self.separaLineView.backgroundColor = self.separaLineDefaultColor;
}


#pragma mark - 修改cell的属性
- (void)setTextPlaceholder:(NSString *)textPlaceholder{
    _textPlaceholder = textPlaceholder;
    self.textField.placeholder = textPlaceholder;
}

- (void)setIsCapIamgeHiden:(BOOL)isCapIamgeHiden{
    _isCapIamgeHiden = isCapIamgeHiden;
    if (!_isCapIamgeHiden) {
        self.captchaImage.hidden = NO;
    }else{
        self.captchaImage.hidden = YES;
        [self.captchaImage removeFromSuperview];
    }
}

- (void)setIsSeparaLineHiden:(BOOL)isSeparaLineHiden{
    _isSeparaLineHiden = isSeparaLineHiden;
    if (!_isSeparaLineHiden) {
        self.separaLineView.hidden = NO;
    }else{
        self.separaLineView.hidden = YES;
        [self.separaLineView removeFromSuperview];
    }
}






#pragma mark - 懒加载设置

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
