//
//  LxmHomeCateView.h
//  HappyTogether
//
//  Created by 李晓满 on 16/11/30.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LxmHomeCateView_style) {
    LxmHomeCateView_style_area,
    LxmHomeCateView_style_select
};

@protocol LxmHomeCateViewDelegate;
@interface LxmHomeCateView : UIView
@property(nonatomic,strong)NSArray * dataArr;
@property(nonatomic,assign)BOOL isShow;
@property(nonatomic,assign)LxmHomeCateView_style style;
@property(nonatomic,unsafe_unretained)id<LxmHomeCateViewDelegate>delegate;
-(void)showInView:(UIView *)view;
-(void)hide;
@end
@protocol LxmHomeCateViewDelegate <NSObject>

-(void)LxmHomeCateView:(LxmHomeCateView *)view selectedAtIndex:(NSInteger)index;

-(void)LxmHomeCateView:(LxmHomeCateView *)view title:(NSString *)title;

@end
