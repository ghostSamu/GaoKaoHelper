//
//  CustomTabBarViewController.m
//  GaoKaoHelper
//
//  Created by YANGLEILEI on 16/7/9.
//  Copyright © 2016年 YANGLEILEI. All rights reserved.
//

#import "HomeViewController.h"
#import "MyCenterViewController.h"
#import "CustomTabBarViewController.h"

@interface CustomTabBarViewController ()

@end

@implementation CustomTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addSubVCs];


    UITabBar *tabBar = self.tabBar;

    UITabBarItem *homeItem = [tabBar.items objectAtIndex:0];

    homeItem.title = @"欢迎";

    [homeItem setImage:[UIImage imageNamed:nil]];

    UITabBarItem *myCenterItem = [tabBar.items objectAtIndex:1];

    myCenterItem.title = @"我的";

    [homeItem setImage:[UIImage imageNamed:nil]];

}

- (void)addSubVCs{

    HomeViewController *homeVC = [[HomeViewController alloc] init];

    MyCenterViewController *myCenterVC = [[MyCenterViewController alloc] init];

    self.viewControllers = @[homeVC,myCenterVC];
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
