//
//  LxmSelectJiuDianCataCell.h
//  HappyTogether
//
//  Created by 李晓满 on 16/12/1.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LxmSelectJiuDianCataCellDelegate;
@interface LxmSelectJiuDianCataCell : UITableViewCell
@property(nonatomic,assign)id<LxmSelectJiuDianCataCellDelegate>delegate;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier titleArr:(NSArray *)titleArr section:(NSInteger)section;
@end

@protocol LxmSelectJiuDianCataCellDelegate <NSObject>

-(void)LxmSelectJiuDianCataCell:(LxmSelectJiuDianCataCell *)cell str1:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3;

@end
