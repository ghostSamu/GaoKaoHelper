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
#import "HomeTableSecionHeaderView.h"
#import "HomeTableViewCell.h"

#define WIDTH (self.view.frame.size.width)

#define HEIGHT (self.view.frame.size.height)

static NSString *headerIndentfier = @"sectionHeader";

static NSString *footerIndentfier = @"sectionFooter";

static NSString *cellIndentfier = @"HomeTableViewCell";

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) HomeMiddleView *middleButtonsView;

@property (nonatomic, strong) HomeBottomTableView *bottomTableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    [self addBottomTableView];
}

#pragma mark TableView Delegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

     HomeTableSecionHeaderView *headerView = (HomeTableSecionHeaderView *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:headerIndentfier];

    if (!headerView) {

        headerView = [[HomeTableSecionHeaderView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 44)];
    }
    return headerView;
}

 //去掉UItableview headerview黏性(sticky)
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat sectionHeaderHeight = 44;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }
    else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentfier];

    if (!cell) {

        cell = [[HomeTableViewCell alloc] init];

    }

    return cell;
}

#pragma mark UI

- (void)addBottomTableView{

    if (self.bottomTableView) {
        return;
    }

    self.bottomTableView = [[HomeBottomTableView alloc] init];

    self.bottomTableView.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.bottomTableView];

    [self.bottomTableView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 40, 0));
    }];

    self.bottomTableView.delegate = self;

    self.bottomTableView.dataSource = self;

    [self.bottomTableView setSectionHeaderHeight:44];

    [self.bottomTableView setRowHeight:100];
}

//刷新UI
-(void)injected{

    [self viewDidLoad];
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


@end
