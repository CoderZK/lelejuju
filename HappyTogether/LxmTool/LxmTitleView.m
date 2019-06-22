//
//  LxmTitleView.m
//  HappyTogether
//
//  Created by 李晓满 on 16/11/29.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmTitleView.h"

@interface LxmTitleView ()
{
    UIView *_lineView;
    NSMutableArray * _btnArr;
}
@end
@implementation LxmTitleView
-(instancetype)initWithFrame:(CGRect)frame withTitleArr:(NSArray *)titleArr isOrder:(BOOL)order
{
    if (self=[super initWithFrame:frame])
    {
        _btnArr = [NSMutableArray array];
        for (int i=0; i<titleArr.count; i++)
        {
            UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(frame.size.width/titleArr.count*i, 0, frame.size.width/titleArr.count,frame.size.height)];
            [btn setTitle:[titleArr objectAtIndex:i] forState:UIControlStateNormal];
            btn.tag=i;
            [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            [btn setTitleColor:YellowColor forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            if (order)
            {
                btn.titleLabel.font=[UIFont systemFontOfSize:13];
            }
            else
            {
                 btn.titleLabel.font=[UIFont systemFontOfSize:16];
            }
            [self addSubview:btn];
            [_btnArr addObject:btn];
            
            if (btn.tag==0)
            {
                btn.selected = YES;
                _lineView=[[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height-1.5, frame.size.width/titleArr.count, 2)];
                _lineView.backgroundColor=YellowColor;
                [self addSubview:_lineView];
            }
        }
    }
    return self;
    
}


-(void)LxmTitleViewWithTag:(NSInteger)btnTag
{
    for (int i=0; i<_btnArr.count; i++)
    {
        UIButton * btn1 = [_btnArr objectAtIndex:i];
        if (btn1.tag == btnTag)
        {
            btn1.selected = YES;
            [UIView animateWithDuration:0.3 animations:^{
                CGRect rect=_lineView.frame;
                rect.origin.x=btn1.frame.size.width*btnTag;
                _lineView.frame=rect;
            }];
            
        }
        else
        {
            btn1.selected = NO;
        }
    }
}
-(void)btnClick:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(LxmTitleViewView:btnAtIndex:)])
    {
        [self.delegate LxmTitleViewView:self btnAtIndex:btn.tag];
    }
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect=_lineView.frame;
        rect.origin.x=btn.frame.size.width*btn.tag;
        _lineView.frame=rect;
    }];
    
    
    for (int i=0; i<_btnArr.count; i++)
    {
        UIButton * btn1 = [_btnArr objectAtIndex:i];
        if (btn1==btn)
        {
            btn1.selected = YES;
        }
        else
        {
            btn1.selected = NO;
        }
    }
}

@end
