//
//  LxmJuHuiVC.m
//  HappyTogether
//
//  Created by 李晓满 on 16/11/29.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmJuHuiVC.h"
#import "LxmHomeHeaderView.h"
#import "LxmHomeJuHuiCell.h"
#import "LxmSelectJiuDianVC.h"

@interface LxmJuHuiVC ()<LxmHomeJuHuiCellDelegate>
{
    NSString * _stri;
    UIButton * _nextBtn;
}
@end

@implementation LxmJuHuiVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH);
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenW*440/750)];
    imageView.image = [UIImage imageNamed:@"banner"];
    self.tableView.tableHeaderView = imageView;
    
    UIView * footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 80)];
    self.tableView.tableFooterView = footerView;
    
    UIButton * nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenW*0.5-100, 20, 200, 40)];
    _nextBtn = nextBtn;
    [_nextBtn setEnabled:YES];
    [nextBtn setBackgroundImage:[UIImage imageNamed:@"yellow"] forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [footerView addSubview:nextBtn];
    [[NSUserDefaults standardUserDefaults] setObject:@1 forKey:@"isfirst"];
    
}

-(void)nextBtnClick
{
    NSString *str1,*str2,*str3;
    str1 = [[NSUserDefaults standardUserDefaults] objectForKey:@"str1"];
    str2 = [[NSUserDefaults standardUserDefaults] objectForKey:@"str2"];
    str3 = [[NSUserDefaults standardUserDefaults] objectForKey:@"str3"];
    
    if (str1.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请选择预定人数"];
        return;
    }
    if (str2.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"预计消费"];
        return;
    }
    if (str3.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"选择餐别"];
        return;
    }
    
    LxmSelectJiuDianVC * vc = [[LxmSelectJiuDianVC alloc] init];
    vc.rightBtnStr = [NSString stringWithFormat:@"%@人 %@ %@",str1,str2,str3];
    [[NSUserDefaults standardUserDefaults] setObject:@0 forKey:@"isfirst"];
    [self.preVC.navigationController pushViewController:vc animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray * arr = [NSArray array];
    if (indexPath.section == 0)
    {
        arr = @[@"6-8",@"8-10",@"10-12",@"12-14",@"14以上"];
    }
    else if (indexPath.section == 1)
    {
         arr = @[@"50-100",@"100-150",@"150-200",@"200-300",@"300以上"];
    }
    else
    {
        arr = @[@"午餐",@"晚餐"];
    }
    LxmHomeJuHuiCell * cell =[tableView dequeueReusableCellWithIdentifier:@"LxmHomeJuHuiCell"];
    if (!cell)
    {
        cell=[[LxmHomeJuHuiCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmHomeJuHuiCell" titleArr:arr section:indexPath.section];
    }
    for (UIButton * btnn in cell.btnArr)
    {
        NSString * string1 = [[NSUserDefaults standardUserDefaults] objectForKey:@"str1"];
        if ([btnn.titleLabel.text isEqualToString:string1])
        {
            btnn.selected = YES;
        }
        else
        {
             btnn.selected = NO;
        }

    }
    for (UIButton * btn1 in cell.btnArr1)
    {
        NSString * string2 = [[NSUserDefaults standardUserDefaults] objectForKey:@"str2"];
        if ([btn1.titleLabel.text isEqualToString:string2])
        {
            btn1.selected = YES;
        }
        else
        {
            btn1.selected = NO;
        }
    }
    for (UIButton * btn2 in cell.btnArr2)
    {
        NSString * string3 = [[NSUserDefaults standardUserDefaults] objectForKey:@"str3"];
        if ([btn2.titleLabel.text isEqualToString:string3])
        {
            btn2.selected = YES;
        }
        else
        {
            btn2.selected = NO;
        }
    }

    cell.delegate = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}

-(void)LxmHomeJuHuiCell:(LxmHomeJuHuiCell *)cell btnAtIndex:(NSInteger)index
{
    NSString *str1,*str2,*str3;
    
    NSIndexPath * indexPath = [self.tableView indexPathForCell:cell];
    if (indexPath.section == 0)
    {
        NSArray * arr = @[@"6-8",@"8-10",@"10-12",@"12-14",@"14以上"];
        [[NSUserDefaults standardUserDefaults] setObject:[arr objectAtIndex:index] forKey:@"str1"];
        
    }
    else if (indexPath.section == 1)
    {
        NSArray * arr = @[@"50-100",@"100-150",@"150-200",@"200-300",@"300以上"];
         [[NSUserDefaults standardUserDefaults] setObject:[arr objectAtIndex:index-10] forKey:@"str2"];
        
    }
    else
    {
        NSArray * arr = @[@"午餐",@"晚餐"];
         [[NSUserDefaults standardUserDefaults] setObject:[arr objectAtIndex:index-20] forKey:@"str3"];
    }
  
     str1 = [[NSUserDefaults standardUserDefaults] objectForKey:@"str1"];
     str2 = [[NSUserDefaults standardUserDefaults] objectForKey:@"str2"];
     str3 = [[NSUserDefaults standardUserDefaults] objectForKey:@"str3"];
    NSLog(@"%@人 %@ %@",str1,str2,str3);
    
   
    
    _stri = [NSString stringWithFormat:@"%@人 %@ %@",str1,str2,str3];
    if (_stri)
    {
        [_nextBtn setEnabled:YES];
    }
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    LxmHomeHeaderView * headerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"LxmHomeHeaderView"];
    if (!headerView)
    {
        headerView = [[LxmHomeHeaderView alloc] initWithReuseIdentifier:@"LxmHomeHeaderView"];
    }
    headerView.isImgHidden = NO;
    if (section == 0)
    {
        headerView.titleLab.text = @"预定人数";
    }
    else if (section == 1)
    {
        headerView.titleLab.text = @"预计人均消费";
    }
    else
    {
        headerView.titleLab.text = @"用餐时段";
    }
    return headerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2)
    {
        return 50;
    }
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

@end
