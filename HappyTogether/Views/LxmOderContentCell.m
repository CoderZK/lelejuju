//
//  LxmOderContentCell.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/1.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LXmOderContentCell.h"

@implementation LxmOderContentCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, ScreenW*0.5-30-10, 20)];
        _titleLab.text = @"爽口拌杂菜";
        _titleLab.textAlignment = 2;
        _titleLab.textColor = CharacterGrayColor;
        _titleLab.font = [UIFont systemFontOfSize:13];
        [self addSubview:_titleLab];
        
        _priceLab = [[UILabel alloc] initWithFrame:CGRectMake(ScreenW*0.5+30+10, 10, ScreenW*0.5-30-10, 20)];
        _priceLab.text = @"￥28";
        _priceLab.textColor = CharacterGrayColor;
        _priceLab.font = [UIFont systemFontOfSize:13];
        [self addSubview:_priceLab];
        
    }
    return self;
}

@end
