//
//  ZKLaiDianJiuVC.m
//  HappyTogether
//
//  Created by kunzhang on 16/12/1.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "ZKLaiDianJiuVC.h"
#import "ZKLaidianJiuCell.h"
#import "ZKLaiDianJiuModel.h"
#import "ZKGouWuCarBT.h"
#import "LxmlaiDianJiuSureOrderVC.h"

@interface ZKLaiDianJiuVC ()


/** 购物车按钮 */
@property(nonatomic , strong)ZKGouWuCarBT *gouWuCarBt;
/** 价格 */
@property(nonatomic , strong)UILabel *totalMoneyLB;
@property(nonatomic , assign)float totalMoney;
/** 去结算里面 价格2 */
//@property(nonatomic , strong)UILabel *moneyTwoLB;
@property(nonatomic,strong)NSMutableArray<YJHomeModel *> *dataArray;

@end

@implementation ZKLaiDianJiuVC

- (NSMutableArray<YJHomeModel *> *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setCollectionView];
    
    [self setUpGouWuCar];
    
    //假数据
    
//    for (int i = 0 ; i < 31 ; i++) {
//
//        ZKLaiDianJiuModel * model =[[ZKLaiDianJiuModel alloc] init];
//
//        model.pice =  [NSString stringWithFormat:@"%0.2f",i*20.0 + 78];
//
//        [self.dataArray addObject:model];
//
//
//    }
    
    [self getData];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)getData {
    
    NSString * sql = [NSString stringWithFormat:@"select *from kk_hongjiu"];
    FMDatabase * db = [FMDBSingle shareFMDB].fd;
    BOOL isOpen = [db open];
    if (isOpen) {
        FMResultSet * result = [db executeQuery:sql];
        while ([result next]) {
            YJHomeModel * model = [[YJHomeModel alloc] init];
            model.name =  [result stringForColumn:@"name"];
            model.img =  [result stringForColumn:@"img"];
            model.price = [result doubleForColumn:@"price"];
            [self.dataArray addObject:model];
        }
        [self.collectionView reloadData];
        
    }else {
        [SVProgressHUD showErrorWithStatus:@"数据异常请稍后再试"];
    }
    
    
    
}


//布局collectionView
- (void)setCollectionView {
    
   
    self.flowLayout.minimumLineSpacing = 5;
    self.flowLayout.minimumInteritemSpacing = 5;
    self.flowLayout.itemSize = CGSizeMake((ScreenW - 15) / 2 , (ScreenW - 15) / 2 + 70);
    self.collectionView.frame = CGRectMake(0, 0, ScreenW, ScreenH);
    
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 50, 0);
    
    [self.collectionView registerClass:[ZKLaidianJiuCell class] forCellWithReuseIdentifier:@"cell"];


}
//设置购物车
- (void)setUpGouWuCar {
    UIView * gouWuView =[[UIView alloc] initWithFrame:CGRectMake(0, ScreenH - 50, ScreenW, 50)];
    gouWuView.backgroundColor =[UIColor colorWithRed:1 green:1 blue:1 alpha:0.8];
//    gouWuView.alpha = 0.7;
//    gouWuView.backgroundColor =[UIColor whiteColor];
    
 
    [self.view addSubview:gouWuView];
    
    self.gouWuCarBt =[ZKGouWuCarBT new];
    [self.gouWuCarBt setImage:[UIImage imageNamed:@"ico_gouwuc"] forState:UIControlStateNormal];
    [self.gouWuCarBt setTitle:@"" forState:UIControlStateNormal];
    self.gouWuCarBt.titleLabel.font = [UIFont systemFontOfSize:12];
    self.gouWuCarBt.frame = CGRectMake(10, 0, 50, 50);
    
    //self.gouWuCarBt.backgroundColor =[UIColor yellowColor];
    [gouWuView addSubview:self.gouWuCarBt];
    
    UIButton * gotoJieSuanBt =[UIButton new];
    gotoJieSuanBt.frame = CGRectMake(ScreenW - 100, 0, 100, 50);
    gotoJieSuanBt.backgroundColor =[UIColor colorWithRed:243/255.0 green:101/255.0  blue:105/255.0  alpha:1];
    gotoJieSuanBt.titleLabel.font =[UIFont systemFontOfSize:14];
    [gotoJieSuanBt setTitle:@"去结算" forState:UIControlStateNormal];
    [gotoJieSuanBt addTarget:self action:@selector(quzhifu) forControlEvents:UIControlEventTouchUpInside];
    
    [gouWuView addSubview:gotoJieSuanBt];
    
    self.totalMoneyLB = [[UILabel alloc] initWithFrame:CGRectMake(70, 10, ScreenW - 70 - 110, 30)];
    self.totalMoneyLB.textColor = RedColor;
    self.totalMoneyLB.text = @"";
    self.totalMoneyLB.font =[UIFont systemFontOfSize:20 weight:0.2];
    self.totalMoneyLB.textAlignment = NSTextAlignmentRight;
    [gouWuView addSubview:self.totalMoneyLB];
    
//    self.moneyTwoLB = [[UILabel alloc] initWithFrame:CGRectMake(60, 25, ScreenW - 70 - 100, 20)];
//    self.moneyTwoLB.textColor = CharacterGrayColor;
//    self.moneyTwoLB.text = @"+￥1680 = ￥1680";
//    self.moneyTwoLB.font =[UIFont systemFontOfSize:12];
//    self.moneyTwoLB.textAlignment = NSTextAlignmentRight;
//    [gouWuView addSubview:self.moneyTwoLB];
    
    
}

