//
//  LXmQiangBaiShiOrderDetailVC.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/6.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LXmQiangBaiShiOrderDetailVC.h"
#import "LxmQiangBaiOrderAdressCell.h"
#import "LxmSureOrderCaiCell.h"
#import "LxmSureOrderYouHuiCell.h"
#import "LxmHomeHeaderView.h"
#import "LxmQiangBaiShiFooterView.h"
#import "LxmShenQingTuiDanVC.h"

@interface LXmQiangBaiShiOrderDetailVC ()

@end

@implementation LXmQiangBaiShiOrderDetailVC

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
    
//    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenW-90, 10, 80, 30)];
//    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//    [btn setBackgroundImage:[UIImage imageNamed:@"btn_bqxz"] forState:UIControlStateNormal];
//    btn.titleLabel.font = [UIFont systemFontOfSize:14];
//    [btn setTitle:@"申请退单" forState:UIControlStateNormal];
//    [btn setTitleColor:CharacterLightGrayColor forState:UIControlStateNormal];
//    [footView addSubview:btn];

}
-(void)btnClick
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
        return 2;
    }
    else
    {
          if (self.type == LXmQiangBaiShiOrderDetailVC_type_chaozhizizhu)
          {
              return 2;
          }
            else
            {
                return 2;
            }
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
        if (self.type == LXmQiangBaiShiOrderDetailVC_type_chaozhizizhu)
        {
            
            if (indexPath.row == 0)
            {
                cell.textLabel.text = @"待使用";
            }
            else
            {
                cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
                cell.textLabel.text = @"验证码";
                cell.detailTextLabel.text = self.model.code;
            }

        }
        else
        {
         
            if (indexPath.row == 0)
            {
                cell.detailTextLabel.textColor = CharacterLightGrayColor;
                cell.textLabel.text = @"待激活";
                cell.detailTextLabel.text = @"还差1人即可开桌";
            }
            else
            {
                cell.textLabel.text = @"验证码";
                cell.detailTextLabel.text = self.model.code;
            }

        }
        return cell;
    }
    else if (indexPath.section == 1)
    {
        LxmQiangBaiOrderAdressCell * cell =[tableView dequeueReusableCellWithIdentifier:@"LxmQiangBaiOrderAdressCell"];
        if (!cell)
        {
            cell=[[LxmQiangBaiOrderAdressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmQiangBaiOrderAdressCell"];
        }
        cell.titleLab.text = self.model.lianXiRen;
        return cell;
    }
    else if (indexPath.section == 2)
    {
        if (indexPath.row == 0)
        {
            LxmSureOrderCaiCell * cell =[tableView dequeueReusableCellWithIdentifier:@"LxmSureOrderCaiCell"];
            if (!cell)
            {
                cell=[[LxmSureOrderCaiCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmSureOrderCaiCell"];
            }
            cell.titleLab.text = self.model.caipinName;
            cell.priceLab.text = [NSString stringWithFormat:@"￥%0.2lf",self.model.priceTwo];
            cell.totalLab.text = [NSString stringWithFormat:@"￥%0.2lf",self.model.priceTwo];
            
            cell.imgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.model.img]];
            return cell;
            
        }
        else
        {
            LxmSureOrderYouHuiCell * cell =[tableView dequeueReusableCellWithIdentifier:@"LxmSureOrderYouHuiCell"];
            if (!cell)
            {
                cell=[[LxmSureOrderYouHuiCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmSureOrderYouHuiCell"];
            }
            if (self.type == LXmQiangBaiShiOrderDetailVC_type_chaozhizizhu)
            {
                cell.imgView.image = [UIImage imageNamed:@"bg_youhui1"];
                cell.titleLab.text = @"优惠券";
                cell.detailelab.text = @"5折";
            }
            else
            {
                cell.imgView.image = [UIImage imageNamed:@"pic_qiang"];
                cell.titleLab.text = @"抢白食";
                cell.detailelab.text = @"免单";
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
        if (self.type == LXmQiangBaiShiOrderDetailVC_type_chaozhizizhu)
        {
            if (indexPath.row == 0)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"订单号: %@",self.model.dingdanNumber];
            }
            else
            {
                cell.textLabel.text = [NSString stringWithFormat:@"下单时间: %@",self.model.time];;
            }


        }
        else
        {
            if (indexPath.row == 0)
            {
                cell.textLabel.text = [NSString stringWithFormat:@"订单号: %@",self.model.dingdanNumber];
            }
            else
            {
                cell.textLabel.text = [NSString stringWithFormat:@"下单时间: %@",self.model.time];;
            }

        }
        return cell;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0||section == 1)
    {
        return nil;
    }
    if (section == 2)
    {
        if (self.type == LXmQiangBaiShiOrderDetailVC_type_chaozhizizhu)
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
            headerView.titleLab.font = [UIFont systemFontOfSize:14];
            headerView.titleLab.text = self.model.name;
            headerView.linView.hidden = YES;
            return headerView;
            
        }
        
        else
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
            headerView.titleLab.font = [UIFont systemFontOfSize:14];
            headerView.titleLab.text = self.model.name;
            headerView.linView.hidden = YES;
            return headerView;
            
        }

    }
    else
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
        headerView.titleLab.font = [UIFont systemFontOfSize:14];
        headerView.titleLab.text = @"订单信息";
        headerView.linView.hidden = YES;
        return headerView;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 2)
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
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 40;
    }
    else if (indexPath.section == 1)
    {
        return 70;
    }
    else if (indexPath.section == 2)
    {
        if (indexPath.row == 0)
        {
            return 80;
        }
        else
        {
            return 40;
        }
    }
    else
    {
        return 40;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 2)
    {
        if (self.type == LXmQiangBaiShiOrderDetailVC_type_chaozhizizhu)
        {
            return 40;
        }
        else
        {
            
            return 60;
        }
       
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
    if (section == 2)
    {
        return 40+5;
    }
    else if (section == 3)
    {
        return 0.01;
    }
    return 5;
}


@end
