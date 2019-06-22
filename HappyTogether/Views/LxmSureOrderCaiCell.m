//
//  LxmSureOrderCaiCell.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/5.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmSureOrderCaiCell.h"

@implementation LxmSureOrderCaiCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
        imgView.layer.cornerRadius = 5;
        imgView.clipsToBounds = YES;
        imgView.image = [UIImage imageNamed:@"pic_qrdd"];
        self.imgV = imgView;
        [self addSubview:imgView];
        
        UILabel * titleLab = [[UILabel alloc] initWithFrame:CGRectMake(80, 20, ScreenW-80-10, 20)];
        titleLab.text = @"中式菜谱A";
        titleLab.textColor = CharacterDarkColor;
        titleLab.font = [UIFont systemFontOfSize:13];
        self.titleLab = titleLab;
        [self addSubview:titleLab];
        
        UILabel * priceLab = [[UILabel alloc] initWithFrame:CGRectMake(80, 40, 120, 20)];
        priceLab.text = @"￥510";
        priceLab.textColor = CharacterDarkColor;
        priceLab.font = [UIFont systemFontOfSize:13];
        [self addSubview:priceLab];
        self.priceLab = priceLab;
        
        UILabel * countLab = [[UILabel alloc] initWithFrame:CGRectMake(200, 40, 50, 20)];
        countLab.text = @"x1";
        countLab.textColor = CharacterDarkColor;
        countLab.font = [UIFont systemFontOfSize:13];
        [self addSubview:countLab];
        self.countLab = countLab;
        
        
        UILabel * totalLab = [[UILabel alloc] initWithFrame:CGRectMake(250, 40, ScreenW-250-10, 20)];
        totalLab.text = @"￥510.00";
        totalLab.textColor = CharacterDarkColor;
        totalLab.font = [UIFont systemFontOfSize:13];
        [self addSubview:totalLab];
        self.totalLab = totalLab;
        
    }
    return self;
}
@end
