//
//  LxmQiangBaiOrderAdressCell.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/6.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmQiangBaiOrderAdressCell.h"

@implementation LxmQiangBaiOrderAdressCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 25, 20, 20)];
        imgView.image = [UIImage imageNamed:@"ico_xinxi"];
        [self addSubview:imgView];
        
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(40, 25, ScreenW-40-40, 20)];
        _titleLab.textColor = CharacterDarkColor;
        _titleLab.font = [UIFont systemFontOfSize:14];
        _titleLab.text = @"李佳佳 女士 13685345678";
        [self addSubview:_titleLab];
        
        _accImgView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenW-35, 35-6.5, 7, 13)];
        _accImgView.image = [UIImage imageNamed:@"lxmcelljiantou"];
        self.accessoryView = _accImgView;
        
        UIImageView * accImgView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 70-ScreenW*6/750, ScreenW, ScreenW*6/750)];
        accImgView1.image = [UIImage imageNamed:@"bg_xiantiao"];
        [self addSubview:accImgView1];
    }
    return self;
}


@end
