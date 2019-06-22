//
//  LxmYouHuiVC.m
//  HappyTogether
//
//  Created by 李晓满 on 16/11/29.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmYouHuiVC.h"
#import "ZKQiangBaiShiVC.h"
#import "ZKLaiDianJiuVC.h"
#import "ZKFaQingJianVC.h"

@interface LxmYouHuiVC ()

@end

@implementation LxmYouHuiVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:240/225.0 green:240/225.0 blue:240/225.0 alpha:1];
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenW*440/750)];
    imageView.image = [UIImage imageNamed:@"banner"];
    self.tableView.tableHeaderView = imageView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1)
    {
        return 2;
    }
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenW-20, 18.5, 6.5, 12.5)];
        imgView.image = [UIImage imageNamed:@"lxmcelljiantou"];
        [cell addSubview:imgView];
    }
    cell.textLabel.textColor = CharacterDarkColor;
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"ico_1_%ld",indexPath.row]];
    if (indexPath.section == 0)
    {
        cell.clipsToBounds = YES;
        cell.textLabel.text = @"发请柬";
        cell.imageView.image = [UIImage imageNamed:@"ico_1_1"];
    }
    else if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"超值自助";
            cell.imageView.image = [UIImage imageNamed:@"ico_1_2"];
        }
        else
        {
            cell.textLabel.text = @"抢白食";
            cell.imageView.image = [UIImage imageNamed:@"ico_1_3"];
        }
    }
    else
    {
        cell.textLabel.text = @"来点酒";
        cell.imageView.image = [UIImage imageNamed:@"ico_1_4"];
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        //发请柬
        ZKFaQingJianVC * faQingJianVC = [[ZKFaQingJianVC alloc] init];
        [self.navigationController pushViewController:faQingJianVC animated:YES];
        
    }else if (indexPath.section == 1 ) {
        if (indexPath.row == 0) {
            //超值自助
            //点击抢白食
            ZKQiangBaiShiVC * vc =[[ZKQiangBaiShiVC alloc] init];
            vc.isQiangBaiShi = 2;
            vc.navigationItem.title = @"超值自助";
            [self.preVC.navigationController pushViewController:vc animated:YES];
        }else {

            //点击抢白食
            ZKQiangBaiShiVC * vc =[[ZKQiangBaiShiVC alloc] init];
            vc.isQiangBaiShi = 1;
            vc.navigationItem.title = @"抢白食";
            [self.preVC.navigationController pushViewController:vc animated:YES];
        }
        
        
    }else {
       //点击的来点酒
        ZKLaiDianJiuVC * vc =[[ZKLaiDianJiuVC alloc] init];
        vc.navigationItem.title = @"来点酒";
        [self.preVC.navigationController pushViewController:vc animated:YES];

    }

}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 0;
    }
    
    return 50;
}

@end
