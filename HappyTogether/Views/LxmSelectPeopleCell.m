//
//  LxmSelectPeopleCell.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/7.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmSelectPeopleCell.h"

@implementation LxmSelectPeopleCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _iconBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 70)];
        
        _iconBtn.tag = 11;
        [_iconBtn addTarget:self action:@selector(iconBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_iconBtn setImage:[UIImage imageNamed:@"pic_1"] forState:UIControlStateNormal];
        [_iconBtn setImage:[UIImage imageNamed:@"ico_xuanzhong"] forState:UIControlStateSelected];
        [_iconBtn setImageEdgeInsets:UIEdgeInsetsMake(31, 16, 31, 16)];
        [self addSubview:_iconBtn];
        
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(40, 10, ScreenW-30, 50)];
        _titleLab.text = @"李佳佳 女士 12345678901";
        _titleLab.numberOfLines = 2;
        _titleLab.font = [UIFont systemFontOfSize:14];
        _titleLab.textColor = CharacterDarkColor;
        [self addSubview:_titleLab];
        
        _detailLab = [[UILabel alloc] initWithFrame:CGRectMake(40, 10, ScreenW-30, 50)];
        _detailLab.text = @"常州市新北区黄河东路89号";
        _detailLab.font = [UIFont systemFontOfSize:13];
        _detailLab.textColor = CharacterDarkColor;
        [self addSubview:_detailLab];
        
        UIButton * editBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenW-40, 0, 40, 70)];
        editBtn.tag = 12;
        [editBtn addTarget:self action:@selector(iconBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [editBtn setImageEdgeInsets:UIEdgeInsetsMake(15, 0, 15, 0)];
        [editBtn setImage:[UIImage imageNamed:@"ico_biaoj"] forState:UIControlStateNormal];
//        [self addSubview:editBtn];
        
    }
    return self;
}
-(void)iconBtnClick:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(LxmSelectPeopleCell:index:)])
    {
        [self.delegate LxmSelectPeopleCell:self index:btn.tag];
    }
}
-(void)setIsQingbaishi:(BOOL)isQingbaishi
{
    if (isQingbaishi)
    {
        _detailLab.hidden = YES;
        _titleLab.frame = CGRectMake(40, 10, ScreenW-30, 50);
        _titleLab.numberOfLines = 2;
    }
    else
    {
        _detailLab.hidden = NO;
        _titleLab.frame = CGRectMake(40, 12, ScreenW-30, 20);
        _detailLab.frame = CGRectMake(40, 38, ScreenW-30, 20);
        _titleLab.numberOfLines = 1;
    }
}
@end
