//
//  ZKLaidianJiuCell.m
//  HappyTogether
//
//  Created by kunzhang on 16/12/1.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "ZKLaidianJiuCell.h"

@implementation ZKLaidianJiuCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        
        self.headImgV =[[UIImageView alloc] initWithFrame:CGRectMake(20, 20, self.mj_w - 40 , self.mj_w -40)];
        self.headImgV.image = [UIImage imageNamed:@"pic_3"];
        [self.contentView addSubview:self.headImgV];
        
        self.nameLB =[[UILabel alloc] initWithFrame:CGRectMake( 5 ,self.mj_w + 5, self.mj_w - 10 , 35)];
        self.nameLB.font =[UIFont systemFontOfSize:12];
        self.nameLB.numberOfLines = 2;
        self.nameLB.textColor = CharacterDarkColor;
        self.nameLB.text = @"洋河蓝色经典海之栏52度375ml*1";
        [self.contentView addSubview:self.nameLB];
        
        self.piceLB =[[UILabel alloc] initWithFrame:CGRectMake( 5 ,CGRectGetMaxY(self.nameLB.frame), 80 , 30)];
        self.piceLB.font =[UIFont systemFontOfSize:16];
        self.piceLB.textColor = [UIColor redColor];
        self.piceLB.text = @"￥178.00";
        [self.contentView addSubview:self.piceLB];
        
        self.addBT =[UIButton new];
        self.addBT.frame =CGRectMake(self.mj_w - 25, CGRectGetMaxY(self.nameLB.frame) + 5, 20, 20);
        [self.addBT setBackgroundImage:[UIImage imageNamed:@"ico_jia"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.addBT];
        
      
        self.numberLB =[[UILabel alloc] initWithFrame:CGRectMake(self.mj_w - 50, CGRectGetMaxY(self.nameLB.frame) + 5, 20, 20)];
        self.numberLB.font =[UIFont systemFontOfSize:14];
        self.numberLB.text = @"0";
        self.numberLB.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.numberLB];
        
        
        self.subBT =[UIButton new];
        self.subBT.frame =CGRectMake(self.mj_w - 75, CGRectGetMaxY(self.nameLB.frame) + 5, 20,20);
           [self.subBT setBackgroundImage:[UIImage imageNamed:@"ico_jian"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.subBT];
    }

    return self;
}

- (void)setModel:(YJHomeModel *)model {
    _model = model;
    
    //图片赋值
    
    //价格赋值
    self.headImgV.image = [UIImage imageNamed: [NSString stringWithFormat:@"%@",model.img]];
    self.piceLB.text =  [NSString stringWithFormat:@"￥%0.2f",model.price];
    self.nameLB.text = model.name;
    //加减
    if (model.choiceNumber) {
        self.subBT.hidden = NO;
        self.numberLB.hidden = NO;
         self.numberLB.text = [NSString stringWithFormat:@"%zd",model.choiceNumber];
    } else {
        
        self.subBT.hidden = YES;
        self.numberLB.hidden = YES;
        
       

    }
  
}






@end
