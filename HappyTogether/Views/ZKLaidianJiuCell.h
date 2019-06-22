//
//  ZKLaidianJiuCell.h
//  HappyTogether
//
//  Created by kunzhang on 16/12/1.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKLaiDianJiuModel.h"
@interface ZKLaidianJiuCell : UICollectionViewCell

/** 模型 */
@property(nonatomic , strong)YJHomeModel *model;


/** 图片 */
@property(nonatomic , strong)UIImageView *headImgV;
/** 名字 */
@property(nonatomic , strong)UILabel *nameLB;
/** 价格 */
@property(nonatomic , strong)UILabel *piceLB;
/** 数量 */
@property(nonatomic , strong)UILabel *numberLB;
/** 加好 */
@property(nonatomic , strong)UIButton *addBT;
/**减号 */
@property(nonatomic , strong)UIButton *subBT;


@end
