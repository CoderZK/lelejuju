//
//  LxmSureOrderAddressCell.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/5.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmSureOrderAddressCell.h"

@implementation LxmSureOrderAddressCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 20, 20)];
        imgView.image = [UIImage imageNamed:@"ico_xinxi"];
        [self addSubview:imgView];
        
        UILabel * titleLab = [[UILabel alloc] initWithFrame:CGRectMake(40, 15, ScreenW-40-40, 20)];
        titleLab.textColor = CharacterDarkColor;
        titleLab.font = [UIFont systemFontOfSize:14];
        titleLab.text = @"李佳佳 女士 13685345678";
        [self addSubview:titleLab];
        
        UILabel * detailLab = [[UILabel alloc] initWithFrame:CGRectMake(40, 35, ScreenW-40-40, 20)];
        detailLab.textColor = CharacterDarkColor;
        detailLab.font = [UIFont systemFontOfSize:12];
        detailLab.text = @"晚餐 6-8人 人均60-70元";
        [self addSubview:detailLab];
        
        UIImageView * accImgView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenW-35, 28, 7, 13)];
        accImgView.image = [UIImage imageNamed:@"lxmcelljiantou"];
        self.accessoryView = accImgView;
        
        _accImgView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 70-ScreenW*6/750, ScreenW, ScreenW*6/750)];
        _accImgView1.image = [UIImage imageNamed:@"bg_xiantiao"];
        [self addSubview:_accImgView1];
    }
    return self;
}

@end
