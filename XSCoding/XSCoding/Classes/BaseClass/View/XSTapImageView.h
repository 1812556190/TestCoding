//
//  XSTapImageView.h
//  XSCoding
//
//  Created by apple on 16/10/8.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XSTapImageView : UIImageView

@property (copy, nonatomic) void(^handleTapBlock)(XSTapImageView *tapImageView);

@end
