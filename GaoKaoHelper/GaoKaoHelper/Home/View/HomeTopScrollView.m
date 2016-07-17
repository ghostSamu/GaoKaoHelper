//
//  HomeTopScrollView.m
//  GaoKaoHelper
//
//  Created by YANGLEILEI on 16/7/11.
//  Copyright © 2016年 YANGLEILEI. All rights reserved.
//

#import "HomeTopScrollView.h"
#import <Masonry.h>
#import "ColorTool.h"

#define WIDTH ([[UIScreen mainScreen] bounds].size.width)

static NSInteger imagesCount = 4;

@interface HomeTopScrollView ()<UIScrollViewDelegate>

@property (nonatomic ,assign) NSInteger pageCount;

@property (nonatomic ,strong) NSMutableArray *imageArray;

@property (nonatomic ,strong) UIView *contentView;

@property (nonatomic ,strong) NSTimer *timer;

@end

@implementation HomeTopScrollView

- (NSMutableArray *)imageArray{

    if (!_imageArray) {

        _imageArray = [NSMutableArray new];

        for (NSInteger i = 0; i < imagesCount ;i++) {

            NSString *imageName = [NSString stringWithFormat:@"0%ld.jpg",(long)i+1];
            UIImage *image = [UIImage imageNamed:imageName];
            [_imageArray addObject:image];
        }
    }
    return _imageArray;
}

- (instancetype)init{

    if (self = [super init]) {

        self.backgroundColor = [UIColor whiteColor];

        self.contentSize = CGSizeMake(imagesCount * WIDTH, 0);

        [self setContentOffset:CGPointMake(WIDTH, 0) animated:NO];

        self.pagingEnabled = YES;

        self.showsHorizontalScrollIndicator = NO;

        self.delegate = self;

        [self addContentView];

        [self addImageViews];

        [self beginAutoChange];
    }
    return self;
}

- (void)addContentView{

    //scrollview 添加一个 contentview
    self.contentView = [UIView new];

    [self addSubview:self.contentView];

    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.edges.equalTo(self);

        make.height.equalTo(self);
    }];
}

- (void)addImageViews{

    //图片添加顺序 4 1 2 3 4 1
    //首先添加最后一张图片，也就是4
    UIImageView *lastImageView = [self addImageViewWithIndex:imagesCount - 1 withLastView:nil];
    //然后按顺序添加1 2 3 4图片
    for (NSInteger i = 0; i < imagesCount; i++) {

        lastImageView = [self addImageViewWithIndex:i withLastView:lastImageView];
    }
    //最后添加了的一张图片是1
    lastImageView = [self addImageViewWithIndex:0 withLastView:lastImageView];

    //让contentview 的右边约束等于最后一张图片的右边
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.right.equalTo(lastImageView.mas_right);
    }];
}

- (UIImageView *)addImageViewWithIndex:(NSInteger)index withLastView:(UIView *)lastImageView{

    UIImageView *imageView = [UIImageView new];

    [imageView setImage:[self.imageArray objectAtIndex:index]];

    //imageView.backgroundColor = [ColorTool randomColor];

    [self.contentView addSubview:imageView];

    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {

        //让当前图片的左边的约束等于上一张图片的右边
        make.left.equalTo(lastImageView ? lastImageView.mas_right : @0);

        make.top.equalTo(self.contentView);

        make.height.equalTo(self.mas_height);

        make.width.equalTo(self.mas_width );
    }];

    return imageView;
}


- (void)moveScrollView{

    NSInteger currentIndex = self.contentOffset.x / self.frame.size.width;

    //currentindex = 1的时候，是从图1移动到图2，最后当currentindex ＝ 4的时候，是从图4移动到图1
    if (currentIndex < imagesCount +1) {

        currentIndex++;
    }

    [UIView animateWithDuration:1.0 animations:^{

        self.contentOffset = CGPointMake(currentIndex * WIDTH, 0);

    } completion:^(BOOL finished) {

        //如果是最后一张的话（即currentindex ＝ 4），当前图片是图1，然后要移动到currentindex为1的位置，即显示图1。由于转换前和转换后都是图1，所以即使移动scrollview也不会有感觉，
        if (currentIndex == imagesCount + 1) {
            //回到第二张图的位置也就是图片1
            [self setContentOffset:CGPointMake(WIDTH, 0)];
        }
    }];

//    if (currentIndex==0)
//    {
//        currentIndex = imagesCount - 1;
//    }
//    else if (currentIndex == (imagesCount+1))
//    {
//        currentIndex = 0;
//    }else{
//        currentIndex --;
//    }

}


#pragma mark UIScrollView Delegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self endAutoChange];
}


//滚动视图释放滚动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger currentIndex = scrollView.contentOffset.x/self.frame.size.width;

    //如果是第一个图4的位置，就将其重置为第二个图4的位置
    if (currentIndex==0)
    {
        currentIndex = imagesCount - 1;
        [self setContentOffset:CGPointMake(self.frame.size.width * imagesCount, 0) animated:NO];// 序号0 最后1页
    }
    else if (currentIndex == (imagesCount+1))
    {
        //如果是第二个图1的位置，就将其重置为第一个图1的位置
        currentIndex = 0;
        [self setContentOffset:CGPointMake(self.frame.size.width, 0) animated:NO]; // 最后+1,循环第1页
    }else{
        //其他位置不用做处理吧？
        currentIndex --;
    }

    [self beginAutoChange];
}


- (void)beginAutoChange{

    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(moveScrollView) userInfo:nil repeats:YES];

    //触屏不会打断图片轮播
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)endAutoChange
{
    if (self.timer != nil) {
        [self.timer invalidate];
        self.timer = nil;
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
