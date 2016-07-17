//
//  HomeTopView.m
//  GaoKaoHelper
//
//  Created by YANGLEILEI on 16/7/10.
//  Copyright © 2016年 YANGLEILEI. All rights reserved.
//

#import "HomeMiddleView.h"
#import <Masonry.h>
#import "ColorTool.h"

static NSInteger buttonsCount = 4;

@interface HomeMiddleView ()

@end

@implementation HomeMiddleView

- (instancetype)init{

    if (self = [super init]) {

        self.backgroundColor = [UIColor grayColor];

        [self addButtons];
    }
    return self;
}

- (void)addButtons{

    for (NSInteger i = 0; i < buttonsCount; i++) {

        UIButton *button = [[UIButton alloc] init];

        button.backgroundColor = [ColorTool randomColor];

        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        [self addSubview:button];

        [button mas_makeConstraints:^(MASConstraintMaker *make) {

            switch (i) {
                case 0:

                    make.top.equalTo(self).offset(0);

                    make.right.equalTo(self.mas_centerX).offset(0);

                    make.width.equalTo(self.mas_width).multipliedBy(0.5);

                    make.height.equalTo(self.mas_height).multipliedBy(0.5);

                    button.tag = searchType;

                    [button setTitle:@"高考查分" forState:UIControlStateNormal];
                    break;
                case 1:

                    make.top.equalTo(self).offset(0);

                    make.left.equalTo(self.mas_centerX).offset(0);

                    make.width.equalTo(self.mas_width).multipliedBy(0.5);

                    make.height.equalTo(self.mas_height).multipliedBy(0.5);

                    button.tag = selectType;

                    [button setTitle:@"选择学校或专业" forState:UIControlStateNormal];
                    break;
                case 2:

                    make.bottom.equalTo(self).offset(0);

                    make.right.equalTo(self.mas_centerX).offset(0);

                    make.width.equalTo(self.mas_width).multipliedBy(0.5);

                    make.height.equalTo(self.mas_height).multipliedBy(0.5);

                    button.tag = testType;

                    [button setTitle:@"性格测试" forState:UIControlStateNormal];
                    break;
                case 3:

                    make.bottom.equalTo(self).offset(0);

                    make.left.equalTo(self.mas_centerX).offset(0);

                    make.width.equalTo(self.mas_width).multipliedBy(0.5);

                    make.height.equalTo(self.mas_height).multipliedBy(0.5);

                    button.tag = simulatorType;

                    [button setTitle:@"模拟填报" forState:UIControlStateNormal];
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
