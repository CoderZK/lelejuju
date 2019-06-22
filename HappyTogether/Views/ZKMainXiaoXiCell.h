//
//  ZKMainXiaoXiCell.h
//  HappyTogether
//
//  Created by kunzhang on 16/12/12.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKMainXiaoXiModel.h"


@interface ZKMainXiaoXiCell : UITableViewCell

/** model */
@property(nonatomic , strong)ZKMainXiaoXiModel *model;

/** title */
@property(nonatomic , strong)UILabel *titleLB;
/** contentLb */
@property(nonatomic , strong)UILabel *contentLB;
/** 灰色背景 */
@property(nonatomic , strong)UIView *blackView;


@end
