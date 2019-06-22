//
//  LxmSureOrderVC.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/2.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmSureOrderVC.h"
#import "LxmHomeHeaderView.h"
#import "LxmSureOrderAddressCell.h"
#import "LxmSureOrderCaiCell.h"
#import "LxmSureOrderYouHuiCell.h"
#import "LxmSureOrderFooterView.h"
#import "LxmPickerView.h"


@interface LxmSureOrderVC ()<LxmPickerViewDelegate,LxmPickerViewDatasource>
{
    NSInteger _payType;
    LxmPickerView * _pickerView;
    NSString * _str1;
    NSString * _str2;
    NSInteger _leftIndex;
    NSInteger _rightIndex;
    NSMutableArray * _leftArr;
    NSMutableArray *_rightArr;
}
@end

@implementation LxmSureOrderVC

- (void)viewDidLoad
{
    [super viewDidLoad];
     _payType = 0;
    _leftIndex = 0;
    _rightIndex = 0;
    _leftArr = [NSMutableArray array];
    _rightArr = [NSMutableArray array];
    
    
    self.navigationItem.title = @"确认订单";
    self.tableView.separatorColor = BGGrayColor;
    self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH-50);
    
    UIView * bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenH-50, ScreenW, 50)];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    UILabel * moneyLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, ScreenW-10-100, 20)];
    NSString * str1 = @"待支付￥986";
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:str1];
    [attri addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, 3)];
     [attri addAttribute:NSForegroundColorAttributeName value:CharacterDarkColor range:NSMakeRange(0, 3)];
    moneyLab.textColor = [UIColor redColor];
    moneyLab.font = [UIFont systemFontOfSize:18];
    moneyLab.attributedText = attri;
    [bottomView addSubview:moneyLab];
    
    UIButton * bottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenW-100, 0, 100, 50)];
    [bottomBtn setBackgroundImage:[UIImage imageNamed:@"btn_jiesuan"] forState:UIControlStateNormal];
    [bottomBtn setTitle:@"确认支付" forState:UIControlStateNormal];
    bottomBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [bottomView addSubview:bottomBtn];
}
/**
 *  列数
 */
- (NSInteger)numberOfComponentsInPickerView:(LxmPickerView *)pickerView
{
    return 2;
}
/**
 *  某一列的行数
 */
- (NSInteger)pickerView:(LxmPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
        if (component==0)
        {
            return @[@"11",@"12",@"13",@"17",@"18",@"19",@"20",@"21"].count;
        }
        else
        {
           return @[@"15",@"30",@"45",@"00"].count;
        }
    
}
/***/

