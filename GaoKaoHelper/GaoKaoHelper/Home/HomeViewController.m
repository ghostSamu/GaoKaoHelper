//
//  HomeViewController.m
//  GaoKaoHelper
//
//  Created by YANGLEILEI on 16/7/9.
//  Copyright © 2016年 YANGLEILEI. All rights reserved.
//

#import <Masonry.h>
#import "HomeMiddleView.h"
#import "HomeBottomTableView.h"
#import "HomeViewController.h"

#define WIDTH (self.view.frame.size.width)
#define HEIGHT (self.view.frame.size.height)

@interface HomeViewController ()

@property (nonatomic, strong) HomeMiddleView *topView;

@property (nonatomic, strong) HomeBottomTableView *bottomTableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.topView];

    UIView *one= [[UIView alloc] initWithFrame:CGRectMake(0, 300, 50, 50)];

    one.backgroundColor = [UIColor greenColor];

    [self.view addSubview:one];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark lazy-load

- (HomeMiddleView *)topView{

    if (!_topView) {

        _topView = [[HomeMiddleView alloc] init];

        [self.view addSubview:_topView];

        [_topView mas_makeConstraints:^(MASConstraintMaker *make) {

            make.left.equalTo(self.view).with.offset(0);

            make.top.equalTo(self.view).with.offset(20);

            make.size.mas_equalTo(CGSizeMake(WIDTH,HEIGHT / 3));

            [_topView setNeedsLayout];
        }];
    }
    return _topView;
}

- (HomeBottomTableView *)bottomTableView{

    if (!_bottomTableView) {

        _bottomTableView = [[HomeBottomTableView alloc] init];

        [self.view addSubview:_bottomTableView];

        [_bottomTableView mas_makeConstraints:^(MASConstraintMaker *make) {


        }];
    }
    return _bottomTableView;
}

//刷新UI
-(void)injected{
    [self viewDidLoad];
}
@end
