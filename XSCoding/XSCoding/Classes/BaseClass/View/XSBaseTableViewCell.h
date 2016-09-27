//
//  XSBaseTableViewCell.h
//  XSCoding
//
//  Created by apple on 16/9/27.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XSBaseTableViewCell : UITableViewCell


/*
 * 加载子View
 */
- (void)cellDidLoadSubView;

/*
 * 调整布局
 */
- (void)cellDidAdjustAutoLayout;

@end
