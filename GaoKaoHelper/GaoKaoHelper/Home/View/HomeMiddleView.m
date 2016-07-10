//
//  HomeTopView.m
//  GaoKaoHelper
//
//  Created by YANGLEILEI on 16/7/10.
//  Copyright © 2016年 YANGLEILEI. All rights reserved.
//

#import "HomeMiddleView.h"
#import <Masonry.h>

#define WIDTH (self.frame.size.width)

#define HEIGHT (self.frame.size.height)

#define BUTTONSIZE (CGSizeMake((WIDTH - 3 * padding) / 2, (HEIGHT - 3 * padding) / 2))

static NSInteger buttonsCount = 4;

@implementation HomeMiddleView

- (instancetype)init{

    if (self = [super init]) {

        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

- (void)layoutSubviews{

    [super layoutSubviews];

    [self addButtons];
}

- (void)addButtons{

    for (NSInteger i = 0; i < buttonsCount; i++) {

        UIButton *button = [[UIButton alloc] init];

        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        [self addSubview:button];

        //间隙
        CGFloat padding = 5;

        [button mas_makeConstraints:^(MASConstraintMaker *make) {

            switch (i) {
                case 0:

                    make.top.equalTo(self).offset(padding);

                    make.right.equalTo(self.mas_centerX).offset(-padding / 2);

                    make.size.mas_equalTo(BUTTONSIZE);

                    button.tag = searchType;

                    [button setTitle:@"高考查分" forState:UIControlStateNormal];

                    button.backgroundColor = [UIColor orangeColor];
                    break;
                case 1:

                    make.top.equalTo(self).offset(padding);

                    make.left.equalTo(self.mas_centerX).offset(padding / 2);

                    make.size.mas_equalTo(BUTTONSIZE);

                    button.tag = selectType;

                    [button setTitle:@"选择学校或专业" forState:UIControlStateNormal];

                    button.backgroundColor = [UIColor blueColor];
                    break;
                case 2:

                    make.bottom.equalTo(self).offset(-padding);

                    make.right.equalTo(self.mas_centerX).offset(-padding / 2);

                    make.size.mas_equalTo(BUTTONSIZE);

                    button.tag = testType;

                    [button setTitle:@"性格测试" forState:UIControlStateNormal];

                    button.backgroundColor = [UIColor redColor];
                    break;
                case 3:

                    make.bottom.equalTo(self).offset(-padding);

                    make.left.equalTo(self.mas_centerX).offset(padding / 2);

                    make.size.mas_equalTo(BUTTONSIZE);

                    button.tag = simulatorType;

                    [button setTitle:@"模拟填报" forState:UIControlStateNormal];

                    button.backgroundColor = [UIColor whiteColor];
                    break;
                default:
                    break;
            }
        }];
    }
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
