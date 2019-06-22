//
//  YJHomeModel.h
//  SUNWENTAOAPP
//
//  Created by zk on 2018/12/8.
//  Copyright © 2018年 张坤. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YJHomeModel : NSObject
@property(nonatomic,strong)NSString *img,*title,*des,*desTwo,*content,*name,*phone,*address,*userID,*caipinName,*lianXiRen;
@property(nonatomic,assign)NSInteger ID,status;
@property(nonatomic , strong)NSString *goodId;
@property(nonatomic , strong)NSString *detailAddress;
@property(nonatomic,assign)float price,priceTwo;
@property(nonatomic,assign)NSInteger number,choiceNumber;
@property(nonatomic,assign)BOOL isSelect;
@property(nonatomic,strong)NSString *code,*time,*dingdanNumber;
@end

NS_ASSUME_NONNULL_END
