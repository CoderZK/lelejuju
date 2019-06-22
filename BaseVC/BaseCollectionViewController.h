//
//  BaseCollectionViewController.h
//  ShareGo
//
//  Created by 李晓满 on 16/4/7.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseCollectionViewController : BaseViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong,readonly)UICollectionView * collectionView;
@property(nonatomic,strong,readonly)UICollectionViewFlowLayout * flowLayout;
-(void)endRefreshing;
@end
