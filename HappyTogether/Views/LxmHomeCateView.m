//
//  LxmHomeCateView.m
//  HappyTogether
//
//  Created by 李晓满 on 16/11/30.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmHomeCateView.h"
#import "LxmHomeHeaderView.h"
#import "LxmSelectJiuDianCataCell.h"

@interface LxmHomeCateView ()<UITableViewDataSource,UITableViewDelegate,LxmSelectJiuDianCataCellDelegate>
{
    UITableView * _tableView;
    LxmHomeCateView_style _stylee;
    UIButton * _btn;
    NSString * _str;
}
@end
@implementation LxmHomeCateView

-(void)setStyle:(LxmHomeCateView_style)style
{
    _stylee = style;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame])
    {
        self.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.3];
        _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        [self addSubview:_tableView];
       
    }
    return self;
}
-(void)hide
{
    _isShow=NO;
    [self removeFromSuperview];
}
-(void)showInView:(UIView *)view
{
    _isShow=YES;
    [view addSubview:self];
}
-(void)setDataArr:(NSArray *)dataArr
{
    if (_stylee == LxmHomeCateView_style_area)
    {
        _dataArr=dataArr;
        if (_dataArr.count*44<self.frame.size.height)
        {
            _tableView.frame=CGRectMake(0, 0, self.frame.size.width, _dataArr.count*44);
        }
        else
        {
            _tableView.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        }
        [_tableView reloadData];
    }
    else
    {
        _tableView.frame=CGRectMake(0, 0, self.frame.size.width, 420);
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_stylee == LxmHomeCateView_style_area)
    {
        return 1;
    }
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_stylee == LxmHomeCateView_style_area)
    {
        return _dataArr.count;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_stylee == LxmHomeCateView_style_area)
    {
        UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell)
        {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.textLabel.font=[UIFont systemFontOfSize:14];
        cell.textLabel.textColor=[UIColor grayColor];
        id data = [_dataArr objectAtIndex:indexPath.row];
        if ([data isKindOfClass:[NSString class]])
        {
            cell.textLabel.text=data;
        }
        return cell;
    }
    else
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
        LxmSelectJiuDianCataCell * cell =[tableView dequeueReusableCellWithIdentifier:@"LxmSelectJiuDianCataCell"];
        if (!cell)
        {
            cell=[[LxmSelectJiuDianCataCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmSelectJiuDianCataCell" titleArr:arr section:indexPath.section];
        }
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}
-(void)LxmSelectJiuDianCataCell:(LxmSelectJiuDianCataCell *)cell str1:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3
{
    if (str1||str2||str3)
    {
         [_btn setEnabled:YES];
        _str = [NSString stringWithFormat:@"%@人 %@ %@",str1,str2,str3];
    }
    
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (_stylee == LxmHomeCateView_style_select)
    {
        BaseTableViewHeaderFooterView * footerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"BaseTableViewHeaderFooterView"];
        if (!footerView)
        {
            footerView = [[BaseTableViewHeaderFooterView alloc] initWithReuseIdentifier:@"BaseTableViewHeaderFooterView"];
            UIView * linView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 0.5)];
            linView.backgroundColor = BGGrayColor;
            [footerView addSubview:linView];
            
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenW-90, 10, 80, 30)];
            _btn = btn;
            [btn setEnabled:NO];
            [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
            [btn setBackgroundImage:[UIImage imageNamed:@"yellow"] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:13];
            btn.layer.cornerRadius = 3;
            btn.layer.masksToBounds = YES;
            [btn setTitle:@"确认" forState:UIControlStateNormal];
            [footerView addSubview:btn];
            
        }
        return footerView;
    }
    return nil;
}
-(void)btnClick
{
    if ([self.delegate respondsToSelector:@selector(LxmHomeCateView:title:)])
    {
        [self.delegate LxmHomeCateView:self title:_str];
    }
    [self hide];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (_stylee == LxmHomeCateView_style_area)
    {
        LxmHomeHeaderView * headerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"LxmHomeHeaderView"];
        if (!headerView)
        {
            headerView = [[LxmHomeHeaderView alloc] initWithReuseIdentifier:@"LxmHomeHeaderView"];
        }
        headerView.isImgHidden = YES;
        return headerView;
    }
    LxmHomeHeaderView * headerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"LxmHomeHeaderView"];
    if (!headerView)
    {
        headerView = [[LxmHomeHeaderView alloc] initWithReuseIdentifier:@"LxmHomeHeaderView"];
    }
    headerView.isImgHidden = YES;
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
    if (_stylee == LxmHomeCateView_style_area)
    {
        return 44;
    }
    else
    {
        if (indexPath.section == 2)
        {
            return 50;
        }
        return 100;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (_stylee == LxmHomeCateView_style_area)
    {
        return 0.5;
    }
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (_stylee == LxmHomeCateView_style_area)
    {
        return 0.01;
    }
    if (section == 2)
    {
        return 50;
    }
    return 0.01;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self hide];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.delegate respondsToSelector:@selector(LxmHomeCateView:selectedAtIndex:)])
    {
        [self.delegate LxmHomeCateView:self selectedAtIndex:indexPath.row];
    }
    [self hide];
}


@end
