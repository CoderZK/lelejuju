//
//  LxmHomeHeaderView.m
//  HappyTogether
//
//  Created by 李晓满 on 16/11/29.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmHomeHeaderView.h"

@interface LxmHomeHeaderView ()
{
    UIImageView * _imgView;
//    UIView * _linView;
}
@end

@implementation LxmHomeHeaderView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier])
    {
        UIView * linView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 0.5)];
        _linView = linView;
        linView.backgroundColor = BGGrayColor;
        [self addSubview:linView];
        
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(25, 15, 10, 10)];
        _imgView.image = [UIImage imageNamed:@"pic_1"];
        [self addSubview:_imgView];
        
    
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, ScreenW-70, 20)];
        _titleLab.textColor = CharacterDarkColor;
        _titleLab.font = [UIFont systemFontOfSize:15];
        [self addSubview:_titleLab];
        
    }
    return self;
}
-(void)setIsImgHidden:(BOOL)isImgHidden
{
    if (isImgHidden)
    {
        _linView.hidden = NO;
        _imgView.frame = CGRectZero;
        _titleLab.frame = CGRectMake(10, 10, ScreenW-20, 20);
    }
    else
    {
        _linView.hidden = YES;
        _imgView.frame = CGRectMake(25, 15, 10, 10);
        _titleLab.frame = CGRectMake(50, 10, ScreenW-70, 20);
    }
}

@end
