//
//  LxmOderContentHeaderView.m
//  HappyTogether
//
//  Created by 李晓满 on 16/11/30.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmOderContentHeaderView.h"

@interface LxmOderContentHeaderView ()
{
    UIView * _leftView;
    UIView * _rightView;
}
@end

@implementation LxmOderContentHeaderView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier])
    {
        _leftView = [[UIView alloc] initWithFrame:CGRectMake(ScreenW*0.5-110, 19.75, 60, 0.5)];
        _leftView.backgroundColor = [CharacterLightGrayColor colorWithAlphaComponent:0.5];
        [self addSubview:_leftView];
        
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(ScreenW*0.5-50, 10, 100, 20)];
        _titleLab.font = [UIFont systemFontOfSize:15];
        _titleLab.textAlignment = 1;
        _titleLab.textColor = CharacterDarkColor;
        _titleLab.text = @"凉菜";
        [self addSubview:_titleLab];
        
        _rightView = [[UIView alloc] initWithFrame:CGRectMake(ScreenW*0.5+50, 19.75, 60, 0.5)];
        _rightView.backgroundColor = [CharacterLightGrayColor colorWithAlphaComponent:0.5];
        [self addSubview:_rightView];
        
    }
    return self;
}

@end
