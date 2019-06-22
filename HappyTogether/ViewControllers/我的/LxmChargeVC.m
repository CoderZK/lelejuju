//
//  LxmChargeVC.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/12.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmChargeVC.h"
#import "LxmHomeHeaderView.h"

@interface LxmChargeVC ()
{
    NSInteger _payType;
    UITextField *_moneyTF;
}
@end

@implementation LxmChargeVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    [[IQKeyboardManager sharedManager] setEnable:YES];
    
    self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH-50);
    self.tableView.separatorColor = BGGrayColor;
    self.navigationItem.title = @"充值";
    
    UIView * footerView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenH-50, ScreenW, 50)];
    footerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:footerView];
    
    UIButton * bottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenW*0.5-130, 10, 260, 30)];
    [bottomBtn setBackgroundImage:[UIImage imageNamed:@"yellow"] forState:UIControlStateNormal];
    [bottomBtn addTarget:self action:@selector(bottomBtnClick) forControlEvents:UIControlEventTouchUpInside];
    bottomBtn.layer.cornerRadius = 5;
    bottomBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [bottomBtn setTitle:@"确认支付" forState:UIControlStateNormal];
    bottomBtn.clipsToBounds = YES;
    [footerView addSubview:bottomBtn];
    
    
    UIView * tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 100)];
    tableFooterView.backgroundColor = [UIColor whiteColor];
    self.tableView.tableFooterView = tableFooterView;
    
    UIView * topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 50)];
    [tableFooterView addSubview:topView];
    
    UIImageView * imgView =[[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 20, 20)];
    imgView.image = [UIImage imageNamed:@"ico_zhnghu"];
    [topView addSubview:imgView];
    
    UILabel * phoneLab = [[UILabel alloc] initWithFrame:CGRectMake(40, 5, ScreenW-40-10, 40)];
    phoneLab.textAlignment = 2;
    phoneLab.text = [zkSignleTool shareTool].session_uid;
    phoneLab.textColor = CharacterGrayColor;
    phoneLab.font = [UIFont systemFontOfSize:30];
    [topView addSubview:phoneLab];
    
    
    UIView * bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, ScreenW, 50)];
    [tableFooterView addSubview:bottomView];
    
    UIImageView * imgView1 =[[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 20, 20)];
    imgView1.image = [UIImage imageNamed:@"ico_jine"];
    [bottomView addSubview:imgView1];
    
    UITextField * moneyTf = [[UITextField alloc] initWithFrame:CGRectMake(40, 5, ScreenW-40-10, 40)];
    moneyTf.textAlignment = 2;
    moneyTf.placeholder = @"请输入充值金额";
    moneyTf.keyboardType = UIKeyboardTypeNamePhonePad;
    moneyTf.textColor = YellowColor;
    moneyTf.font = [UIFont systemFontOfSize:25];
    _moneyTF = moneyTf;
    [bottomView addSubview:moneyTf];
    

    
    
    
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_moneyTF resignFirstResponder];
}

-(void)bottomBtnClick
{
    //确认支付
    if (_moneyTF.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入充值金额"];
        return;
    }
    [SVProgressHUD show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [SVProgressHUD showSuccessWithStatus:@"出现问题,请联系客服进行人工充值"];
        return ;
    });
   
    
   
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
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
    else
    {
        cell.imageView.image = [UIImage imageNamed:@"bg_weixin"];
        cell.textLabel.text = @"微信支付";
    }

    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
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
    return headerView;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    _payType = indexPath.row;
    [self.tableView reloadData];
 
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}
@end
