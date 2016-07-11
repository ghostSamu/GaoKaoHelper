//
//  HomeTableSecionHeaderView.m
//  GaoKaoHelper
//
//  Created by YANGLEILEI on 16/7/11.
//  Copyright © 2016年 YANGLEILEI. All rights reserved.
//

#import "HomeTableSecionHeaderView.h"
#import <Masonry.h>

@implementation HomeTableSecionHeaderView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {

        self.frame = frame;

        self.backgroundColor = [UIColor purpleColor];

        [self addSubviews];
    }
    return self;
}

- (void)addSubviews{

    [self addTitle];

    [self addRefreshButton];
}

- (void)addTitle{

    UILabel *title = [UILabel new];

    title.backgroundColor = [UIColor whiteColor];

    title.text = @"News";

    [self addSubview:title];

    [title mas_makeConstraints:^(MASConstraintMaker *make) {

        make.centerY.equalTo(self.mas_centerY);

        make.left.equalTo(self).with.offset(20);

        make.size.mas_equalTo(CGSizeMake(60, 22));
    }];
}

- (void)addRefreshButton{

    UIButton *refreshButton = [UIButton new];

    [refreshButton setImage:[UIImage imageNamed:nil] forState:UIControlStateNormal];

    refreshButton.backgroundColor = [UIColor whiteColor];

    [self addSubview:refreshButton];

    [refreshButton mas_makeConstraints:^(MASConstraintMaker *make) {

        make.centerY.equalTo(self.mas_centerY);

        make.right.equalTo(self).with.offset(-20);

        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
