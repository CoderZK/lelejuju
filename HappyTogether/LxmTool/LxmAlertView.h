//
//  LxmAlertView.h
//  HappyTogether
//
//  Created by 李晓满 on 16/12/1.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LxmAlertViewDelegate;
@interface LxmAlertView : UIView
@property(nonatomic,assign)id<LxmAlertViewDelegate>delegate;
-(instancetype)initWithimage:(UIImage *)image;

-(void)show;

@end
@protocol LxmAlertViewDelegate <NSObject>

-(void)LxmAlertView:(LxmAlertView *)view btnAtIndex:(NSInteger)index;

@end
