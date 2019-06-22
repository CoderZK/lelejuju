//
//  LxmHomeJuHuiCell.m
//  HappyTogether
//
//  Created by 李晓满 on 16/11/29.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmHomeJuHuiCell.h"

@interface LxmHomeJuHuiCell ()
{
    
}
@end
@implementation LxmHomeJuHuiCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier titleArr:(NSArray *)titleArr section:(NSInteger)section
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        CGFloat space = 0.0;
        _btnArr = [NSMutableArray array];
        _btnArr1 = [NSMutableArray array];
        _btnArr2 = [NSMutableArray array];
        
        if (section == 1)
        {
           space = ((ScreenW-100)-80*3)/2;
        }
        else
        {
           space = ((ScreenW-100-60)-60*3)/2;
        }
        
        if (ScreenW < 375) {
            space = 10;
        }
        for (int i=0; i<titleArr.count; i++)
        {
            
            CGRect rect = CGRectZero;
            if (section == 1)
            {
                rect = CGRectMake(50+(80+space)*(i%3),10+(30+20)*(i/3), 80, 30);
            }
            else
            {
                rect = CGRectMake(50+(60+space)*(i%3),10+(30+20)*(i/3), 60, 30);
            }
            
            UIButton * btn = [[UIButton alloc] initWithFrame:rect];
            [btn setTitle:[titleArr objectAtIndex:i] forState:UIControlStateNormal];
          
            [btn setBackgroundImage:[UIImage imageNamed:@"white"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"yellow"] forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [btn setTitleColor:YellowColor forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            btn.titleLabel.font = [UIFont systemFontOfSize:13];
            btn.layer.cornerRadius = 15;
            btn.layer.borderWidth = 0.5;
            btn.layer.borderColor = YellowColor.CGColor;
            btn.layer.masksToBounds = YellowColor;
            if (section == 0)
            {
                btn.tag = i;
                [_btnArr addObject:btn];
            }
            else if (section == 1)
            {
                btn.tag = 10+i;
                [_btnArr1 addObject:btn];

            }
            else
            {
                btn.tag = 20+i;
                [_btnArr2 addObject:btn];

            }
            [self addSubview:btn];
            
        }
    }
    return self;
}
-(void)btnClick:(UIButton *)btn
{
    for (UIButton * btnn in _btnArr)
    {
        
        if (btnn.tag == btn.tag)
        {
            btnn.selected = YES;
        }
        else
        {
            btnn.selected = NO;
        }
    }
    for (UIButton * btn1 in _btnArr1)
    {
        
        if (btn1.tag == btn.tag)
        {
            btn1.selected = YES;
        }
        else
        {
            btn1.selected = NO;
        }
    }
    for (UIButton * btn2 in _btnArr2)
    {
        
        if (btn2.tag == btn.tag)
        {
            btn2.selected = YES;
        }
        else
        {
            btn2.selected = NO;
        }
    }
    if ([self.delegate respondsToSelector:@selector(LxmHomeJuHuiCell:btnAtIndex:)])
    {
        [self.delegate LxmHomeJuHuiCell:self btnAtIndex:btn.tag];
    }
    
}

@end
