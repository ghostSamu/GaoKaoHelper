//
//  HomeBottomTableView.m
//  GaoKaoHelper
//
//  Created by YANGLEILEI on 16/7/10.
//  Copyright © 2016年 YANGLEILEI. All rights reserved.
//

#import "HomeTableHeaderView.h"
#import "HomeBottomTableView.h"
#import <Masonry.h>

#define WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define HEIGHT ([[UIScreen mainScreen] bounds].size.height / 3 * 2)

@implementation HomeBottomTableView

- (instancetype)init{

    if (self = [super init]) {

        [self addTableHeaderView];

        [self addTableFooterView];
    }
    return self;
}

- (void)addTableHeaderView{

    HomeTableHeaderView *headerView = [[HomeTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];

    [self setTableHeaderView:headerView];
}

- (void)addTableFooterView{

    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 20)];

    footerView.backgroundColor = [UIColor grayColor];

    [self setTableFooterView:footerView];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


@end
