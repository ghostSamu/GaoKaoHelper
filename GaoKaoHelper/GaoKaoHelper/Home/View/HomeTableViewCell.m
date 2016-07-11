//
//  HomeTableViewCell.m
//  GaoKaoHelper
//
//  Created by YANGLEILEI on 16/7/11.
//  Copyright © 2016年 YANGLEILEI. All rights reserved.
//

#import "HomeTableViewCell.h"
#import <Masonry.h>

@implementation HomeTableViewCell

- (instancetype)init{

    if (self = [super init]) {

        //单元格线右边留空
        [self setSeparatorInset:UIEdgeInsetsMake(0,0,0,15)];

        [self setLayoutMargins:UIEdgeInsetsMake(0,0,0,15)];
        //添加元素
        [self addSubviews];
    }
    return self;

}

- (void)addSubviews{

    //图片
    UIImageView *newsImageView = [UIImageView new];

    newsImageView.backgroundColor = [UIColor grayColor];

    [self addSubview:newsImageView];

    [newsImageView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.centerY.equalTo(self.mas_centerY);

        make.left.equalTo(self).with.offset(10);

        make.size.mas_equalTo(CGSizeMake(100, 80));
    }];

    //标题
    UILabel *title = [UILabel new];

    title.backgroundColor = [UIColor yellowColor];

    [self addSubview:title];

    [title mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(newsImageView.mas_right).with.offset(10);

        make.top.equalTo(self).with.offset(10);

        make.right.equalTo(self).with.offset(-10);

        make.height.equalTo(@20);
    }];

    //内容
    UITextView *contentText = [UITextView new];

    contentText.backgroundColor = [UIColor blackColor];

    [self addSubview:contentText];

    [contentText mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(newsImageView.mas_right).with.offset(10);

        make.bottom.equalTo(self.mas_bottom).with.offset(-10);

        make.right.equalTo(self).with.offset(-10);

        make.height.equalTo(@40);
    }];
}

- (void)awakeFromNib {
    // Initialization code

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
