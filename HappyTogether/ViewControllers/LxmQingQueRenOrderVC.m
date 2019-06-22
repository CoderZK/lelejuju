//
//  LxmQingQueRenOrderVC.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/7.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmQingQueRenOrderVC.h"
#import "LxmQiangBaiOrderAdressCell.h"
#import "LxmSureOrderCaiCell.h"
#import "LxmSureOrderYouHuiCell.h"
#import "LxmQiangBaiShiFooterView.h"
#import "LxmHomeHeaderView.h"
#import "LxmSelectPeopleVC.h"
#import "LXmQiangBaiShiOrderDetailVC.h"
#import "RegisterViewController.h"

@interface LxmQingQueRenOrderVC ()
{
    NSMutableArray * _btnArr;
    NSString * lianXiRen;
}
@property(nonatomic,strong)UILabel *moneyLab;


@end

@implementation LxmQingQueRenOrderVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
     [self getData];
    
    lianXiRen = @"请选择联系人";
    self.navigationItem.title = @"确认订单";
    _btnArr = [NSMutableArray array];
    self.tableView.separatorColor = BGGrayColor;
    self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH-50);
    UIView * bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenH-50, ScreenW, 50)];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    UILabel * moneyLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, ScreenW-10-100, 20)];
    NSString * str1 =  [NSString stringWithFormat:@"待支付￥%0.2lf",self.model.priceTwo];
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:str1];
    [attri addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, 3)];
    [attri addAttribute:NSForegroundColorAttributeName value:CharacterDarkColor range:NSMakeRange(0, 3)];
    moneyLab.textColor = [UIColor redColor];
    moneyLab.font = [UIFont systemFontOfSize:18];
    moneyLab.attributedText = attri;
    self.moneyLab = moneyLab;
    [bottomView addSubview:moneyLab];
    
    UIButton * bottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenW-100, 0, 100, 50)];
    [bottomBtn setBackgroundImage:[UIImage imageNamed:@"btn_jiesuan"] forState:UIControlStateNormal];
    [bottomBtn setTitle:@"确认预定" forState:UIControlStateNormal];
    bottomBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [bottomBtn addTarget:self action:@selector(bottomBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:bottomBtn];
    
   
    
}

- (void)getData {
    
    NSString * sql = [NSString stringWithFormat:@"select *from kk_caipin where status = %ld",(long)self.status];
    FMDatabase * db = [FMDBSingle shareFMDB].fd;
    BOOL isOpen = [db open];
    if (isOpen) {
        FMResultSet * result = [db executeQuery:sql];
        if ([result next]) {

            _model.img = [result stringForColumn:@"img"];
            _model.caipinName = [result stringForColumn:@"caipinName"];
            _model.priceTwo =  [result doubleForColumn:@"priceTwo"];
            _model.status =  [result intForColumn:@"status"];
        }
        [self.tableView reloadData];
        
    }else {
        [SVProgressHUD showErrorWithStatus:@"数据异常请稍后再试"];
    }
    
}

-(void)bottomBtnClick
{
    
    if (self.model.lianXiRen.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请选择联系人"];
        return ;
    }
    
    UIAlertController * alertVC =[UIAlertController alertControllerWithTitle:@"提示" message:@"提交预定之后您的订单就会生成,将有专业人员联系您并确认" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {

        [self insterDianDan];
        
        

    }];
    
    [alertVC addAction:action1];
    [alertVC addAction:action2];
    [self presentViewController:alertVC animated:YES completion:nil];
    
    
}


