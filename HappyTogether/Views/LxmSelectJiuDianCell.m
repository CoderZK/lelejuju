//
//  LxmSelectJiuDianCell.m
//  HappyTogether
//
//  Created by 李晓满 on 16/11/30.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmSelectJiuDianCell.h"

@implementation LxmSelectJiuDianCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
        imgView.image = [UIImage imageNamed:@"1111"];
        imgView.contentMode = UIViewContentModeScaleAspectFill;
        imgView.layer.cornerRadius = 3;
        imgView.clipsToBounds = YES;
        [self addSubview:imgView];
        
        UILabel * titleLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, ScreenW-110-60, 20)];
        titleLab.text = @"锦江国际大酒店";
        titleLab.textColor = CharacterDarkColor;
        titleLab.font = [UIFont systemFontOfSize:14];
        [self addSubview:titleLab];
        self.nameLB = titleLab;
        
//        UILabel * distanceLab = [[UILabel alloc] initWithFrame:CGRectMake(ScreenW-60, 10, 50, 20)];
//        distanceLab.text = @"1.3km";
//        distanceLab.textAlignment = 2;
//        distanceLab.textColor = CharacterLightGrayColor;
//        distanceLab.font = [UIFont systemFontOfSize:14];
//        [self addSubview:distanceLab];
        
        
        UILabel * detailLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 40, ScreenW-110, 20)];
        detailLab.text = @"通江中路599号";
        detailLab.textColor = CharacterLightGrayColor;
        detailLab.font = [UIFont systemFontOfSize:13];
        [self addSubview:detailLab];
        
        UILabel * adressLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 70, ScreenW-110, 20)];
        adressLab.text = @"新北区";
        adressLab.textColor = YellowColor;
        adressLab.font = [UIFont systemFontOfSize:13];
        [self addSubview:adressLab];
        
        self.adressLab = adressLab;
        self.detailLab = detailLab;
        self.imgV = imgView;
        
        
    }
    return self;
}

@end
