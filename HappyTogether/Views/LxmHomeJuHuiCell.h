//
//  LxmHomeJuHuiCell.h
//  HappyTogether
//
//  Created by 李晓满 on 16/11/29.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LxmHomeJuHuiCellDelegate;
@interface LxmHomeJuHuiCell : UITableViewCell
@property(nonatomic,strong)NSMutableArray * btnArr,* btnArr1, * btnArr2;

@property(nonatomic,assign)id<LxmHomeJuHuiCellDelegate>delegate;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier titleArr:(NSArray *)titleArr section:(NSInteger)section;
@end

@protocol LxmHomeJuHuiCellDelegate <NSObject>

-(void)LxmHomeJuHuiCell:(LxmHomeJuHuiCell *)cell btnAtIndex:(NSInteger)index;

@end