- (void)insterDianDan {
    
    NSDateFormatter *dateStringFormatter = [[NSDateFormatter alloc] init];
    
    [dateStringFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *currentDate = [NSDate date];
    NSString * time = [dateStringFormatter stringFromDate:currentDate];
    
    NSInteger  code = arc4random() % 10000 + 10000;
    
    NSString * codeStr = [NSString stringWithFormat:@"%ld",(long)code];
    
    NSInteger  number = arc4random() % 10000000000 + 10000000000;
    
    NSString * numberStr = [NSString stringWithFormat:@"%ld",(long)number];
    
    self.model.time = time;
    self.model.code = codeStr;
    self.model.dingdanNumber = numberStr;
    
    
    
    NSString * sql = [NSString stringWithFormat:@"insert into kk_dingDan (lianXianRen,jiuDianName,caipinName,price,time,dingdanNumber,code,userId) values ('%@','%@','%@','%f','%@','%@','%@','%@')",self.model.lianXiRen,self.model.name,self.model.caipinName,self.model.priceTwo,time,numberStr,codeStr,[zkSignleTool shareTool].session_uid];
    
    FMDatabase * db = [FMDBSingle shareFMDB].fd;
    if ([db open]) {
        BOOL insert = [db executeUpdate:sql];
        if (insert) {
            [SVProgressHUD showSuccessWithStatus:@"添加成功"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                LXmQiangBaiShiOrderDetailVC * vc= [[LXmQiangBaiShiOrderDetailVC alloc] init];
                vc.type = LXmQiangBaiShiOrderDetailVC_type_qingbaishi;
                vc.model = self.model;
                [self.navigationController pushViewController:vc animated:YES];
            });
        }
    }else {
        
        [SVProgressHUD showErrorWithStatus:@"数据异常"];
        
        
    }
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2)
    {
        return 2;
    }
    return 1;
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
        cell.titleLab.text = lianXiRen;
        return cell;
    }
    else if (indexPath.section == 1)
    {
        UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell)
        {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            UIButton * leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenW-102, 8, 41, 25)];
            leftBtn.titleLabel.font = [UIFont systemFontOfSize:12];
            [leftBtn setTitle:@"1人" forState:UIControlStateNormal];
            [leftBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            [leftBtn addTarget: self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [leftBtn setTitleColor:CharacterDarkColor forState:UIControlStateNormal];
            
            [leftBtn setBackgroundImage:[UIImage imageNamed:@"btn_weidianj"] forState:UIControlStateNormal];
            [leftBtn setBackgroundImage:[UIImage imageNamed:@"btn_dianji"] forState:UIControlStateSelected];
            [cell addSubview:leftBtn];
            leftBtn.tag = 100;
            [_btnArr addObject:leftBtn];
            
            UIButton * rigthtBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenW-51, 8, 41, 25)];
            rigthtBtn.titleLabel.font = [UIFont systemFontOfSize:12];
            [rigthtBtn addTarget: self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [rigthtBtn setTitle:@"2人" forState:UIControlStateNormal];
            [rigthtBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            rigthtBtn.selected = YES;
            rigthtBtn.tag = 200;
            [rigthtBtn setTitleColor:CharacterDarkColor forState:UIControlStateNormal];
            [rigthtBtn setBackgroundImage:[UIImage imageNamed:@"btn_weidianj"] forState:UIControlStateNormal];
            [rigthtBtn setBackgroundImage:[UIImage imageNamed:@"btn_dianji"] forState:UIControlStateSelected];
            [cell addSubview:rigthtBtn];
            [_btnArr addObject:rigthtBtn];
        }
        cell.textLabel.textColor = CharacterDarkColor;
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        cell.textLabel.text = @"到店人数";
        return cell;

    }
    else
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
            cell.imgView.image = [UIImage imageNamed:@"pic_qiang"];
            cell.titleLab.text = @"抢白食";
            cell.detailelab.text = @"免单";
            return cell;
        }
        
    }

}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0||section == 1)
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
    headerView.titleLab.text = self.model.name;
    headerView.linView.hidden = YES;
    return headerView;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
//    if (section == 2)
//    {
//        LxmQiangBaiShiFooterView * footerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"LxmQiangBaiShiFooterView"];
//        if (!footerView)
//        {
//            footerView = [[LxmQiangBaiShiFooterView alloc] initWithReuseIdentifier:@"LxmQiangBaiShiFooterView"];
//        }
//        footerView.bgImageView.backgroundColor = [UIColor whiteColor];
//        return footerView;
//    }
    return nil;
    
}

-(void)btnClick:(UIButton *)btn
{
    for (UIButton * btnn in _btnArr)
    {
        btnn.selected = btnn == btn;
       
    }
//    NSString * str1 =  [NSString stringWithFormat:@"待支付￥%0.2ld",btn.tag];
//    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:str1];
//    [attri addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, 3)];
//    [attri addAttribute:NSForegroundColorAttributeName value:CharacterDarkColor range:NSMakeRange(0, 3)];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 70;
    }
    else if (indexPath.section == 1)
    {
        return 40;
    }
    else
    {
        if (indexPath.row == 0)
        {
            return 80;
        }
        return 40;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 2)
    {
        return 40;
    }
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 2)
    {
        return 40+5;
    }
    return 5;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0)
    {
        if (![zkSignleTool shareTool].isLogin) {
            RegisterViewController * vc =[[RegisterViewController alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self presentViewController:vc  animated:YES completion:nil];
            return;
        }
        LxmSelectPeopleVC * vc = [[LxmSelectPeopleVC alloc] init];
        vc.type = LxmSelectPeopleVC_Type_qingbaishi;
        __weak typeof(self) weakSelf = self;
        vc.sendLianXiRenBlock = ^(NSString *str) {
            [weakSelf.tableView reloadData];
            weakSelf.model.lianXiRen = str;
            lianXiRen = str;
        };
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
