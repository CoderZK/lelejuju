//
//  LxmSelectJiuDianCataCell.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/1.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmSelectJiuDianCataCell.h"

@interface LxmSelectJiuDianCataCell ()
{
    NSArray * _tempArr;
    
    NSMutableArray * _btnArr;
    NSMutableArray * _btnArr1;
    NSMutableArray * _btnArr2;
}
@end

@implementation LxmSelectJiuDianCataCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier titleArr:(NSArray *)titleArr section:(NSInteger)section
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _tempArr = titleArr;
        
        _btnArr = [NSMutableArray array];
        _btnArr1 = [NSMutableArray array];
        _btnArr2 = [NSMutableArray array];
        
        CGFloat space = ((ScreenW-20)-80*4)/3;
        
        for (int i=0; i<titleArr.count; i++)
        {
            CGRect rect = CGRectMake(10+(80+space)*(i%4),10+(30+15)*(i/4), 80, 30);
            UIButton * btn = [[UIButton alloc] initWithFrame:rect];
            [btn setTitle:[titleArr objectAtIndex:i] forState:UIControlStateNormal];
            
            [btn setBackgroundImage:[UIImage imageNamed:@"btn_bqxz"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"btn_bqxzh"] forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [btn setTitleColor:CharacterGrayColor forState:UIControlStateNormal];
            [btn setTitleColor:YellowColor forState:UIControlStateSelected];
            btn.titleLabel.font = [UIFont systemFontOfSize:13];
            
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
            [[NSUserDefaults standardUserDefaults] setObject:[_tempArr objectAtIndex:btnn.tag] forKey:@"str1"];
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
            [[NSUserDefaults standardUserDefaults] setObject:[_tempArr objectAtIndex:btn1.tag-10] forKey:@"str2"];
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
            [[NSUserDefaults standardUserDefaults] setObject:[_tempArr objectAtIndex:btn2.tag-20] forKey:@"str3"];
        }
        else
        {
            btn2.selected = NO;
        }
    }
    NSString * str1 = [[NSUserDefaults standardUserDefaults] objectForKey:@"str1"];
    NSString * str2 = [[NSUserDefaults standardUserDefaults] objectForKey:@"str2"];
    NSString * str3 = [[NSUserDefaults standardUserDefaults] objectForKey:@"str3"];
    
    if ([self.delegate respondsToSelector:@selector(LxmSelectJiuDianCataCell:str1:str2:str3:)]) {
        [self.delegate LxmSelectJiuDianCataCell:self str1:str1 str2:str2 str3:str3];
    }
    
}

@end
