//
//  HomeTopView.h
//  GaoKaoHelper
//
//  Created by YANGLEILEI on 16/7/10.
//  Copyright © 2016年 YANGLEILEI. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,buttonType){

    searchType = 0,

    selectType,

    testType,

    simulatorType
};

@interface HomeMiddleView : UIView

- (void)addButtons;

@end