//去支付
-(void)quzhifu {
    LxmlaiDianJiuSureOrderVC * vc= [[LxmlaiDianJiuSureOrderVC alloc] initWithTableViewStyle:UITableViewStyleGrouped];
    NSMutableArray * arr = @[].mutableCopy;
    for (int i = 0 ; i < self.dataArray.count; i ++ ) {
        YJHomeModel * model =self.dataArray[i];
        if (model.choiceNumber) {
            
            [arr addObject:model];
       
        }
    }
        vc.dataArray = arr;
        vc.totalMoney = self.totalMoney;
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 5, 5, 5);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    YJHomeModel * model =self.dataArray[indexPath.row];
    
    ZKLaidianJiuCell * cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor =[UIColor whiteColor];
    cell.model = model;
    //加好按钮做得事情
    [cell.addBT addTarget:self action:@selector(addAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.addBT.tag = 100 + indexPath.row;
    //减号按钮做得事情
    [cell.subBT addTarget:self action:@selector(subAcyion:) forControlEvents:UIControlEventTouchUpInside];
    cell.subBT.tag = 100 + indexPath.row;
    
    
    

    return cell;
    
}

- (void)addAction:(UIButton *)button {
    
    YJHomeModel * model = self.dataArray[button.tag - 100];

    model.choiceNumber = model.choiceNumber + 1;

    NSIndexPath * path =[NSIndexPath indexPathForRow:button.tag - 100  inSection:0];
    [self.collectionView reloadItemsAtIndexPaths:@[path]];
    
    [self jiSuanTotalMoney];

}

- (void)subAcyion:(UIButton *)button {
    
    YJHomeModel * model = self.dataArray[button.tag - 100];
    
    model.choiceNumber = model.choiceNumber - 1;
    
    NSIndexPath * path =[NSIndexPath indexPathForRow:button.tag - 100  inSection:0];
    [self.collectionView reloadItemsAtIndexPaths:@[path]];
    
    [self jiSuanTotalMoney];
    
    
}


//计算价格
- (void)jiSuanTotalMoney {
    
    CGFloat totalNumber = 0;
    CGFloat totlalMoney = 0;
    for (int i = 0 ; i < self.dataArray.count; i ++ ) {
        YJHomeModel * model =self.dataArray[i];
        if (model.choiceNumber) {
            //也可以在此处获取商品的信息都在model 内
            
            
            totalNumber = totalNumber + model.choiceNumber;
            totlalMoney = totlalMoney + model.price * model.choiceNumber;
        }
        [self.gouWuCarBt setTitle: [NSString stringWithFormat:@"%1.0f",totalNumber] forState:UIControlStateNormal];
        self.totalMoneyLB.text =  [NSString stringWithFormat:@"￥ %1.0f",totlalMoney];
        self.totalMoney = totlalMoney;
//        if (totlalMoney >= 1680) {
//            
//            self.moneyTwoLB.text =  [NSString stringWithFormat:@"+￥%@=￥%1.0d",@"0",1680];
//        }else {
//            CGFloat aa = 1680 - totlalMoney;
//            
//            self.moneyTwoLB.text =  [NSString stringWithFormat:@"+￥%1.0f=￥%1.0d",aa,1680];
//            
//            
//        }
        
        
        
        
        
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
