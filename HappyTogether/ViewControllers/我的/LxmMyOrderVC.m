//
//  LxmMyOrderVC.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/12.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmMyOrderVC.h"
#import "LxmTitleView.h"
#import "LxmOrderStateVC.h"
#import "LYTuiDanTVC.h"

@interface LxmMyOrderVC ()<LxmTitleViewDelegate,UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    LxmOrderStateVC * _weiPayVC;
    LxmOrderStateVC * _weiJiHuoVC;
    LxmOrderStateVC * _weiUseVC;
    LxmOrderStateVC * _peiSongVC;
    LxmOrderStateVC * _overOrderVC;
    LxmTitleView * _titleview;
}
@end

@implementation LxmMyOrderVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"我的订单";
    LxmTitleView * titleview = [[LxmTitleView alloc] initWithFrame:CGRectMake(0, 44, ScreenW, 43) withTitleArr:@[@"待付款",@"待激活",@"待使用",@"配送中",@"已完成"] isOrder:YES];
    titleview.backgroundColor = [UIColor whiteColor];
    _titleview = titleview;
    titleview.delegate = self;
    [self.view addSubview:titleview];
    
    UIButton *right = [UIButton buttonWithType:UIButtonTypeCustom];
    [right setTitleColor:CharacterDarkColor forState:UIControlStateNormal];
    CGSize size = [@"退单退款" getSizeWithMaxSize:CGSizeMake(999, 999) withFontSize:14];
    [right setTitle:@"退单退款" forState:UIControlStateNormal];
    right.titleLabel.font = [UIFont systemFontOfSize:14];
    [right addTarget:self action:@selector(rightBntClick) forControlEvents:UIControlEventTouchUpInside];
    right.frame = CGRectMake(0, 0, size.width, 40);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:right];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 44+44, self.view.bounds.size.width, ScreenH-44-44)];
    _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.contentSize = CGSizeMake(_scrollView.bounds.size.width*5.0, 0);
    [self.view addSubview:_scrollView];
    
    _weiPayVC = [[LxmOrderStateVC alloc] initWithTableViewStyle:UITableViewStyleGrouped];
    _weiPayVC.type = LxmOrderStateVC_Type_weiPay;
    _weiPayVC.view.frame = _scrollView.bounds;
    _weiPayVC.view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [_scrollView addSubview:_weiPayVC.view];
    _weiPayVC.preVC = self;
    [self addChildViewController:_weiPayVC];
    
    _weiJiHuoVC = [[LxmOrderStateVC alloc] initWithTableViewStyle:UITableViewStyleGrouped];
    _weiJiHuoVC.type = LxmOrderStateVC_Type_weiJiHuo;
    _weiJiHuoVC.view.frame = CGRectMake(_scrollView.bounds.size.width, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height);
    _weiJiHuoVC.view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [_scrollView addSubview:_weiJiHuoVC.view];
    _weiJiHuoVC.preVC = self;
    [self addChildViewController:_weiJiHuoVC];
    
    
    _weiUseVC = [[LxmOrderStateVC alloc] initWithTableViewStyle:UITableViewStyleGrouped];
    _weiUseVC.type = LxmOrderStateVC_Type_weiUse;
    _weiUseVC.view.frame = CGRectMake(_scrollView.bounds.size.width*2.0, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height);
    _weiUseVC.view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [_scrollView addSubview:_weiUseVC.view];
    _weiUseVC.preVC = self;
    [self addChildViewController:_weiUseVC];
    
    
    _peiSongVC = [[LxmOrderStateVC alloc] initWithTableViewStyle:UITableViewStyleGrouped];
    _peiSongVC.type = LxmOrderStateVC_Type_peiSong;
    _peiSongVC.view.frame = CGRectMake(_scrollView.bounds.size.width*3.0, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height);
    _peiSongVC.view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [_scrollView addSubview:_peiSongVC.view];
    _peiSongVC.preVC = self;
    [self addChildViewController:_peiSongVC];
    
    _overOrderVC = [[LxmOrderStateVC alloc] initWithTableViewStyle:UITableViewStyleGrouped];
    _overOrderVC.type = LxmOrderStateVC_Type_overOrder;
    _overOrderVC.view.frame = CGRectMake(_scrollView.bounds.size.width*4.0, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height);
    _overOrderVC.view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [_scrollView addSubview:_overOrderVC.view];
    _overOrderVC.preVC = self;
    [self addChildViewController:_overOrderVC];
    
    
}

- (void)rightBntClick{
    //跳转退单退款页面
    LYTuiDanTVC *tvc = [[LYTuiDanTVC alloc] initWithTableViewStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:tvc animated:YES];
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
