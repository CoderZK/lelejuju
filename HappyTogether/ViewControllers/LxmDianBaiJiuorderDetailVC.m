//
//  LxmDianBaiJiuorderDetailVC.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/8.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmDianBaiJiuorderDetailVC.h"
#import "LxmSureOrderAddressCell.h"
#import "LxmSureOrderCaiCell.h"
#import "LxmHomeHeaderView.h"
#import "LxmQiangBaiShiFooterView.h"
#import "LxmShenQingTuiDanVC.h"

@interface LxmDianBaiJiuorderDetailVC ()

@end

@implementation LxmDianBaiJiuorderDetailVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"订单详情";
    self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH);
    
    UIView * footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 50)];
    self.tableView.tableFooterView = footView;
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenW-90, 10, 80, 30)];
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_bqxz"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitle:@"申请退单" forState:UIControlStateNormal];
    [btn setTitleColor:CharacterLightGrayColor forState:UIControlStateNormal];
    [footView addSubview:btn];
}
-(void)btnClick
{
    LxmShenQingTuiDanVC * vc = [[LxmShenQingTuiDanVC alloc] init];
    vc.type = LxmShenQingTuiDanVC_tuidan;
    [self.navigationController pushViewController:vc animated:YES];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2)
    {
        return 4;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        LxmSureOrderAddressCell * cell =[tableView dequeueReusableCellWithIdentifier:@"LxmSureOrderAddressCell"];
        if (!cell)
        {
            cell=[[LxmSureOrderAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmSureOrderAddressCell"];
        }
        cell.accImgView1.hidden = YES;
        return cell;
    }
    else if (indexPath.section == 1)
    {
        LxmSureOrderCaiCell * cell =[tableView dequeueReusableCellWithIdentifier:@"LxmSureOrderCaiCell"];
        if (!cell)
        {
            cell=[[LxmSureOrderCaiCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmSureOrderCaiCell"];
        }
        return cell;
    }
    else
    {
        UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell)
        {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.textLabel.textColor = CharacterLightGrayColor;
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"订单号:10511429246625426";
        }
        else if (indexPath.row == 1)
        {
            cell.textLabel.text = @"支付方式:在线支付";
        }
        else if (indexPath.row == 2)
        {
            cell.textLabel.text = @"下单时间:2016-11-11 16:50";
        }
        else
        {
            cell.textLabel.text = @"支付时间:2016-11-11 16:50";
        }
        return cell;

    }
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return nil;
    }
    else if (section == 1)
    {
        LxmHomeHeaderView * headerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"LxmHomeHeaderView"];
        if (!headerView)
        {
            headerView = [[LxmHomeHeaderView alloc] initWithReuseIdentifier:@"LxmHomeHeaderView"];
            
            UILabel * stateLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenW-210, 10, 200, 20)];
            stateLabel.textColor = YellowColor;
            stateLabel.text = @"配送中";
            stateLabel.textAlignment = 2;
            stateLabel.font = [UIFont systemFontOfSize:13];
            [headerView addSubview:stateLabel];
            
            UIView * linView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, ScreenW, 0.5)];
            linView.backgroundColor = BGGrayColor;
            [headerView addSubview:linView];
        }
        headerView.isImgHidden = YES;
        headerView.titleLab.text = @"来点酒";
        headerView.linView.hidden = YES;
        return headerView;

    }
    else
    {
        LxmHomeHeaderView * headerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"LxmHomeHeaderView"];
        if (!headerView)
        {
            headerView = [[LxmHomeHeaderView alloc] initWithReuseIdentifier:@"LxmHomeHeaderView"];
        }
        headerView.isImgHidden = YES;
        headerView.titleLab.text = @"订单信息";
        headerView.linView.hidden = YES;
        return headerView;

    }
    
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 1)
    {
        LxmQiangBaiShiFooterView * footerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"LxmQiangBaiShiFooterView"];
        if (!footerView)
        {
            footerView = [[LxmQiangBaiShiFooterView alloc] initWithReuseIdentifier:@"LxmQiangBaiShiFooterView"];
            UIView * lineView =[[UIView alloc] initWithFrame:CGRectMake(0, 40, ScreenW, 5)];
            lineView.backgroundColor = BGGrayColor;
            [footerView addSubview:lineView];
        }
        footerView.bgImageView.backgroundColor = [UIColor whiteColor];
        return footerView;
    }
    return nil;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 70;
    }
    else if (indexPath.section == 1)
    {
        return 80;
    }
    else
    {
        return 40;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 1)
    {
        return 40+5;
    }
    else if (section == 2)
    {
        return 0.01;
    }
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 0.01;
    }
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
