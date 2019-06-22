//
//  BaseNavigationController.m
//
//
//  Created by lxm on 15/10/13.
//  Copyright © 2015年 cznuowang. All rights reserved.
//

#import "BaseNavigationController.h"

@implementation BaseNavigationController
-(void)viewDidLoad
{
    [super viewDidLoad];
//    //设置bar的背景颜色
//    self.navigationBar.frame = CGRectMake(0, -20, self.view.bounds.size.width, 44);
//    self.navigationBar.barTintColor=[UIColor blueColor];
    //设置bar的title颜色
    self.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor colorWithRed:56/255.0 green:56/255.0 blue:56/255.0 alpha:255/255.0]};
    //设置bar的左右按钮颜色
    self.navigationBar.tintColor = [UIColor blackColor];
    
}
@end
