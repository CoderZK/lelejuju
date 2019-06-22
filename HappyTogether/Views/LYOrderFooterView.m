//
//  LYOrderFooterView.m
//  HappyTogether
//
//  Created by 李炎 on 16/12/12.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LYOrderFooterView.h"

@implementation LYOrderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = BGGrayColor;
        self.layer.masksToBounds = YES;
        
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 80)];
        headerView.backgroundColor = [UIColor whiteColor];
        [self addSubview:headerView];
        
        UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 1)];
        line1.backgroundColor = BGGrayColor;
        [headerView addSubview:line1];
        
        _price = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, ScreenW-20, 20)];
        _price.text = @"待支付 ￥998";
        _price.textColor = CharacterDarkColor;
        _price.font = [UIFont systemFontOfSize:13];
        _price.textAlignment = NSTextAlignmentRight;
        
        NSRange boldRange = [_price.text rangeOfString:@"998"];
        NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:_price.attributedText];
        [mutableAttributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17] range:boldRange];
        _price.attributedText = mutableAttributedString;
        [headerView addSubview:_price];
        
        UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(0, 40, ScreenW, 1)];
        line2.backgroundColor = BGGrayColor;
        [headerView addSubview:line2];
        
        //btn_bqxzh(带颜色框) btn_weidianj(黑灰色) 81*29
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBtn setBackgroundImage:[UIImage imageNamed:@"btn_bqxzh"] forState:UIControlStateNormal];
        [_rightBtn setTitle:@"去支付" forState:UIControlStateNormal];
        _rightBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_rightBtn setTitleColor:YellowColor forState:UIControlStateNormal];
        _rightBtn.frame = CGRectMake(ScreenW-81-10, 48, 81, 26);
        [headerView addSubview:_rightBtn];
        
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftBtn setBackgroundImage:[UIImage imageNamed:@"btn_weidianj"] forState:UIControlStateNormal];
        [_leftBtn setTitle:@"取消订单" forState:UIControlStateNormal];
        _leftBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_leftBtn setTitleColor:CharacterGrayColor forState:UIControlStateNormal];
        _leftBtn.frame = CGRectMake(ScreenW-81*2-20, 48, 81, 26);
        [headerView addSubview:_leftBtn];
        
    }
    return self;
}

@end
