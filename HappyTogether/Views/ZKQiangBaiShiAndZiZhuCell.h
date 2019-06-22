//
//  ZKQiangBaiShiAndZiZhuCell.h
//  HappyTogether
//
//  Created by kunzhang on 16/12/1.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKQiangBaiShiOrZiZhuModel.h"
@interface ZKQiangBaiShiAndZiZhuCell : UITableViewCell

/** 模型 */
@property(nonatomic , strong)ZKQiangBaiShiOrZiZhuModel *model;

/** 记录是抢白食还是超级自助 */
@property(nonatomic , assign)NSInteger  isQiangBaiShi;


/** 图片 */
@property(nonatomic , strong)UIImageView *headImgV;
/**名字 */
@property(nonatomic , strong)UILabel *nameLB;
/**地址 */
@property(nonatomic , strong)UILabel *AddressLB;
/** 价格或者几人桌 */
@property(nonatomic , strong)UILabel *piceLB;
/** 剩余人数 */
@property(nonatomic , strong)UILabel *remainLB;
/** 立即强 */
@property(nonatomic , strong)UIButton *qiangBT;
/** 优惠价格 */
@property(nonatomic , strong)UILabel *discontLB;
/** 几折 */
@property(nonatomic , strong)UILabel *jizheLB;


















@end
