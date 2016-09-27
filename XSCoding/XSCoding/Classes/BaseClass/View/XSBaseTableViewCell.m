//
//  XSBaseTableViewCell.m
//  XSCoding
//
//  Created by apple on 16/9/27.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSBaseTableViewCell.h"

@interface XSBaseTableViewCell ()

/*
 *  初始化Cell
 */
- (void)initCell;

@end

@implementation XSBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initCell];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initCell];
    }
    return self;
}


- (void)initCell{
    [self cellDidLoadSubView];
    [self cellDidAdjustAutoLayout];
}

- (void)cellDidLoadSubView{
    
}


- (void)cellDidAdjustAutoLayout{
    
}

@end
