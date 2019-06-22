//
//  LxmAlertView.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/1.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmAlertView.h"

@interface LxmAlertView ()
{
    UIView *_contentView;
}
@end

@implementation LxmAlertView


-(instancetype)initWithimage:(UIImage *)image
{
    
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds])
    {
        
        UIButton * bgBtn = [[UIButton alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [bgBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bgBtn];
        
        _contentView = [[UIView alloc] initWithFrame:CGRectMake((self.bounds.size.width-250)*0.5, (self.bounds.size.height-200)*0.5, 250, 220)];
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.layer.cornerRadius = 5;
        _contentView.layer.masksToBounds = YES;
        [self addSubview:_contentView];
        
        UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 230, 160)];
        imgView.image = image;
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        [_contentView addSubview:imgView];
        
        UIView * lineView =[[UIView alloc] initWithFrame:CGRectMake(0, 180, 250, 0.5)];
        lineView.backgroundColor = [CharacterLightGrayColor colorWithAlphaComponent:0.5];
        [_contentView addSubview:lineView];
        
        
        UIButton * leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 180.5, 124.75, 39.5)];
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"white"] forState:UIControlStateNormal];
        [leftBtn addTarget:self action:@selector(bottomBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        leftBtn.tag = 10;
        leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [leftBtn setTitle:@"捡优惠券" forState:UIControlStateNormal];
        [leftBtn setTitleColor:YellowColor forState:UIControlStateNormal];
        [_contentView addSubview:leftBtn];
        
        UIView * lineView1 =[[UIView alloc] initWithFrame:CGRectMake(124.75, 180.5, 0.5, 39.5)];
        lineView1.backgroundColor = [CharacterLightGrayColor colorWithAlphaComponent:0.5];
        [_contentView addSubview:lineView1];
        
        
        UIButton * rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(125.25, 180.5, 124.5, 39.5)];
        [rightBtn setBackgroundImage:[UIImage imageNamed:@"white"] forState:UIControlStateNormal];
        [rightBtn addTarget:self action:@selector(bottomBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        rightBtn.tag = 11;
        rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [rightBtn setTitle:@"去支付" forState:UIControlStateNormal];
        [rightBtn setTitleColor:CharacterDarkColor forState:UIControlStateNormal];
        [_contentView addSubview:rightBtn];
    }
    return self;
}
-(void)bottomBtnClick:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(LxmAlertView:btnAtIndex:)])
    {
        [self.delegate LxmAlertView:self btnAtIndex:btn.tag];
    }
}
-(void)btnClick
{
    [self dismiss];
    
}
-(void)show
{
    self.backgroundColor = [UIColor clearColor];
    self.alpha = 1;
    _contentView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    
    [[UIApplication sharedApplication].delegate.window addSubview:self];
    
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:20 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        _contentView.transform = CGAffineTransformIdentity;
    } completion:nil];
}
-(void)dismiss
{
    [UIView animateWithDuration:0.3 animations:^{
        
        self.alpha = 0;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
