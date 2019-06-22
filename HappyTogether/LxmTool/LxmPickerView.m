//
//  LxmPickerView.m
//  ShareGo
//
//  Created by 李晓满 on 16/4/23.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmPickerView.h"

@interface LxmPickerView ()<UIPickerViewDataSource,UIPickerViewDelegate>
{
    UIView * _contentView;
    UIPickerView * _pickerView;
    
}
@end
@implementation LxmPickerView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        
        UIButton * bgBtn =[[UIButton alloc] initWithFrame:self.bounds];
        [bgBtn addTarget:self action:@selector(bgBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        bgBtn.tag = 110;
        [self addSubview:bgBtn];

        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height-200, frame.size.width, 200)];
        _contentView.backgroundColor=BGGrayColor;
        [self addSubview:_contentView];
        
        
        UILabel * toplab = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, ScreenW-20, 20)];
        toplab.font = [UIFont systemFontOfSize:11];
        toplab.textColor = CharacterDarkColor;
        toplab.text = @"提示:到店时间前半小时退单全额退款,半小时之后将收取违约费";
        [_contentView addSubview:toplab];
        
        UIView * accView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, frame.size.width, 40)];
        accView.backgroundColor = [UIColor whiteColor];
        [_contentView addSubview:accView];
        
        UIButton * leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
        [leftBtn setTitle:@"取消" forState:UIControlStateNormal];
        leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [leftBtn addTarget:self action:@selector(bgBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        leftBtn.tag = 111;
        [leftBtn setTitleColor:YellowColor forState:UIControlStateNormal];
        [accView addSubview:leftBtn];
        
        UILabel * lab = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, ScreenW-120, 40)];
        lab.textAlignment = 1;
        lab.font = [UIFont systemFontOfSize:15];
        lab.textColor = CharacterDarkColor;
        lab.text = @"到店时间";
        [accView addSubview:lab];
        
        UIButton * rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width-60, 0, 60, 40)];
        rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [rightBtn addTarget:self action:@selector(bgBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        rightBtn.tag = 112;
        [rightBtn setTitle:@"确定" forState:UIControlStateNormal];
        [rightBtn setTitleColor:YellowColor forState:UIControlStateNormal];
        [accView addSubview:rightBtn];
        
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 60, _contentView.bounds.size.width, _contentView.bounds.size.height-60)];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
        [_contentView addSubview:_pickerView];
    }
    return self;
}
- (NSInteger)selectedRowInComponent:(NSInteger)component
{
    return [_pickerView selectedRowInComponent:component];
}
- (void)reloadAllComponents
{
    [_pickerView reloadAllComponents];
}
- (void)reloadComponent:(NSInteger)component
{
    [_pickerView reloadComponent:component];
}
-(void)bgBtnClick:(UIButton *)btn
{
    if (btn.tag == 110)
    {
        [self dismiss];
    }
    else
    {
        if (btn.tag == 111)
        {
            [self dismiss];
        }
        else
        {
            if ([self.delegate respondsToSelector:@selector(LxmPickerViewDelegate:btnAtIndex:)])
            {
                [self.delegate LxmPickerViewDelegate:self btnAtIndex:btn.tag];
            }

        }
    }
    
    
}

+(LxmPickerView *)pickerView
{
    // 选择框
    LxmPickerView *pickerView = [[LxmPickerView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 显示选中框
    return pickerView;
}

// pickerView 列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return [self.dataSource numberOfComponentsInPickerView:self];
}

// pickerView 每列个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.dataSource pickerView:self numberOfRowsInComponent:component];
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view
{
    
    return [self.delegate pickerView:self viewForRow:row forComponent:component reusingView:view];
}

/**
 选中的行
 */
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    return [self.delegate pickerView:self didSelectRow:row inComponent:component];
}

-(void)show
{
    [_pickerView reloadAllComponents];
    UIWindow * window = [UIApplication sharedApplication].delegate.window;
    [window addSubview:self];
    [window bringSubviewToFront:self];
    
    self.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.0];
    CGRect rect = _contentView.frame;
    rect.origin.y = self.bounds.size.height;
    _contentView.frame = rect;
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.3];
        CGRect rect = _contentView.frame;
        rect.origin.y = self.bounds.size.height-_contentView.frame.size.height;
        _contentView.frame = rect;
        
    } completion:nil];
}
-(void)dismiss
{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.0];
        CGRect rect = _contentView.frame;
        rect.origin.y = self.bounds.size.height;
        _contentView.frame = rect;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];

}

@end
