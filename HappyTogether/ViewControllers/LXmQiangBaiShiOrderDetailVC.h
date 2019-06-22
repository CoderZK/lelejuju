//
//  LXmQiangBaiShiOrderDetailVC.h
//  HappyTogether
//
//  Created by 李晓满 on 16/12/6.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "BaseTableViewController.h"

typedef enum {
    
    LXmQiangBaiShiOrderDetailVC_type_chaozhizizhu,
    LXmQiangBaiShiOrderDetailVC_type_qingbaishi
}LXmQiangBaiShiOrderDetailVC_type;
@interface LXmQiangBaiShiOrderDetailVC : BaseTableViewController
@property(nonatomic,assign)LXmQiangBaiShiOrderDetailVC_type type;
@property(nonatomic,strong)YJHomeModel *model;
@end