- (UIView *)pickerView:(LxmPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view
{
    UILabel *myView = nil;
    NSArray * gradeArr = @[@"11",@"12",@"13",@"17",@"18",@"19",@"20",@"21"];
    
    if (component == 0)
    {
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width*0.5+10, 30)];
        myView.textAlignment = NSTextAlignmentCenter;
        myView.text = [gradeArr objectAtIndex:row];
        myView.font = [UIFont systemFontOfSize:15];
        myView.backgroundColor = BGGrayColor;
        [_leftArr addObject:myView];
    }
    else
    {
        myView = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width*0.5-10, 0, self.view.bounds.size.width*0.5, 30)];
        myView.textAlignment = NSTextAlignmentCenter;
        myView.text = [@[@"15",@"30",@"45",@"00"] objectAtIndex:row];
        myView.font = [UIFont systemFontOfSize:15];
        myView.backgroundColor = BGGrayColor;
        [_rightArr addObject:myView];
    }
    
    return myView;
}
-(void)pickerView:(LxmPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0)
    {
        _str1 =[@[@"11",@"12",@"13",@"17",@"18",@"19",@"20",@"21"] objectAtIndex:row];
        _leftIndex = row;
    }
    else
    {
        _str2 = [@[@"15",@"30",@"45",@"00"] objectAtIndex:row];
        _rightIndex = row;
    }
    
    NSLog(@"%@:%@",_str1,_str2);
}
-(void)LxmPickerViewDelegate:(LxmPickerView *)view btnAtIndex:(NSInteger)index
{
    if (index == 112)//确定
    {
        NSLog(@"%@:%@",_str1,_str2);
        [_pickerView dismiss];
        [self.tableView reloadData];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    else if (section == 1)
    {
        return 4;
    }
    else if (section == 2)
    {
        return 2;
    }
    else
    {
        return 4;
    }
    
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
        return cell;
    }
    else if (indexPath.section == 1)
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
    else if (indexPath.section == 2)
    {
        UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if (!cell)
        {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell1"];
        }
        UIImageView * accImgView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenW-35, 28, 7, 13)];
        accImgView.image = [UIImage imageNamed:@"lxmcelljiantou"];
        cell.accessoryView = accImgView;
        cell.textLabel.textColor = CharacterDarkColor;
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        cell.detailTextLabel.textColor = CharacterLightGrayColor;
        cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"来点酒";
        }
        else
        {
            cell.textLabel.text = @"到店时间";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld:%ld",[_str1 integerValue],[_str2 integerValue]];
        }
        return cell;
    }
    else
    {
        UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell)
        {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            
            
            UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 17, 10, 10)];
            [btn setImage:[UIImage imageNamed:@"pic_1"] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"ico_xuanzhong"] forState:UIControlStateSelected];
            btn.userInteractionEnabled=NO;
            cell.accessoryView=btn;
            
        }
        UIButton * btn = (UIButton *)cell.accessoryView;
        btn.selected = (_payType==indexPath.row);
        cell.textLabel.textColor = CharacterDarkColor;
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        if (indexPath.row == 0)
        {
            cell.imageView.image = [UIImage imageNamed:@"bg_zhifub"];
            cell.textLabel.text = @"支付宝支付";
        }
        else if (indexPath.row == 1)
        {
            cell.imageView.image = [UIImage imageNamed:@"bg_weixin"];
            cell.textLabel.text = @"微信支付";
        }
        else if (indexPath.row == 2)
        {
            cell.imageView.image = [UIImage imageNamed:@"bg_leju"];
            cell.textLabel.text = @"乐聚通支付";
        }
        else
        {
            cell.imageView.image = [UIImage imageNamed:@"bg_daodian"];
            cell.textLabel.text = @"到店支付";
        }
        return cell;
    }
  
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1)
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
            lab.text = @"*包厢会通过手机短信方式发送到您的手机上并展示在订单详情";
            lab.textColor = CharacterLightGrayColor;
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
        headerView.titleLab.text = @"支付方式";
        headerView.linView.hidden = YES;
        return headerView;
    }
    else
    {
        return nil;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 1)
    {
        LxmSureOrderFooterView * footerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"LxmSureOrderFooterView"];
        if (!footerView)
        {
            footerView = [[LxmSureOrderFooterView alloc] initWithReuseIdentifier:@"LxmSureOrderFooterView"];
            
            UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 40, ScreenW, 10)];
            view.backgroundColor = BGGrayColor;
            [footerView addSubview:view];
            
        }
        footerView.priceStr =  @"订单￥1024";
        footerView.youhuiStr = @"优惠￥60";
        footerView.leftStr = @"待支付￥986";
        footerView.bgImageView.backgroundColor = [UIColor whiteColor];
        return footerView;

    }
    return nil;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 70;
    }
    else if (indexPath.section == 1)
    {
        if (indexPath.row == 0||indexPath.row == 1)
        {
            return 80;
        }
        else
        {
            return 44;
        }
    }
    else
    {
        return 44;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1)
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
    if (section == 1)
    {
        return 40+5;
    }
    return 5;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 2)
    {
        if (indexPath.row == 1)
        {
            _pickerView = [LxmPickerView pickerView];
            _pickerView.dataSource = self;
            _pickerView.backgroundColor = BGGrayColor;
            _pickerView.delegate = self;
            _str1 = @"11";
            _str2 = @"15";
            [_pickerView show];
           
        }
    }
    if (indexPath.section == 3)
    {
        _payType = indexPath.row;
        [self.tableView reloadData];
    }
}

@end
