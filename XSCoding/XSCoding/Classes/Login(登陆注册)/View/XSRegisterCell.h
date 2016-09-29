//
//  XSRegisterCell.h
//  XSCoding
//
//  Created by apple on 16/9/28.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSBaseTableViewCell.h"
#import "XSCaptchaImage.h"

@interface XSRegisterCell : XSBaseTableViewCell<UITextFieldDelegate>


@property (nonatomic, strong) UITextField *textField;


/**
 输入框输入的值
 */
@property (nonatomic, copy) void(^textChangeBlock)(NSString *text);

@property (strong, nonatomic)XSCaptchaImage *capImage;

@end
