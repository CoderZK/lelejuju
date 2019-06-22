//
//  LxmSelectPeopleVC.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/6.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmSelectPeopleVC.h"
#import "LxmSelectPeopleCell.h"
#import "LxmAddAdressVC.h"


@interface LxmSelectPeopleVC ()<LxmSelectPeopleCellDelegate>
{
    NSInteger _selectIndex;
}
@property(nonatomic , strong)NSMutableArray<YJHomeModel *> *dataArray;
@end

@implementation LxmSelectPeopleVC
-(NSMutableArray<YJHomeModel *> *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self getData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"选择联系人";
    self.tableView.separatorColor = BGGrayColor;
    self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH-50);
    
    UIButton * bottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, ScreenH-50, ScreenW, 50)];
    [bottomBtn addTarget:self action:@selector(bottomBtn) forControlEvents:UIControlEventTouchUpInside];
    [bottomBtn setBackgroundImage:[UIImage imageNamed:@"white"] forState:UIControlStateNormal];
    [bottomBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    [bottomBtn setImage:[UIImage imageNamed:@"ico_zengj"] forState:UIControlStateNormal];
    bottomBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [bottomBtn setTitle:@"新增联系人" forState:UIControlStateNormal];
    [bottomBtn setTitleColor:YellowColor forState:UIControlStateNormal];
    [self.view addSubview:bottomBtn];
    
}

- (void)getData {
    
    FMDatabase * db =[FMDBSingle shareFMDB].fd;
    NSString * sql = [NSString stringWithFormat:@"select * from kk_lianXiRen"];
    BOOL isOpen =[db open];
    if (isOpen) {
        FMResultSet *result =[db executeQuery:sql];
        while ([result next]) {
            YJHomeModel * model = [[YJHomeModel alloc] init];
            model.phone = [result stringForColumn:@"phone"];
            model.name = [result stringForColumn:@"name"];
            model.address = [result stringForColumn:@"address"];
            [self.dataArray addObject:model];
        }
        
    }else {
        [SVProgressHUD showErrorWithStatus:@"数据异常"];
    }
    
    [db close];
    [self.tableView reloadData];
}

-(void)bottomBtn
{
    LxmAddAdressVC * vc = [[LxmAddAdressVC alloc] init];
    if (self.type == LxmSelectPeopleVC_Type_qingbaishi)
    {
        vc.isPeiSong = NO;
    }
    else
    {
        vc.isPeiSong = YES;
    }
    
    [self.navigationController pushViewController:vc animated:YES];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LxmSelectPeopleCell * cell =[tableView dequeueReusableCellWithIdentifier:@"LxmSelectPeopleCell"];
    if (!cell)
    {
        cell=[[LxmSelectPeopleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmSelectPeopleCell"];
    }
    if (self.type == LxmSelectPeopleVC_Type_qingbaishi)
    {
        cell.isQingbaishi = YES;
    }
    else
    {
        cell.isQingbaishi = NO;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.iconBtn.selected = (_selectIndex == indexPath.section);
    cell.delegate = self;
    cell.titleLab.text =  [NSString stringWithFormat:@"%@ - %@",self.dataArray[indexPath.row].name,self.dataArray[indexPath.row].phone];
    return cell;
}
-(void)LxmSelectPeopleCell:(LxmSelectPeopleCell *)cell index:(NSInteger)index
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    _selectIndex = indexPath.section;
    [self.tableView reloadData];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.sendLianXiRenBlock != nil) {
        self.sendLianXiRenBlock([NSString stringWithFormat:@"%@ - %@",self.dataArray[indexPath.row].name,self.dataArray[indexPath.row].phone]);
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}
@end
