//
//  LxmHomeCateBtn.m
//  HappyTogether
//
//  Created by 李晓满 on 16/11/30.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmHomeCateBtn.h"

@interface LxmHomeCateBtn ()
{
    UIImageView * _arrowImgView;
}
@end

@implementation LxmHomeCateBtn

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame])
    {
        self.titleLabel.font=[UIFont systemFontOfSize:14];
        self.titleEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
        [self setTitleColor:CharacterGrayColor forState:UIControlStateNormal];
        //[self setTitleColor:YellowColor forState:UIControlStateSelected];
        _arrowImgView =[[UIImageView alloc] init];
        _arrowImgView.translatesAutoresizingMaskIntoConstraints = NO;
        _arrowImgView.image = [UIImage imageNamed:@"ic_xiajiantou"];
        [self addSubview:_arrowImgView];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[label]-3-[arrowImgView(10)]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:@{@"label":self.titleLabel,@"arrowImgView":_arrowImgView}]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[arrowImgView(10)]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:@{@"arrowImgView":_arrowImgView}]];
        
    }
    return self;
}
-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    if (self.selected)
    {
        [UIView animateWithDuration:0.3 animations:^{
            _arrowImgView.transform = CGAffineTransformMakeRotation(M_PI);
        }];
    }
    else
    {
        [UIView animateWithDuration:0.3 animations:^{
            _arrowImgView.transform = CGAffineTransformIdentity;
        }];
    }
}

@end
