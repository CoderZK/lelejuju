//
//  LxmLeJuZhiVC.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/12.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmLeJuZhiVC.h"
#import "LxmLeJuZhiCell.h"
#import "LxmChargeVC.h"

@interface LxmLeJuZhiVC ()
@property(nonatomic,strong)NSMutableArray<YJHomeModel *> *dataArray;
@end

@implementation LxmLeJuZhiVC

- (NSMutableArray<YJHomeModel *> *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH-50);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIView * footerView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenH-50, ScreenW, 20)];
    [self.view addSubview:footerView];
    
//    if (self.type == LxmLeJuZhiVC_Type_zhi)
//    {
//
//        UIButton * rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
//        [rightBtn setTitle:@"规则" forState:UIControlStateNormal];
//        [rightBtn setTitleColor:CharacterDarkColor forState:UIControlStateNormal];
//        rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
//        rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
//        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
//
//    }
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 140+5)];
    headerView.backgroundColor = [UIColor whiteColor];
    self.tableView.tableHeaderView = headerView;
    
    UILabel * lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, ScreenW, 100)];
    if (self.type == LxmLeJuZhiVC_Type_zhi)
    {
        self.navigationItem.title = @"乐聚值";
        lab.text = @"28";
        lab.textAlignment = 1;
        lab.font = [UIFont systemFontOfSize:50];
        lab.textColor = YellowColor;
        
        UILabel * lab1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, ScreenW, 20)];
        lab1.textAlignment = 1;
        lab1.text = @"乐聚值特权将在2.0版本开放,敬请期待";
        lab1.textColor = CharacterLightGrayColor;
        lab1.font = [UIFont systemFontOfSize:14];
//        [footerView addSubview:lab1];
    }
    else
    {
        self.navigationItem.title = @"乐聚通";
        NSString * str1 = @"￥20.00";
        NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:str1];
        [attri addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, 1)];
        lab.textAlignment = 1;
        lab.font = [UIFont systemFontOfSize:50];
        lab.textColor = YellowColor;
        lab.attributedText = attri;
        
        
        UIButton * bottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenW*0.5-130, 5, 260, 30)];
        [bottomBtn setBackgroundImage:[UIImage imageNamed:@"yellow"] forState:UIControlStateNormal];
        [bottomBtn addTarget:self action:@selector(bottomBtnClick) forControlEvents:UIControlEventTouchUpInside];
        bottomBtn.layer.cornerRadius = 5;
        bottomBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [bottomBtn setTitle:@"充值" forState:UIControlStateNormal];
        bottomBtn.clipsToBounds = YES;
        [footerView addSubview:bottomBtn];
        
    }
    [headerView addSubview:lab];
    
    UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 140, ScreenW, 5)];
    lineView.backgroundColor = BGGrayColor;
    [headerView addSubview:lineView];
    [self getData];
}

//获取数据
- (void)getData {
    NSString * sql = @"";
    if (self.type == LxmLeJuZhiVC_Type_zhi) {
       sql = [NSString stringWithFormat:@"select *from kk_lejuzhi where userId = '%@'",[zkSignleTool shareTool].session_uid];
    }else {
       sql = [NSString stringWithFormat:@"select *from kk_lejutong where userId = '%@'",[zkSignleTool shareTool].session_uid];
    }
    
    
    FMDatabase * db = [FMDBSingle shareFMDB].fd;
    BOOL isOpen = [db open];
    if (isOpen) {
        FMResultSet * result = [db executeQuery:sql];
        while ([result next]) {
            YJHomeModel * model = [[YJHomeModel alloc] init];
            model.name = [result stringForColumn:@"name"];
            model.price =  [result doubleForColumn:@"name"];
            [self.dataArray addObject:model];
        }
        [self.tableView reloadData];
        
    }else {
        [SVProgressHUD showErrorWithStatus:@"数据异常请稍后再试"];
    }
    
    
    
}

-(void)bottomBtnClick
{
    //充值
    LxmChargeVC * vc = [[LxmChargeVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LxmLeJuZhiCell * cell =[tableView dequeueReusableCellWithIdentifier:@"LxmLeJuZhiCell"];
    if (!cell)
    {
        cell=[[LxmLeJuZhiCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmLeJuZhiCell"];
    }
    cell.titleLab.text = self.dataArray[indexPath.row].name;
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    BaseTableViewHeaderFooterView * headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerView"];
    if (!headerView)
    {
        headerView = [[BaseTableViewHeaderFooterView alloc] initWithReuseIdentifier:@"headerView"];
        UIImageView * iconImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 14, 16, 16)];
        iconImgView.image = [UIImage imageNamed:@"ico_xiangqing"];
        [headerView addSubview:iconImgView];
        
        UILabel * lab = [[UILabel alloc] initWithFrame:CGRectMake(35, 10, 100, 20)];
        lab.text = @"详情";
        lab.font = [UIFont systemFontOfSize:13];
        lab.textColor = CharacterDarkColor;
        [headerView addSubview:lab];
        
        UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 39.5, ScreenW, 0.5)];
        lineView.backgroundColor = BGGrayColor;
        [headerView addSubview:lineView];
        
    }
    headerView.bgImageView.backgroundColor = [UIColor whiteColor];
    return headerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}


@end
