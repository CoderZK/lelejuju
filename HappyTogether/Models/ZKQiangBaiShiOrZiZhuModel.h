//
//  ZKQiangBaiShiOrZiZhuModel.h
//  HappyTogether
//
//  Created by kunzhang on 16/12/1.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZKQiangBaiShiOrZiZhuModel : NSObject
//此model 是共用的为抢白是和超级自助一起是使用

/** 图片url  */
@property(nonatomic , copy)NSString *url;
/** 饭店名字 */
@property(nonatomic , copy)NSString * name;
/** 地址 */
@property(nonatomic , copy)NSString * address;
/** 几人桌 */
@property(nonatomic , copy)NSString * renshu;
/** 还剩几人 */
@property(nonatomic , copy)NSString * shengren;
/** 价格 */
@property(nonatomic , copy)NSString * money;
/** 打折的价格 */
@property(nonatomic , copy)NSString * discontM;
/** 几折 */
@property(nonatomic , copy)NSString * jizhe;

@end
