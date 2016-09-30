//
//  UITextField+XSTextField.m
//  XSCoding
//
//  Created by apple on 16/9/30.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "UITextField+XSTextField.h"
#import <objc/runtime.h>

@implementation UITextField (XSTextField)
@dynamic placeHolderColor;

+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method origMethod = class_getInstanceMethod([UITextField class], @selector(setPlaceholder:));
        Method method = class_getInstanceMethod([UITextField class], @selector(hook_setPlaceholder:));
        method_exchangeImplementations(origMethod, method);
    });
}

- (void)hook_setPlaceholder:(NSString *)placeholder {
    
    if (self.placeHolderColor) {
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName: self.placeHolderColor}];
    } else {
        [self hook_setPlaceholder:placeholder]; // 实际调用setPlaceholder:
    }
}

- (void)setPlaceHolderColor:(UIColor *)placeHolderColor {
    objc_setAssociatedObject(self, @selector(setPlaceHolderColor:), placeHolderColor, OBJC_ASSOCIATION_RETAIN);
    
}

- (UIColor *)placeHolderColor {
    return objc_getAssociatedObject(self, @selector(setPlaceHolderColor:));
}
@end
