//
//  LxmSureOrderFooterView.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/5.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmSureOrderFooterView.h"

@interface LxmSureOrderFooterView ()
@property(nonatomic,strong)UILabel * pricelab;
@property(nonatomic,strong)UILabel * youhuiLab;
@property(nonatomic,strong)UILabel * leftLab;

@end
@implementation LxmSureOrderFooterView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier])
    {
        _pricelab = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 20)];
        _pricelab.text = @"订单￥1024";
        _pricelab.textColor = CharacterDarkColor;
        _pricelab.font = [UIFont systemFontOfSize:13];
        [self addSubview:_pricelab];
        
        _youhuiLab = [[UILabel alloc] initWithFrame:CGRectMake(110, 10, 100, 20)];
        _youhuiLab.text = @"优惠￥60";
        _youhuiLab.textColor = CharacterDarkColor;
        _youhuiLab.font = [UIFont systemFontOfSize:13];
        [self addSubview:_youhuiLab];
        
        _leftLab = [[UILabel alloc] initWithFrame:CGRectMake(ScreenW-100, 10, 100, 20)];
        _leftLab.text = @"待支付￥986";
        _leftLab.textAlignment = 2;
        _leftLab.textColor = CharacterDarkColor;
        _leftLab.font = [UIFont systemFontOfSize:13];
        [self addSubview:_leftLab];
    }
    return self;
}
-(void)setPriceStr:(NSString *)priceStr
{
    CGFloat w = [priceStr getSizeWithMaxSize:CGSizeMake(ScreenW*0.5, 20) withFontSize:13 ].width;
    _pricelab.text = priceStr;
    _pricelab.frame = CGRectMake(10, 10, w, 20);
}
-(void)setYouhuiStr:(NSString *)youhuiStr
{
    CGFloat w = [youhuiStr getSizeWithMaxSize:CGSizeMake(ScreenW*0.3, 20) withFontSize:13 ].width;
    _youhuiLab.text = youhuiStr;
    _youhuiLab.frame = CGRectMake(CGRectGetMaxX(_pricelab.frame)+5, 10, w, 20);
}
-(void)setLeftStr:(NSString *)leftStr
{
    _leftLab.text = leftStr;
    _leftLab.frame = CGRectMake(CGRectGetMaxX(_youhuiLab.frame)+5, 10, ScreenW-CGRectGetMaxX(_youhuiLab.frame)-5-10, 20);
}

@end
