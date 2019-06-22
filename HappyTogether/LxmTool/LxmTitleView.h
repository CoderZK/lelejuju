//
//  LxmTitleView.h
//  HappyTogether
//
//  Created by 李晓满 on 16/11/29.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LxmTitleViewDelegate;
@interface LxmTitleView : UIView
@property (nonatomic,assign)id<LxmTitleViewDelegate>delegate;
-(void)LxmTitleViewWithTag:(NSInteger)btnTag;
-(instancetype)initWithFrame:(CGRect)frame withTitleArr:(NSArray *)titleArr isOrder:(BOOL)order;
@end

@protocol LxmTitleViewDelegate <NSObject>

-(void)LxmTitleViewView:(LxmTitleView *)view btnAtIndex:(NSInteger)index;

@end
