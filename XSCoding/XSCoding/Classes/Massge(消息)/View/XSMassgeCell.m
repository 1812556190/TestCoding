//
//  XSMassgeCell.m
//  XSCoding
//
//  Created by apple on 16/10/9.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSMassgeCell.h"

@interface XSMassgeCell ()

@property (strong, nonatomic) UIImageView *cellImage;//左边的图片


@property (strong, nonatomic) UILabel *topTitle;

@property (strong, nonatomic) UILabel *bottomTitle;

@property (strong, nonatomic) UILabel *dateLabel;


//@property (strong, nonatomic) UIView *lineView;


@end


@implementation XSMassgeCell


- (void)loadData{
    
    self.cellImage.image = [UIImage imageNamed:@"placeholder_monkey_round_48"];
    self.topTitle.text = @"Coding";
    self.bottomTitle.text = @"Coding项目功能升级。。。";
    self.dateLabel.text =@"10/9";
}


- (void)cellDidLoadSubView{
    
    [self.contentView addSubview:self.cellImage];
    [self.contentView addSubview:self.topTitle];
    [self.contentView addSubview:self.bottomTitle];
    [self.contentView addSubview:self.dateLabel];
//     [self.contentView addSubview:self.lineView];
    
}

- (void)cellDidAdjustAutoLayout{
    
    [self.cellImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(18);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(48, 48));
    }];
    
    [self.topTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.cellImage.mas_trailing).offset(10);
        make.top.equalTo(self.cellImage.mas_top);
        make.size.mas_equalTo(CGSizeMake(100,24));
    }];
    
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(-18);
         make.top.equalTo(self.topTitle.mas_top);
        make.height.mas_equalTo(24);
    }];
    
    [self.bottomTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.cellImage.mas_trailing).offset(10);
        make.top.equalTo(self.topTitle.mas_top).offset(15);
        make.bottom.equalTo(self.cellImage.mas_bottom);
    }];
//    
//    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.mas_equalTo(0);
//        make.width.mas_equalTo(18);
//        make.top.mas_equalTo(60);
//        make.height.mas_equalTo(1);
//    }];
   
}


#pragma mark - Custom 

- (UIImageView *)cellImage{
    if (!_cellImage) {
        _cellImage = [[UIImageView alloc] init];
    }
    return _cellImage;
}

- (UILabel *)topTitle{
    if (!_topTitle) {
        _topTitle = [[UILabel alloc] init];
        _topTitle.textColor = [UIColor blackColor];
        _topTitle.font = [UIFont boldSystemFontOfSize:15];
    }
    return _topTitle;
}

- (UILabel *)bottomTitle{
    if (!_bottomTitle) {
        _bottomTitle = [[UILabel alloc] init];
        _bottomTitle.textColor = [UIColor colorWithHex:0x999999];
        _bottomTitle.font = [UIFont systemFontOfSize:15];
    }
    return _bottomTitle;
}

- (UILabel *)dateLabel{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] init];
        _dateLabel.textColor = [UIColor colorWithHex:0x999999];
        _dateLabel.font = [UIFont systemFontOfSize:12];
        _dateLabel.textAlignment = NSTextAlignmentRight;
    }
    return _dateLabel;
}

//- (UIView *)lineView{
//    if (!_lineView) {
//        _lineView = [[UIView alloc] init];
//        _lineView.backgroundColor = [UIColor colorR:227 withG:226 withB:228 Alpha:1];
//    }
//    return _lineView;
//}



@end
