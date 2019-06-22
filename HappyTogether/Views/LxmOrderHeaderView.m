//
//  LxmOrderHeaderView.m
//  HappyTogether
//
//  Created by 李晓满 on 16/11/30.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmOrderHeaderView.h"

@interface LxmOrderHeaderView ()
{
    UIView * _leftView;
    UILabel * _titleLab;
    UIView * _rightView;
}
@end

@implementation LxmOrderHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame])
    {
        _leftView = [[UIView alloc] initWithFrame:CGRectMake(5, 19.75, 100, 0.5)];
        _leftView.backgroundColor = [CharacterLightGrayColor colorWithAlphaComponent:0.5];
        [self addSubview:_leftView];
        
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(110, 10, ScreenW-220, 20)];
        _titleLab.font = [UIFont systemFontOfSize:15];
        _titleLab.textColor = CharacterDarkColor;
        _titleLab.text = @"锦江国际大酒店";
        [self addSubview:_titleLab];
        
        _rightView = [[UIView alloc] initWithFrame:CGRectMake(ScreenW-5-100, 19.75, 100, 0.5)];
        _rightView.backgroundColor = [CharacterLightGrayColor colorWithAlphaComponent:0.5];
        [self addSubview:_rightView];
        
        
    }
    return self;
}
-(void)setTitleStr:(NSString *)titleStr
{
    CGFloat f = [titleStr getSizeWithMaxSize:CGSizeMake(ScreenW-120, 20) withFontSize:15].width+20;
    _titleLab.frame = CGRectMake((ScreenW-f)*0.5+10, 10, f, 20);
    _titleLab.text = titleStr;
    
    _leftView.frame = CGRectMake((ScreenW-f)*0.5-60, 19.75, 60, 0.5);
    _rightView.frame = CGRectMake((ScreenW+f)*0.5, 19.75, 60, 0.5);

    
}
@end
