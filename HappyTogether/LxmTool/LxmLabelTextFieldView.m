//
//  LxmLabelTextFieldView.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/7.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmLabelTextFieldView.h"

@implementation LxmLabelTextFieldView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        UILabel * lab = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 50, 20)];
        lab.font = [UIFont systemFontOfSize:15];
        lab.textColor = CharacterDarkColor;
        _titleLabel= lab;
        [self addSubview:lab];
        
        UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(15, 49.5, ScreenW-15, 0.5)];
        lineView.backgroundColor = [CharacterGrayColor colorWithAlphaComponent:0.2];
        [self addSubview:lineView];
        
        UITextField * tf = [[UITextField alloc] initWithFrame:CGRectMake(15+70, 15, ScreenW-85-5, 20)];
        tf.font = [UIFont systemFontOfSize:15];
        _tf = tf;
        [self addSubview:tf];
        
    }
    return self;
}
-(void)setLabStr:(NSString *)labStr
{
    CGFloat w = [labStr getSizeWithMaxSize:CGSizeMake(ScreenW-30, 9999) withFontSize:15].width;
    _titleLabel.text = labStr;
    _titleLabel.frame = CGRectMake(15, 15, w, 20);
    _tf.frame = CGRectMake(20+w, 15, ScreenW -20-w-15, 20);
    
}


@end
