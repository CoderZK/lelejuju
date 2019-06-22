//
//  LxmQiangBaiShiFooterView.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/6.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmQiangBaiShiFooterView.h"

@implementation LxmQiangBaiShiFooterView
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier])
    {
        UIView * linView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 0.5)];
        linView.backgroundColor = BGGrayColor;
        [self addSubview:linView];
        
        UILabel * lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, ScreenW-20, 20)];
        lab.font = [UIFont systemFontOfSize:14];
        lab.textColor = CharacterDarkColor;
        lab.text = @"待支付￥299";
        lab.textAlignment = 2;
        [self addSubview:lab];
        
        UIView * linView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 40, ScreenW, 5)];
        linView1.backgroundColor = BGGrayColor;
        [self addSubview:linView1];
    }
    return self;
}

@end
