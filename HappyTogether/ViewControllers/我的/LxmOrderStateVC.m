//
//  LxmOrderStateVC.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/12.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmOrderStateVC.h"
#import "LxmSureOrderCaiCell.h"
#import "LYOrderHeaderView.h"
#import "LYOrderFooterView.h"
#import "OrderDetailTVC.h"

@interface LxmOrderStateVC ()
@property(nonatomic,strong)NSMutableArray<YJHomeModel *> *dataArray;

@end

@implementation LxmOrderStateVC
static NSString *cellID = @"cellID";
static NSString *cellHeaderID = @"cellHeaderID";
static NSString *cellFooterID = @"cellfooterID";

- (NSMutableArray<YJHomeModel *> *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH);
    self.tableView.separatorColor = BGGrayColor;
    [self.tableView registerClass:[LxmSureOrderCaiCell class] forCellReuseIdentifier:cellID];
    [self.tableView registerClass:[LYOrderHeaderView class] forHeaderFooterViewReuseIdentifier:cellHeaderID];
    [self.tableView registerClass:[LYOrderFooterView class] forHeaderFooterViewReuseIdentifier:cellFooterID];
    [self getData];
   
}

- (void)getData {
    
    NSString * sql = [NSString stringWithFormat:@"select *from kk_dingdan where status = '%d'",self.type];
    FMDatabase * db = [FMDBSingle shareFMDB].fd;
    BOOL isOpen = [db open];
    if (isOpen) {
        FMResultSet * result = [db executeQuery:sql];
        while ([result next]) {
            YJHomeModel * model = [[YJHomeModel alloc] init];
            model.ID = [result intForColumn:@"ID"];
            model.name =  [result stringForColumn:@"jiuDianName"];
            model.img =  [result stringForColumn:@"img"];
            model.price = [result doubleForColumn:@"price"];
            model.caipinName = [result stringForColumn:@"caipinName"];
            model.number = [result intForColumn:@"number"];
            [self.dataArray addObject:model];
        }
        [self.tableView reloadData];
        
    }else {
        [SVProgressHUD showErrorWithStatus:@"数据异常请稍后再试"];
    }
    
    
    
}

#pragma mark -tableview代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LxmSureOrderCaiCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
 
    cell.titleLab.text = self.dataArray[indexPath.section].caipinName;
    cell.priceLab.text = [NSString stringWithFormat:@"￥%0.2lf",self.dataArray[indexPath.section].price];
    cell.totalLab.text = [NSString stringWithFormat:@"￥%0.2lf",self.dataArray[indexPath.section].price * self.dataArray[indexPath.section].number];
    cell.countLab.text =  [NSString stringWithFormat:@"x%ld",(long)self.dataArray[indexPath.section].number];
    cell.imgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.dataArray[indexPath.section].img]];
    cell.selectionStyle = UIAccessibilityTraitNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderDetailTVC *tvc = [[OrderDetailTVC alloc] initWithTableViewStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:tvc animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    LYOrderHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellHeaderID];
    view.titleLabel.text = self.dataArray[section].name;
    return view;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    LYOrderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellFooterID];
    [view.leftBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    view.price.text = [NSString stringWithFormat:@"￥%0.2lf",self.dataArray[section].price * self.dataArray[section].number];
    view.leftBtn.hidden = YES;
    if (self.type == 1) {
        view.leftBtn.hidden = NO;
        [view.rightBtn setTitle:@"预定" forState:UIControlStateNormal];
    }else if (self.type == 2) {
        [view.rightBtn setTitle:@"激活" forState:UIControlStateNormal];
    }else if (self.type == 3) {
        [view.rightBtn setTitle:@"使用" forState:UIControlStateNormal];
    }else if (self.type == 4) {
        [view.rightBtn setTitle:@"收到货" forState:UIControlStateNormal];
    }else if (self.type == 5) {
        [view.rightBtn setTitle:@"完成" forState:UIControlStateNormal];
    }
    
    view.leftBtn.tag = 100+section;
    [view.rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    view.rightBtn.tag = 100+section;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 80;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}

//点击cell左键
- (void)leftBtnClick:(UIButton *)sender{
    NSInteger section = sender.tag - 100;
     YJHomeModel * model = self.dataArray[section];
    
    FMDatabase * db =[FMDBSingle shareFMDB].fd;
    
    if ([db open]) {
        NSString *sql = [NSString stringWithFormat:@"update kk_dingdan set status = 2 where ID = '%ld'",(long)model.ID];
        
        BOOL result1 = [db executeUpdate:sql];
        if (result1) {
            NSLog(@"create table success");
            
            [self.dataArray removeObjectAtIndex:section];
            [self.tableView reloadData];
            
        }
    }
   
   

    
    
}

//点击cell右键
- (void)rightBtnClick:(UIButton *)sender{
    NSInteger section = sender.tag - 100;
    
    UIAlertController * alertVC =[UIAlertController alertControllerWithTitle:@"提示" message:@"是否确认订单" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
      
        YJHomeModel * model = self.dataArray[section];
        
        FMDatabase * db =[FMDBSingle shareFMDB].fd;
        
        if ([db open]) {
            NSString *sql = [NSString stringWithFormat:@"update kk_dingdan set status = '%u' where ID = '%ld'",self.type,(long)model.ID];
            
            BOOL result1 = [db executeUpdate:sql];
            if (result1) {
                NSLog(@"create table success");
                
                [self.dataArray removeObjectAtIndex:section];
                [self.tableView reloadData];
                
            }
        }
        
        
    }];
    
    [alertVC addAction:action1];
    [alertVC addAction:action2];
    [self presentViewController:alertVC animated:YES completion:nil];
    

        
    
}
@end
