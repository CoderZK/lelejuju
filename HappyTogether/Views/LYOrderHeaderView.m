//
//  LYOrderHeaderView.m
//  HappyTogether
//
//  Created by 李炎 on 16/12/12.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LYOrderHeaderView.h"

@implementation LYOrderHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = BGGrayColor;
        
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, ScreenW, 40)];
        headerView.backgroundColor = [UIColor whiteColor];
        [self addSubview:headerView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, ScreenW-130, 20)];
        _titleLabel.text = @"金陵江南大酒店";
        _titleLabel.textColor = CharacterDarkColor;
        _titleLabel.font = [UIFont systemFontOfSize:14];
        [headerView addSubview:_titleLabel];
        
        _orderState = [[UILabel alloc] initWithFrame:CGRectMake(ScreenW-130, 20, 120, 20)];
        _orderState.text = @"订单待支付";
        _orderState.textColor = CharacterDarkColor;
        _orderState.font = [UIFont systemFontOfSize:12];
        _orderState.textAlignment = NSTextAlignmentRight;
        [headerView addSubview:_orderState];
    }
    return self;
}

@end
