//
//  ZKGouWuCarBT.m
//  HappyTogether
//
//  Created by kunzhang on 16/12/1.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "ZKGouWuCarBT.h"

@implementation ZKGouWuCarBT

- (instancetype)initWithFrame:(CGRect)frame {
    self =[super initWithFrame:frame];
    if (self) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.backgroundColor =[UIColor redColor];
        self.titleLabel.textColor =[UIColor whiteColor];
    }
    
    
    
    return self;
}


- (void)layoutSubviews {
    
    //调整图片
    [super layoutSubviews];
    
    //图片的宽高
    CGFloat WH = 22;
    //X 间距
    CGFloat  X =(self.frame.size.width - WH) / 2 ;
    CGFloat Y = (self.frame.size.height - WH) / 2;
    self.imageView.frame = CGRectMake(X, Y, WH, WH);
//    self.imageView.x = 0;
//    self.imageView.y = 0;
//    self.imageView.width = self.width;
//    self.imageView.height = self.width;
    
    //调整文字
    CGFloat ZWH = X + 2;
    CGFloat ZX = X + WH - 5;
    self.titleLabel.frame = CGRectMake(ZX, 2, ZWH, ZWH);
    self.titleLabel.layer.cornerRadius = ZWH /2;
    self.titleLabel.clipsToBounds = YES;
    
    
    
//    self.titleLabel.x = 0;
//    self.titleLabel.y = self.imageView.height;
//    self.titleLabel.width = self.width;
//    self.titleLabel.height = self.height - self.width;
    
    
}


@end
