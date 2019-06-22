//
//  ZKLaiDianJiuModel.h
//  HappyTogether
//
//  Created by kunzhang on 16/12/1.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZKLaiDianJiuModel : NSObject
/** 图片 */
@property(nonatomic , copy)NSString *imgUrl;
/** 描述 */
@property(nonatomic , copy)NSString *content;
/** 价格 */
@property(nonatomic , copy)NSString *pice;
/** 商品的ID */
@property(nonatomic , copy)NSString *ID;

//上面一部分根据接口在确定
//下面的一部分为为需求添加的

/** 是否被选中(即商品的数量大于0) */
@property(nonatomic , assign)BOOL isSelect;
/** 一种商品选中的数量 */
@property(nonatomic , assign)NSInteger choiceNumber;



@end
