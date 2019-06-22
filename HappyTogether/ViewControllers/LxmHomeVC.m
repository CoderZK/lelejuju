//
//  LxmHomeVC.m
//  HappyTogether
//
//  Created by 李晓满 on 16/11/29.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmHomeVC.h"
#import "LxmTitleView.h"
#import "LxmJuHuiVC.h"
#import "LxmYouHuiVC.h"
#import "RegisterViewController.h"
#import "LxmMineVC.h"
#import "RegisterViewController.h"

@interface LxmHomeVC ()<UIScrollViewDelegate,LxmTitleViewDelegate>
{
    UIScrollView *_scrollView;
    LxmJuHuiVC * _juHuiVC;
    LxmYouHuiVC * _youHuiVC;
    LxmTitleView * _titleview;
}
@end

@implementation LxmHomeVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    LxmTitleView * titleview = [[LxmTitleView alloc] initWithFrame:CGRectMake(15, 0, 100, 43) withTitleArr:@[@"聚会",@"聚惠"] isOrder:NO];
    _titleview = titleview;
    titleview.delegate = self;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:titleview];

    UIButton * headerBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenW-50, 5, 34, 34)];
    [headerBtn setBackgroundImage:[UIImage imageNamed:@"pic_2"] forState:UIControlStateNormal];
    headerBtn.layer.cornerRadius = 15;
    headerBtn.layer.masksToBounds = YES;
    [headerBtn addTarget:self action:@selector(jumpToUserInfo) forControlEvents:UIControlEventTouchUpInside];
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:headerBtn];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, -44-44, self.view.bounds.size.width, ScreenH+44+44)];
    _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.contentSize = CGSizeMake(_scrollView.bounds.size.width*2.0, 0);
    [self.view addSubview:_scrollView];
    
    _juHuiVC = [[LxmJuHuiVC alloc] initWithTableViewStyle:UITableViewStylePlain];
    _juHuiVC.view.frame = _scrollView.bounds;
    _juHuiVC.view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [_scrollView addSubview:_juHuiVC.view];
    _juHuiVC.preVC = self;
    [self addChildViewController:_juHuiVC];
    
    _youHuiVC = [[LxmYouHuiVC alloc] initWithTableViewStyle:UITableViewStylePlain];
    _youHuiVC.view.frame = CGRectMake(_scrollView.bounds.size.width, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height);
    _youHuiVC.view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [_scrollView addSubview:_youHuiVC.view];
    _youHuiVC.preVC = self;
    [self addChildViewController:_youHuiVC];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
  
}
- (void)jumpToUserInfo{
    
    //判断是否登录，如果没有登录跳转登录页面
    
    if (![zkSignleTool shareTool].isLogin) {
        RegisterViewController * vc =[[RegisterViewController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self presentViewController:vc  animated:YES completion:nil];
        return;
    }
    
    LxmMineVC * vc = [[LxmMineVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
//    RegisterViewController *vc = [[RegisterViewController alloc] init];
//    vc.isLogin = YES;
//    BaseNavigationController *naVC = [[BaseNavigationController alloc] initWithRootViewController:vc];
//    [self.navigationController presentViewController:naVC animated:YES completion:nil];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == _scrollView)
    {
        NSInteger toN=scrollView.contentOffset.x/self.view.bounds.size.width;
        [_titleview LxmTitleViewWithTag:toN];
    }
}
-(void)LxmTitleViewView:(LxmTitleView *)view btnAtIndex:(NSInteger)index
{
    [_scrollView setContentOffset:CGPointMake(index*self.view.bounds.size.width, _scrollView.contentOffset.y) animated:YES];
}
@end
