//
//  HomeTableHeaderView.m
//  GaoKaoHelper
//
//  Created by YANGLEILEI on 16/7/11.
//  Copyright © 2016年 YANGLEILEI. All rights reserved.
//

#import "HomeTableHeaderView.h"
#import "HomeTopScrollView.h"
#import "HomeMiddleView.h"
#import <Masonry.h>

#define WIDTH (self.frame.size.width)
#define HEIGHT (self.frame.size.height)

@interface HomeTableHeaderView ()

@property (nonatomic, strong) HomeTopScrollView *topScrollView;

@property (nonatomic ,strong) HomeMiddleView *middleButtonsView;

@end

@implementation HomeTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {

        self.frame = frame;

        self.backgroundColor = [UIColor grayColor];

        [self addSubviews];
    }
    return self;
}

- (void)addSubviews{

    [self addTopScrollView];

    [self addMiddleButtonsView];
}

- (void)addTopScrollView{

    if (self.topScrollView) {
        return;
    }
    self.topScrollView = [HomeTopScrollView new];

    [self addSubview:self.topScrollView];

    [self.topScrollView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self).with.offset(0);

        make.left.equalTo(self).with.offset(0);

        make.right.equalTo(self).with.offset(0);

        make.height.mas_equalTo(HEIGHT / 2);
    }];
}

- (void)addMiddleButtonsView{

    if (self.middleButtonsView) {
        return;
    }
    self.middleButtonsView = [HomeMiddleView new];

    [self addSubview:self.middleButtonsView];

    [self.middleButtonsView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(self).with.offset(0);

        make.right.equalTo(self).with.offset(0);

        make.top.equalTo(self.topScrollView.mas_bottom).with.offset(0);

        make.height.mas_equalTo(HEIGHT / 2);
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
