//
//  LxmOrderCell.m
//  HappyTogether
//
//  Created by 李晓满 on 16/11/30.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmOrderCell.h"

@implementation LxmOrderCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame])
    {
        CGFloat width = (ScreenW-15)*0.5;
        UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
        imgView.image = [UIImage imageNamed:@"2"];
        self.imgV = imgView;
        [self addSubview:imgView];
        
        UILabel * titleLab = [[UILabel alloc] initWithFrame:CGRectMake(2, width, width-4-80, 20)];
        titleLab.text = @"中式菜谱A";
        titleLab.textColor = CharacterDarkColor;
        titleLab.font = [UIFont systemFontOfSize:13];
        [self addSubview:titleLab];
        self.titleLab = titleLab;
        
        UILabel * priceLab = [[UILabel alloc] initWithFrame:CGRectMake(width-4-80, width, 80, 20)];
        priceLab.text = @"￥11480";
        priceLab.textAlignment = 2;
        priceLab.textColor = [UIColor redColor];
        priceLab.font = [UIFont systemFontOfSize:18];
        self.priceLab = priceLab;
        [self addSubview:priceLab];
        
        UILabel * detailLab = [[UILabel alloc] initWithFrame:CGRectMake(2, width+20+10, width-4, 20)];
        detailLab.text = @"3道凉菜+13道热菜";
        detailLab.textColor = CharacterGrayColor;
        detailLab.font = [UIFont systemFontOfSize:11];
        [self addSubview:detailLab];
        self.detailLab = detailLab;
        
//        UILabel * oldPriceLab = [[UILabel alloc] initWithFrame:CGRectMake(width-4-40, width+20, 40, 20)];
//        oldPriceLab.text = @"￥960";
//        oldPriceLab.textAlignment = 2;
//        oldPriceLab.textColor = CharacterGrayColor;
//        oldPriceLab.font = [UIFont systemFontOfSize:11];
//        NSString * str1 = @"￥960";
//        NSUInteger length = [str1 length];
//        NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:@"￥960"];
//        [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, length)];
//        [attri addAttribute:NSStrikethroughColorAttributeName value:CharacterGrayColor range:NSMakeRange(0, length)];
//        [oldPriceLab setAttributedText:attri];
//        [self addSubview:oldPriceLab];
        
//        UILabel * detailLab1 = [[UILabel alloc] initWithFrame:CGRectMake(2, width+40, width-4, 20)];
//        detailLab1.text = @"4素+6荤";
//        detailLab1.textColor = CharacterGrayColor;
//        detailLab1.font = [UIFont systemFontOfSize:11];
//        [self addSubview:detailLab1];
        
    }
    return self;
}
@end
