//
//  YPViewController.m
//  YPSegmentController
//
//  Created by MichaelHuyp on 12/05/2016.
//  Copyright (c) 2016 MichaelHuyp. All rights reserved.
//

#import "YPViewController.h"
#import "YPSegmentController.h"
#import "UIView+YPSegment.h"

#define YPColor_RGB(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1.0]
#define YPRandomColor_RGB YPColor_RGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface YPViewController ()

@property (nonatomic, weak) YPSegmentController *segmentController;


@end

@implementation YPViewController

#pragma mark - Lazy

- (YPSegmentController *)segmentController
{
    if (!_segmentController) {
        YPSegmentController *vc = [YPSegmentController new];
        [self addChildViewController:vc];
        _segmentController = vc;
    }
    return _segmentController;
}

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"2016互联网十强企业";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.segmentController.view.frame = self.view.bounds;
    [self.view addSubview:self.segmentController.view];
    
    
    [self.segmentController.segmentBar updateWithConfig:^(YPSegmentBarConfig *config) {
        config.itemTitleNormalColor = [UIColor blueColor];
        config.itemTitleSelectColor = [UIColor redColor];
    }];
    
    self.segmentController.segmentBar.enableTitleGradient = YES;
    self.segmentController.segmentBar.linkMode = YPSegmentBarLinkModeProgress;
    self.segmentController.segmentBar.scrollMode = YPSegmentBarScrollModeCenter;
    
    UIViewController *vc1 = [UIViewController new];
    vc1.title = @"腾讯";
    vc1.view.backgroundColor = YPRandomColor_RGB;
    
    UIViewController *vc2 = [UIViewController new];
    vc2.title = @"阿里巴巴";
    vc2.view.backgroundColor = YPRandomColor_RGB;
    
    UIViewController *vc3 = [UIViewController new];
    vc3.title = @"蚂蚁金服";
    vc3.view.backgroundColor = YPRandomColor_RGB;
    
    
    UIViewController *vc4 = [UIViewController new];
    vc4.title = @"百度";
    vc4.view.backgroundColor = YPRandomColor_RGB;
    
    UIViewController *vc5 = [UIViewController new];
    vc5.title = @"京东";
    vc5.view.backgroundColor = YPRandomColor_RGB;
    
    UIViewController *vc6 = [UIViewController new];
    vc6.title = @"网易";
    vc6.view.backgroundColor = YPRandomColor_RGB;
    
    UIViewController *vc7 = [UIViewController new];
    vc7.title = @"小米科技";
    vc7.view.backgroundColor = YPRandomColor_RGB;
    
    UIViewController *vc8 = [UIViewController new];
    vc8.title = @"滴滴出行";
    vc8.view.backgroundColor = YPRandomColor_RGB;
    
    UIViewController *vc9 = [UIViewController new];
    vc9.title = @"陆金所";
    vc9.view.backgroundColor = YPRandomColor_RGB;
    
    UIViewController *vc10 = [UIViewController new];
    vc10.title = @"美团-大众点评";
    vc10.view.backgroundColor = YPRandomColor_RGB;
    
    [self.segmentController setUpWithItems:@[vc1,vc2,vc3,vc4,vc5,vc6,vc7,vc8,vc9,vc10]];
    
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    
    [self.segmentController updateWithConfig:^(YPSegmentControllerConfig *config) {
        config.segmentBarTop = self.navigationController.navigationBar.bottom;
    }];
}



@end