//
//  LxmSelectJiuDianVC.m
//  HappyTogether
//
//  Created by 李晓满 on 16/11/30.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmSelectJiuDianVC.h"
#import "LxmHomeCateBtn.h"
#import "LxmHomeCateView.h"
#import "LxmSelectJiuDianCell.h"
#import "LxmOrderVC.h"

@interface LxmSelectJiuDianVC ()<UITableViewDataSource,UITableViewDelegate,LxmHomeCateViewDelegate>
{
    
    UITableView * _tableView;
    UIView * _topView;
    LxmHomeCateBtn * _areaBtn;
    LxmHomeCateBtn * _jutiNeedBtn;
    LxmHomeCateView *_areaView;
    LxmHomeCateView * _jutiNeedView;
    
    NSMutableArray * _areaArr;
    NSMutableArray * _btnArr;
    
}
@property(nonatomic,strong)NSMutableArray<YJHomeModel *> *dataArray;
@end

@implementation LxmSelectJiuDianVC
- (NSMutableArray<YJHomeModel *> *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"乐聚";
    _btnArr = [NSMutableArray array];
    
    _topView=[[UIView alloc] initWithFrame:CGRectMake(0, 44, ScreenW, 40)];
    _topView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_topView];
    
    _areaBtn=[[LxmHomeCateBtn alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    [_areaBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_areaBtn setTitle:@"新北区" forState:UIControlStateNormal];
    [_topView addSubview:_areaBtn];
    [_btnArr addObject:_areaBtn];
    
    UIView * line1=[[UIView alloc] initWithFrame:CGRectMake(100, 5, 1, 30)];
    line1.backgroundColor=BGGrayColor;
    [_topView addSubview:line1];
    
    _jutiNeedBtn=[[LxmHomeCateBtn alloc] initWithFrame:CGRectMake(101, 0, ScreenW-101, 40)];
    [_jutiNeedBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_jutiNeedBtn setTitle:_rightBtnStr forState:UIControlStateNormal];
    [_topView addSubview:_jutiNeedBtn];
    [_btnArr addObject:_jutiNeedBtn];
    
    _tableView=[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _tableView.backgroundColor = BGGrayColor;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.translatesAutoresizingMaskIntoConstraints=NO;
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.tableFooterView=[[UIView alloc] init];
    [self.view addSubview:_tableView];
    [NSLayoutConstraint layoutItem:_tableView widthFullSuperView:self.view withEdge:UIEdgeInsetsZero];
    
    _areaView=[[LxmHomeCateView alloc] initWithFrame:CGRectMake(0, 84, self.view.bounds.size.width, self.view.bounds.size.height-44-40)];
    _areaView.style = LxmHomeCateView_style_area;
    _areaView.delegate=self;
    _jutiNeedView=[[LxmHomeCateView alloc] initWithFrame:CGRectMake(0, 84, self.view.bounds.size.width, self.view.bounds.size.height)];
    _jutiNeedView.style = LxmHomeCateView_style_select;
    _jutiNeedView.delegate=self;
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-44-[_topView(40)]-0-[_tableView]-0-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(_topView,_tableView)]];

    [self getData];
    
}

- (void)getData {
    
    NSString * sql = [NSString stringWithFormat:@"select *from kk_jiuDian"];
    FMDatabase * db = [FMDBSingle shareFMDB].fd;
    BOOL isOpen = [db open];
    if (isOpen) {
        FMResultSet * result = [db executeQuery:sql];
        while ([result next]) {
            YJHomeModel * model = [[YJHomeModel alloc] init];
            model.ID = [result intForColumn:@"ID"];
            model.title = [result stringForColumn:@"name"];
            model.content = [result stringForColumn:@"content"];
            model.name =  [result stringForColumn:@"name"];
             model.address =  [result stringForColumn:@"address"];
            model.detailAddress =  [result stringForColumn:@"detailAddress"];
            [self.dataArray addObject:model];
        }
        [_tableView reloadData];
        
    }else {
        [SVProgressHUD showErrorWithStatus:@"数据异常请稍后再试"];
    }
    
    
    
}

-(void)btnClick:(UIButton *)btn
{
    for (LxmHomeCateBtn * tmpBtn in _btnArr)
    {
        if (tmpBtn!=btn)
        {
            tmpBtn.selected = NO;
        }
        else
        {
            btn.selected = !btn.selected;
        }
    }

    if (btn==_areaBtn)
    {
        [_jutiNeedView hide];
        if (_areaView.isShow)
        {
            [_areaView hide];
        }
        else
        {
            _areaView.dataArr=@[@"新北区"];
            [_areaView showInView:self.view];
        }
        
    }
    else if(btn==_jutiNeedBtn)
    {
        [_areaView hide];
        if (_jutiNeedView.isShow)
        {
            [_jutiNeedView hide];
        }
        else
        {
            _jutiNeedView.dataArr=@[@"午餐",@"晚餐"];
            [_jutiNeedView showInView:self.view];
        }
        
    }
}
-(void)LxmHomeCateView:(LxmHomeCateView *)view selectedAtIndex:(NSInteger)index
{
    if (view==_areaView)
    {
//        _currentSelectedCate=[_jiudianCateArr objectAtIndex:index];
//        [_tableView headerBeginRefreshing];
    }
    else if(view==_jutiNeedView)
    {
//        _currentSelectedDistance=(int)index+1;
//        [_tableView headerBeginRefreshing];
        
    }

}
-(void)LxmHomeCateView:(LxmHomeCateView *)view title:(NSString *)title
{
      [_jutiNeedBtn setTitle:title forState:UIControlStateNormal];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    LxmOrderVC * vc = [[LxmOrderVC alloc] init];
    vc.model = self.dataArray[indexPath.section];
    vc.navigationItem.title = @"菜单";
    [self.navigationController pushViewController:vc animated:YES];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LxmSelectJiuDianCell * cell =[tableView dequeueReusableCellWithIdentifier:@"LxmSelectJiuDianCell"];
    if (!cell)
    {
        cell=[[LxmSelectJiuDianCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmSelectJiuDianCell"];
    }
    cell.imgV.image = [UIImage imageNamed: [NSString stringWithFormat:@"%ld-%ld",(long)indexPath.row,indexPath.section]];
    cell.nameLB.text = self.dataArray[indexPath.section].name;
    cell.adressLab.text = self.dataArray[indexPath.section].address;
    cell.detailLab.text = self.dataArray[indexPath.section].detailAddress;
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 6;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

@end
