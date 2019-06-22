//
//  BaseTableViewController.m
//  ShareGo
//
//  Created by 李晓满 on 16/4/7.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()
{
    UITableViewStyle _tableViewStyle;
}
@end
@implementation BaseTableViewController
-(instancetype)initWithTableViewStyle:(UITableViewStyle)style
{
    if (self=[super init])
    {
        _tableViewStyle = style;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initBaseTableView];
}
-(void)initBaseTableView
{
    _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 44, ScreenW, ScreenH-44-44) style:_tableViewStyle];
    _tableView.autoresizingMask  =  UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.tableFooterView = [[UIView alloc] init];
    _tableView.backgroundColor = self.view.backgroundColor;
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}


@end
