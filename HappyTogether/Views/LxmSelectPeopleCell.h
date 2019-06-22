//
//  LxmSelectPeopleCell.h
//  HappyTogether
//
//  Created by 李晓满 on 16/12/7.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LxmSelectPeopleCellDelegate;
@interface LxmSelectPeopleCell : UITableViewCell
@property(nonatomic,strong)UIButton * iconBtn;
@property(nonatomic,assign)BOOL isQingbaishi;
@property(nonatomic,strong)UILabel * titleLab;
@property(nonatomic,strong)UILabel * detailLab;
@property(nonatomic,assign)id<LxmSelectPeopleCellDelegate>delegate;
@end
@protocol LxmSelectPeopleCellDelegate <NSObject>

-(void)LxmSelectPeopleCell:(LxmSelectPeopleCell *)cell index:(NSInteger)index;

@end
