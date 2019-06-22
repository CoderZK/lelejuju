//
//  LxmAlertView1.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/1.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmAlertView1.h"

@interface LxmAlertView1 ()
{
    UIImageView * _imgView;
}
@end

@implementation LxmAlertView1

-(instancetype)initWithimage:(UIImage *)image price:(NSString *)price
{
    
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds])
    {
        
        UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake((self.bounds.size.width-196)*0.5, (self.bounds.size.height-176)*0.5, 196, 176)];
        _imgView = imgView;
        imgView.image = [UIImage imageNamed:@"bg_youhuij"];
        [self addSubview:imgView];
        
        
        UILabel * lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 196, 80)];
        lab.font = [UIFont systemFontOfSize:50];
        NSString * str = [NSString stringWithFormat:@"￥%@",price];
        NSMutableAttributedString * att = [[NSMutableAttributedString alloc] initWithString:str];
        [att addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, 1)];
        lab.attributedText = att;
        lab.textAlignment = 1;
        lab.textColor = [UIColor redColor];
        [imgView addSubview:lab];
      
    }
    return self;
}

-(void)show
{
    self.backgroundColor = [UIColor clearColor];
    self.alpha = 1;
    _imgView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    
    [[UIApplication sharedApplication].delegate.window addSubview:self];
    
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:20 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        _imgView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:5 animations:^{
            
            self.alpha = 0;
            
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];

    }];
}



@end
