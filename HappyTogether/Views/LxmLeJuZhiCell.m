//
//  LxmLeJuZhiCell.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/12.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmLeJuZhiCell.h"

@implementation LxmLeJuZhiCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        UIImageView * iconImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 12, 16, 16)];
        iconImgView.image = [UIImage imageNamed:@"ico_qb_shijian"];
        [self addSubview:iconImgView];
        
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(35, 10, ScreenW-35-10, 20)];
        _titleLab.textColor = CharacterDarkColor;
        _titleLab.font = [UIFont systemFontOfSize:13];
        NSString * str1 = @"2016-09-01 20:00:08 消费90元 获取9乐聚值";
        NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:str1];
        [attri addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(str1.length-4, 1)];
        _titleLab.attributedText = attri;
        [self addSubview:_titleLab];
    }
    return self;
}
@end
