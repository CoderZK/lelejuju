//
//  LxmOrderConentVC.m
//  HappyTogether
//
//  Created by 李晓满 on 16/11/30.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmOrderConentVC.h"
#import "LxmOderContentHeaderView.h"
#import "LxmOderContentCell.h"
#import "LxmAlertView.h"
#import "LxmAlertView1.h"
#import "LxmSureOrderVC.h"

@interface LxmOrderConentVC ()<LxmAlertViewDelegate>
{
    UINavigationBar * _myNavibar;
    LxmAlertView * _view;
    UITextField * _TF;
}
@property(nonatomic,strong)NSMutableArray<YJHomeModel *> *dataArray;
@end

@implementation LxmOrderConentVC
- (NSMutableArray<YJHomeModel *> *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UINavigationBar * myNavibar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    _myNavibar = myNavibar;
    [myNavibar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    myNavibar.shadowImage = [[UIImage alloc] init];
    [self.view addSubview:myNavibar];
    
    UINavigationItem * item = [[UINavigationItem alloc] init];
    myNavibar.items = @[item];
    
    UIButton *leftBtn=[[UIButton alloc] initWithFrame:CGRectMake(0,0, 25, 25)];
    leftBtn.tag = 100;
    [leftBtn setBackgroundImage:[UIImage imageNamed: [NSString stringWithFormat:@"%@",self.model.img]] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    item.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH);
    [self configHeaderView];
    [self getData];
}

- (void)getData{
    
    NSString * sql = [NSString stringWithFormat:@"select *from kk_taocanNeiCai where caiDanId = '%ld'",(long)self.model.ID];
    FMDatabase * db = [FMDBSingle shareFMDB].fd;
    BOOL isOpen = [db open];
    if (isOpen) {
        FMResultSet * result = [db executeQuery:sql];
        while ([result next]) {
            YJHomeModel * model = [[YJHomeModel alloc] init];
            model.ID = [result intForColumn:@"ID"];
            model.status = [result intForColumn:@"status"];
            model.name = [result stringForColumn:@"name"];
            model.price = [result doubleForColumn:@"price"];
            [self.dataArray addObject:model];
        }
        [self.tableView reloadData];
        
    }else {
        [SVProgressHUD showErrorWithStatus:@"数据异常请稍后再试"];
    }
    
    
    
}

-(void)btnClick:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)configHeaderView{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenW*351/750+115)];
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenW*351/750)];
    imgV.image = [UIImage imageNamed:@"22"];
    [headerView addSubview:imgV];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenW*351/750+60, ScreenW, 5)];
    line.backgroundColor = BGGrayColor;
    [headerView addSubview:line];
    
    UILabel *priceLab = [[UILabel alloc] initWithFrame:CGRectMake(0, ScreenW*351/750, 180, 60)];
    priceLab.text =  [NSString stringWithFormat:@"￥%0.2f",self.model.price];;
    priceLab.textAlignment = 2;
    priceLab.textColor = [UIColor redColor];
    priceLab.font = [UIFont systemFontOfSize:30];
    [headerView addSubview:priceLab];
    
    UILabel *oldPriceLab = [[UILabel alloc] initWithFrame:CGRectMake(100, ScreenW*351/750+30, 60, 20)];
    oldPriceLab.text = @"￥599";
    oldPriceLab.textColor = CharacterGrayColor;
    oldPriceLab.font = [UIFont systemFontOfSize:15];
    NSString * str1 = oldPriceLab.text;
    NSUInteger length = [str1 length];
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:oldPriceLab.text];
    [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, length)];
    [attri addAttribute:NSStrikethroughColorAttributeName value:CharacterGrayColor range:NSMakeRange(0, length)];
    [oldPriceLab setAttributedText:attri];
//    [headerView addSubview:oldPriceLab];
    
    UIButton *xuanZeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    xuanZeBtn.frame = CGRectMake(ScreenW-100-20, ScreenW*351/750+10, 100, 40);
    xuanZeBtn.backgroundColor = YellowColor;
    [xuanZeBtn addTarget:self action:@selector(xuanZeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [xuanZeBtn setTitle:@"我选好了" forState:UIControlStateNormal];
    [xuanZeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    xuanZeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [headerView addSubview:xuanZeBtn];
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, ScreenW*351/750+65, ScreenW, 50)];
    titleLab.textAlignment = 1;
    titleLab.textColor = CharacterDarkColor;
    titleLab.text = self.model.caipinName;
    titleLab.font = [UIFont systemFontOfSize:17];
    [headerView addSubview:titleLab];
    
    self.tableView.tableHeaderView = headerView;
}

-(void)xuanZeBtnClick
{
    
    //1.创建UIAlertControler
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"我们将有专业的客服人员联系您!" preferredStyle:UIAlertControllerStyleAlert];

    //2.1 确认按钮
    UIAlertAction *conform = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if (_TF.text.length == 0) {
            [SVProgressHUD showErrorWithStatus:@"请输入联系方式"];
            return ;
            
        }
        
        [SVProgressHUD showSuccessWithStatus:@"您的信息已经提交,稍后我们会有专业人员和您确认订单"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController popViewControllerAnimated:YES];
        });
        
    }];
    //2.2 取消按钮
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了取消按钮");
    }];
    //2.3 还可以添加文本框 通过 alert.textFields.firstObject 获得该文本框
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请填写您的联系电话";
        _TF = textField;
    }];
    
    //3.将动作按钮 添加到控制器中
    [alert addAction:conform];
    [alert addAction:cancel];
    
    //4.显示弹框
    [self presentViewController:alert animated:YES completion:nil];
    

    
    
    
    
//    LxmAlertView * view = [[LxmAlertView alloc] initWithimage:[UIImage imageNamed:@"bg_youhuijuan"]];
//    _view = view;
//    view.delegate = self;
//    [view show];
}
-(void)LxmAlertView:(LxmAlertView *)view btnAtIndex:(NSInteger)index
{
    if (index == 10)
    {
        [_view removeFromSuperview];
        //捡优惠券
        LxmAlertView1 * view1 = [[LxmAlertView1 alloc] initWithimage:[UIImage imageNamed:@""] price:@"30"];
        [view1 show];
    }
    else
    {
        //去支付
        [_view removeFromSuperview];
        LxmSureOrderVC * vc = [[LxmSureOrderVC alloc] initWithTableViewStyle:UITableViewStyleGrouped];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LxmOderContentCell * cell =[tableView dequeueReusableCellWithIdentifier:@"LxmOderContentCell"];
    if (!cell)
    {
        cell=[[LxmOderContentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmOderContentCell"];
    }
    YJHomeModel * model = self.dataArray[indexPath.section];
    cell.titleLab.text = model.name;
    cell.priceLab.text =  [NSString stringWithFormat:@"￥%0.2f",model.price];
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    LxmOderContentHeaderView * headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"LxmOderContentHeaderView"];
    if (!headerView)
    {
        headerView = [[LxmOderContentHeaderView alloc] initWithReuseIdentifier:@"LxmOderContentHeaderView"];
    }
    YJHomeModel * model = self.dataArray[section];
    if (model.status == 1) {
        headerView.titleLab.text = @"凉菜";
    }else {
        headerView.titleLab.text = @"热菜";
    }
    return headerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

@end
