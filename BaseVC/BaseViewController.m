//
//  BaseViewController.m
//  Lxm
//
//  Created by Lxm on 15/10/13.
//  Copyright © 2015年 Lxm. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end
@implementation BaseViewController

- (BOOL)shouldAutorotate
{
    return NO;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=BGGrayColor;
    
    
    UIButton * backItemBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [backItemBtn setTitle:@"" forState:UIControlStateNormal];
    [backItemBtn setBackgroundImage:[UIImage imageNamed:@"ico_fanhui"] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backItemBtn];
    backItem.title = @"";
    self.navigationItem.backBarButtonItem=backItem;
}

//是否隐藏状态栏 此方法生效的前提是plist里面的View controller-based status bar appearance 的值是NO
//哪个页面想显示  就在那个VC里面重写此方法返回NO就好了
-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
