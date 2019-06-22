//
//  LYTuiDanTVC.m
//  HappyTogether
//
//  Created by 李炎 on 16/12/12.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LYTuiDanTVC.h"
#import "LxmSureOrderCaiCell.h"
#import "LYOrderHeaderView.h"
#import "LYOrderFooterView.h"

@interface LYTuiDanTVC ()

@end

@implementation LYTuiDanTVC
static NSString *cellID = @"TcellID";
static NSString *cellHeaderID = @"TcellHeaderID";
static NSString *cellFooterID = @"TcellfooterID";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"退单退款";
    self.tableView.separatorColor = BGGrayColor;
    self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH);
    [self.tableView registerClass:[LxmSureOrderCaiCell class] forCellReuseIdentifier:cellID];
    [self.tableView registerClass:[LYOrderHeaderView class] forHeaderFooterViewReuseIdentifier:cellHeaderID];
    [self.tableView registerClass:[LYOrderFooterView class] forHeaderFooterViewReuseIdentifier:cellFooterID];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -tableview代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LxmSureOrderCaiCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UIAccessibilityTraitNone;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    LYOrderHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellHeaderID];
    view.orderState.text = @"退单成功";
    return view;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    LYOrderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellFooterID];
    view.rightBtn.tag = 100+section;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}

@end
