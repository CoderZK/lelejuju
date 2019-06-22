//
//  LxmOrderDetailVC.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/5.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmOrderDetailVC.h"
#import "LxmSureOrderAddressCell.h"
#import "LxmSureOrderCaiCell.h"
#import "LxmSureOrderYouHuiCell.h"
#import "LxmHomeHeaderView.h"
#import "LxmQiangBaiShiFooterView.h"
#import "LxmShenQingTuiDanVC.h"

@interface LxmOrderDetailVC ()

@end

@implementation LxmOrderDetailVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"订单详情";
    self.tableView.separatorColor = BGGrayColor;
    self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH);
    
    UIButton * rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"ico_dianhua"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    UIView * footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 50)];
    self.tableView.tableFooterView = footView;
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenW-90, 10, 80, 30)];
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_bqxz"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnCLick) forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitle:@"申请退单" forState:UIControlStateNormal];
    [btn setTitleColor:CharacterLightGrayColor forState:UIControlStateNormal];
    [footView addSubview:btn];
    
}
-(void)btnCLick
{
    LxmShenQingTuiDanVC * vc = [[LxmShenQingTuiDanVC alloc] init];
    vc.type = LxmShenQingTuiDanVC_tuidan;
    [self.navigationController pushViewController:vc animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 2;
    }
    else if (section == 1)
    {
        return 1;
    }
    else if (section == 2)
    {
        return 4;
    }
    else
    {
        return 5;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell)
        {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        }
        cell.textLabel.textColor = CharacterDarkColor;
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        
        cell.detailTextLabel.textColor = [UIColor redColor];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
        
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"待使用";
        }
        else
        {
            cell.textLabel.text = @"验证码";
            cell.detailTextLabel.text = @"0519 788990";
        }
        return cell;
    }
    else if (indexPath.section == 1)
    {
        LxmSureOrderAddressCell * cell =[tableView dequeueReusableCellWithIdentifier:@"LxmSureOrderAddressCell"];
        if (!cell)
        {
            cell=[[LxmSureOrderAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmSureOrderAddressCell"];
        }
        return cell;
    }
    else if (indexPath.section == 2)
    {
        if (indexPath.row == 0||indexPath.row == 1)
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
            LxmSureOrderYouHuiCell * cell =[tableView dequeueReusableCellWithIdentifier:@"LxmSureOrderYouHuiCell"];
            if (!cell)
            {
                cell=[[LxmSureOrderYouHuiCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmSureOrderYouHuiCell"];
            }
            if (indexPath.row == 2)
            {
                cell.imgView.image = [UIImage imageNamed:@"bg_youhui1"];
                cell.titleLab.text = @"优惠券";
            }
            else
            {
                cell.imgView.image = [UIImage imageNamed:@"bg_zhe"];
                cell.titleLab.text = @"菜品折扣";
            }
            return cell;

    }
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
            cell.textLabel.text = @"到店时间:2016-11-11 18:00";
        }
        else if (indexPath.row == 3)
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
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 1)
    {
        LxmQiangBaiShiFooterView * footerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"LxmQiangBaiShiFooterView"];
        if (!footerView)
        {
            footerView = [[LxmQiangBaiShiFooterView alloc] initWithReuseIdentifier:@"LxmQiangBaiShiFooterView"];
        }
        footerView.bgImageView.backgroundColor = [UIColor whiteColor];
        return footerView;
    }
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 2)
    {
        LxmHomeHeaderView * headerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"LxmHomeHeaderView"];
        if (!headerView)
        {
            headerView = [[LxmHomeHeaderView alloc] initWithReuseIdentifier:@"LxmHomeHeaderView"];
            
            UIView * linView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, ScreenW, 0.5)];
            linView.backgroundColor = BGGrayColor;
            [headerView addSubview:linView];
            
            UILabel * lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 40.5, ScreenW-20, 19.5)];
            lab.tag = 100;
            NSString * str1 = @"包厢号:蓬莱阁";
            NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:str1];
            [attri addAttribute:NSForegroundColorAttributeName value:CharacterDarkColor range:NSMakeRange(0,4)];
            lab.textColor = YellowColor;
            lab.attributedText = attri;
            lab.font = [UIFont systemFontOfSize:12];
            [headerView addSubview:lab];
        }
        headerView.isImgHidden = YES;
        headerView.titleLab.text = @"金陵江南大酒店";
        headerView.linView.hidden = YES;
        return headerView;
        
    }
    else if (section == 3)
    {
        LxmHomeHeaderView * headerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"LxmHomeHeaderView"];
        if (!headerView)
        {
            headerView = [[LxmHomeHeaderView alloc] initWithReuseIdentifier:@"LxmHomeHeaderView"];
            UIView * linView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, ScreenW, 0.5)];
            linView.backgroundColor = BGGrayColor;
            [headerView addSubview:linView];
        }
        headerView.isImgHidden = YES;
        headerView.titleLab.text = @"订单信息";
        headerView.linView.hidden = YES;
        return headerView;
    }
    else
    {
        return nil;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 44;
    }
    else if (indexPath.section == 1)
    {
        return 70;
    }
    else if (indexPath.section == 2)
    {
        if (indexPath.row == 0||indexPath.row == 1)
        {
            return 80;
        }
        return 44;
    }
    else
    {
         return 44;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 5;
    }
    else if (section == 2)
    {
        return 60;
    }
    else if (section == 3)
    {
        return 40;
    }
    else
    {
        return 0.01;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}
@end
