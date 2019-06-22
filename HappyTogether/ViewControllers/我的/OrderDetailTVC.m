//
//  OrderDetailTVC.m
//  HappyTogether
//
//  Created by 李炎 on 16/12/12.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "OrderDetailTVC.h"
#import "LxmHomeHeaderView.h"
#import "LxmQiangBaiOrderAdressCell.h"
#import "LxmSureOrderCaiCell.h"
#import "LxmSureOrderYouHuiCell.h"
#import "LxmQiangBaiShiFooterView.h"
#import "LXmQiangBaiShiOrderDetailVC.h"

@interface OrderDetailTVC ()
{
    NSInteger _payType;
    NSMutableArray * _btnArr;
    UIButton *_bottomBtn;
    
    NSTimer * _timer;
    int _time;
    int _back;//如果跳转其他页面，设为1
}

@end

@implementation OrderDetailTVC

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (_back == 0) {
        [_timer invalidate];
        _timer=nil;
    }
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _back = 0;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _back = 0;
    _payType = 0;
    _btnArr = [NSMutableArray array];
    self.navigationItem.title = @"订单详情";
    self.tableView.separatorColor = BGGrayColor;
    self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH-50);
    
    UIView * bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenH-50, ScreenW, 50)];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    UIButton * moneyLab = [UIButton buttonWithType:UIButtonTypeCustom];
    moneyLab.frame = CGRectMake(0, 0, ScreenW*0.3, 50);
    [moneyLab setBackgroundImage:[UIImage imageNamed:@"white"] forState:UIControlStateNormal];
    [moneyLab setTitle:@"取消订单" forState:UIControlStateNormal];
    moneyLab.titleLabel.font = [UIFont systemFontOfSize:14];
    [moneyLab addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    [moneyLab setTitleColor:CharacterGrayColor forState:UIControlStateNormal];
    [bottomView addSubview:moneyLab];
    
    _bottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenW*0.3, 0, ScreenW*0.7, 50)];
    [_bottomBtn setBackgroundImage:[UIImage imageNamed:@"btn_jiesuan"] forState:UIControlStateNormal];
    [_bottomBtn setTitle:@"去支付（还剩14分46秒）" forState:UIControlStateNormal];
    _bottomBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_bottomBtn addTarget:self action:@selector(bottomBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:_bottomBtn];
    
    //电话
    UIButton * rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"ico_dianhua"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
}

- (void)cancelClick{
    //取消订单
    [_bottomBtn setEnabled:YES];
    [self StartTimer];
}
-(void)bottomBtnClick
{
    //去支付
    _back = 1;//改变状态
    LXmQiangBaiShiOrderDetailVC * vc= [[LXmQiangBaiShiOrderDetailVC alloc] init];
    vc.type = LXmQiangBaiShiOrderDetailVC_type_chaozhizizhu;
    [self.navigationController pushViewController:vc animated:YES];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    else if (section == 1)
    {
        return 2;
    }
    else
    {
        return 2;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        LxmQiangBaiOrderAdressCell * cell =[tableView dequeueReusableCellWithIdentifier:@"LxmQiangBaiOrderAdressCell"];
        if (!cell)
        {
            cell=[[LxmQiangBaiOrderAdressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmQiangBaiOrderAdressCell"];
        }
        cell.selectionStyle = UIAccessibilityTraitNone;
        cell.accImgView.hidden = YES;
        return cell;
    }
    else if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            LxmSureOrderCaiCell * cell =[tableView dequeueReusableCellWithIdentifier:@"LxmSureOrderCaiCell"];
            if (!cell)
            {
                cell=[[LxmSureOrderCaiCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmSureOrderCaiCell"];
            }
            cell.selectionStyle = UIAccessibilityTraitNone;
            return cell;
        }
        else
        {
            LxmSureOrderYouHuiCell * cell =[tableView dequeueReusableCellWithIdentifier:@"LxmSureOrderYouHuiCell"];
            if (!cell)
            {
                cell=[[LxmSureOrderYouHuiCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmSureOrderYouHuiCell"];
            }
            cell.imgView.image = [UIImage imageNamed:@"bg_zhe"];
            cell.titleLab.text = @"折扣减免";
            cell.detailelab.text = @"5折";
            cell.selectionStyle = UIAccessibilityTraitNone;
            return cell;
        }
        
    }
    else
    {
        UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell)
        {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                        reuseIdentifier:@"cell"];
        }
        if (indexPath.row == 0) {
            cell.textLabel.text = @"订单号：1015 1142 9246 6254 26";
        }else{
            cell.textLabel.text = @"下单时间：2016-11-11 16：50";
        }
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        cell.textLabel.textColor = CharacterGrayColor;
        
        return cell;
        
    }
    
}
-(void)btnClick:(UIButton *)btn
{
    for (UIButton * btnn in _btnArr)
    {
        btnn.selected = btnn == btn;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return nil;
    }
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
    if (section == 1)
    {
        headerView.titleLab.text = @"金陵江南大酒店";
    }
    else
    {
        headerView.titleLab.text = @"订单信息";
    }
    headerView.linView.hidden = YES;
    return headerView;
    
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
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 70;
    }
    else if (indexPath.section == 1)
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
    if (section == 1||section == 2)
    {
        return 40;
    }
    return 0.01;
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
    if (indexPath.section == 2)
    {
        _payType = indexPath.row;
        [self.tableView reloadData];
    }
}

#pragma mark -定时器
- (void)StartTimer{
    [_timer invalidate];
    _timer=nil;
    _time=60*15;
    _timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
}
-(void)onTimer
{
    [_bottomBtn setTitle:[self getTime:_time--] forState:UIControlStateNormal];
    if (_time<0)
    {
        [_timer invalidate];
        _timer=nil;
        [_bottomBtn setEnabled:NO];
        [_bottomBtn setTitle:@"已失效" forState:UIControlStateDisabled];
    }
}
- (NSString *)getTime:(int)time{
    int minute = time/60;
    int second = time%60;
    NSString *str;
    if (minute == 0) {
        str = [NSString stringWithFormat:@"去支付(还剩%d秒)",second];
    }else{
        str = [NSString stringWithFormat:@"去支付(还剩%d分%d秒)",minute,second];
    }
    return str;
}

@end
