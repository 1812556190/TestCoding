//
//  XSTapImageView.m
//  XSCoding
//
//  Created by apple on 16/10/8.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSTapImageView.h"

@implementation XSTapImageView


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initTapImageView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initTapImageView];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initTapImageView];
}

- (void)initTapImageView {
    
    self.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    [self addGestureRecognizer:tap];
}


- (void)singleTap:(UITapGestureRecognizer *)gesture {
    if (self.handleTapBlock) {
        self.handleTapBlock(self);
    }
}

@end
