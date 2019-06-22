//
//  LxmOrderVC.m
//  HappyTogether
//
//  Created by 李晓满 on 16/11/30.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmOrderVC.h"
#import "LxmOrderHeaderView.h"
#import "LxmOrderCell.h"
#import "LxmOrderConentVC.h"

@interface LxmOrderVC ()
@property(nonatomic,strong)NSMutableArray<YJHomeModel *> *dataArray;
@end

@implementation LxmOrderVC
- (NSMutableArray<YJHomeModel *> *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initCollectionView];
    
     [self getData];
   
}

- (void)getData{

    NSString * sql = [NSString stringWithFormat:@"select *from kk_taocan where jiuDianId = '%ld'",(long)self.model.ID];
    FMDatabase * db = [FMDBSingle shareFMDB].fd;
    BOOL isOpen = [db open];
    if (isOpen) {
        FMResultSet * result = [db executeQuery:sql];
        while ([result next]) {
            YJHomeModel * model = [[YJHomeModel alloc] init];
             model.ID = [result intForColumn:@"ID"];
            model.name = [result stringForColumn:@"name"];
            model.des = [result stringForColumn:@"des"];
            model.price = [result doubleForColumn:@"price"];
            model.img = [result stringForColumn:@"img"];
            [self.dataArray addObject:model];
        }
    [self.collectionView reloadData];
    
}else {
    [SVProgressHUD showErrorWithStatus:@"数据异常请稍后再试"];
}



}

-(void)initCollectionView
{
    self.flowLayout.minimumInteritemSpacing=5;
    self.flowLayout.minimumLineSpacing=5;
    self.collectionView.backgroundColor = BGGrayColor;
    CGFloat width = (self.view.bounds.size.width-15)*0.5;
    self.flowLayout.itemSize = CGSizeMake(width, width+50+10);
    self.collectionView.contentInset = UIEdgeInsetsMake(5, 0, 0, 0);
    self.collectionView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-5);
    [self.collectionView registerClass:[LxmOrderCell class] forCellWithReuseIdentifier:@"LxmOrderCell"];
    [self.collectionView registerClass:[LxmOrderHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"LxmOrderHeaderView"];
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        LxmOrderHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"LxmOrderHeaderView" forIndexPath:indexPath];
        headerView.bgImageView.backgroundColor = BGGrayColor;
        headerView.titleStr = self.model.name;
        return headerView;
    }
    return nil;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(self.view.bounds.size.width, 40);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 5, 5, 5);
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LxmOrderCell * item = [collectionView dequeueReusableCellWithReuseIdentifier:@"LxmOrderCell" forIndexPath:indexPath];
    item.backgroundColor = [UIColor whiteColor];
    YJHomeModel * model = self.dataArray[indexPath.row];
    
    item.imgV.image =[UIImage imageNamed: [NSString stringWithFormat:@"%@",model.img]];
    item.titleLab.text = model.name;
    item.priceLab.text =  [NSString stringWithFormat:@"￥%0.2f",model.price];
    item.detailLab.text = model.des;
    return item;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LxmOrderConentVC * vc = [[LxmOrderConentVC alloc] init];
    vc.model = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
