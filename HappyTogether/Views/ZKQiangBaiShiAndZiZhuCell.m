//
//  ZKQiangBaiShiAndZiZhuCell.m
//  HappyTogether
//
//  Created by kunzhang on 16/12/1.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "ZKQiangBaiShiAndZiZhuCell.h"

@implementation ZKQiangBaiShiAndZiZhuCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
      //头像
        self.headImgV = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 80, 80)];
        self.headImgV.image =[UIImage imageNamed:@"pic_3"];
        [self.contentView addSubview:self.headImgV];
        
        //名字
        self.nameLB =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headImgV.frame) + 10,20, ScreenW - CGRectGetMaxX(self.headImgV.frame) - 100 , 20)];
        self.nameLB.text = @"金凌江南大饭店午餐拼桌";
        self.nameLB.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.nameLB];
        //地址
        self.AddressLB =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headImgV.frame) + 10, 45, ScreenW - CGRectGetMaxX(self.headImgV.frame) - 100 , 20)];
        self.AddressLB.text = @"新北区通江路500号";
        self.AddressLB.font = [UIFont systemFontOfSize:14];
        self.AddressLB.textColor = CharacterGrayColor;
        [self.contentView addSubview:self.AddressLB];
        //餐桌或者价格
        self.piceLB =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headImgV.frame) + 10, CGRectGetMaxY(self.headImgV.frame) - 20, 50 , 20)];
        self.piceLB.text = @"8人桌";
        self.piceLB.font = [UIFont systemFontOfSize:14];
        self.piceLB.textColor = CharacterGrayColor;
        [self.contentView addSubview:self.piceLB];
        //剩余几位
        self.remainLB =[[UILabel alloc] initWithFrame:CGRectMake(ScreenW - 100,30,85,20)];
        self.remainLB.textAlignment = NSTextAlignmentRight;
        self.remainLB.text = @"剩余6位";
        self.remainLB.font = [UIFont systemFontOfSize:14];
        self.remainLB.textColor = [UIColor redColor];
        [self.contentView addSubview:self.remainLB];
        
        //立即抢按钮
        self.qiangBT =[UIButton new];
        self.qiangBT.frame = CGRectMake(ScreenW - 95,60 , 80, 30);
        self.qiangBT.titleLabel.font =[UIFont systemFontOfSize:14];
        [self.qiangBT setTitleColor:YellowColor forState:UIControlStateNormal];
        [self.qiangBT setBackgroundImage:[UIImage imageNamed:@"btn_lijiqg"] forState:UIControlStateNormal];
        [self.qiangBT setTitle:@"免费抢购" forState:UIControlStateNormal];
        [self.contentView addSubview:self.qiangBT];
        
        //打折价格
        self.discontLB =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.piceLB.frame),CGRectGetMaxY(self.piceLB.frame) - 15,40,15)];
        self.discontLB.textAlignment = NSTextAlignmentLeft;
        self.discontLB.text = @"￥399";
        self.discontLB.font = [UIFont systemFontOfSize:10];
        self.discontLB.textColor = CharacterGrayColor;
        [self.contentView addSubview:self.discontLB];
        
        //几折
        self.jizheLB =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.discontLB.frame),CGRectGetMinY(self.discontLB.frame),20,15)];
        self.jizheLB.text = @"5折";
        self.jizheLB.textColor = YellowColor;
        self.jizheLB.textAlignment = NSTextAlignmentCenter;
        self.jizheLB.layer.borderColor = YellowColor.CGColor;
        self.jizheLB.layer.borderWidth = 1.0f;
        self.jizheLB.font = [UIFont systemFontOfSize:10];
        self.jizheLB.textColor = CharacterGrayColor;
        [self.contentView addSubview:self.jizheLB];

        //黑边
        UIView * backView =[[UIView alloc] initWithFrame:CGRectMake(0, 110, ScreenW, 5)];
        backView.backgroundColor =[UIColor groupTableViewBackgroundColor];
        [self.contentView addSubview:backView];

    }
    

    return self;
}

//赋值并布局
- (void)setModel:(ZKQiangBaiShiOrZiZhuModel *)model {
    _model = model;
    //图片
    
    
    //地址
    
    
    //剩余几桌
    NSString * shengjizhuoStr = [NSString stringWithFormat:@"剩余%@位",model.shengren];
    
    NSMutableAttributedString * shengAttri = [[NSMutableAttributedString alloc] initWithString:shengjizhuoStr];
    
    NSRange rangeSheng1 = NSMakeRange(0, 2);
    NSRange rangeSheng2 = NSMakeRange(shengjizhuoStr.length-1, 1);
    [shengAttri addAttribute:NSForegroundColorAttributeName value:CharacterGrayColor range:rangeSheng1];
    [shengAttri addAttribute:NSForegroundColorAttributeName value:CharacterGrayColor range:rangeSheng2];
    
    self.remainLB.attributedText = shengAttri;
    
    
    
    
    //主要是对不同部分赋值
    if (self.isQiangBaiShi == 1) {
        //是抢白食
        //按钮
        [self.qiangBT setTitle:@"免费抢" forState:UIControlStateNormal];
        NSString * Str = [NSString stringWithFormat:@"%@人桌",model.renshu];

        //对几桌进行设置
        NSRange range1 = NSMakeRange(0, Str.length - 2);
        NSRange range2 = NSMakeRange(Str.length - 2,2);
        NSMutableAttributedString * attributeStr =[[NSMutableAttributedString alloc] initWithString:Str];
        [attributeStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20.f] range:range1];
         [attributeStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range1];
        [attributeStr addAttribute:NSForegroundColorAttributeName value:CharacterGrayColor range:range2];

        self.piceLB.attributedText = attributeStr;
        
        
        
        //吧打折字和几折隐藏
        self.jizheLB.hidden = YES;
        self.discontLB.hidden = YES;
        
        
        
        
    }else {
       [self.qiangBT setTitle:@"立即抢购" forState:UIControlStateNormal];
        
        //吧打折字和几折隐藏
        self.jizheLB.hidden = NO;
        self.discontLB.hidden = NO;
        NSString * moneyStr =  [NSString stringWithFormat:@"￥%@",model.money];
        self.piceLB.text =  [NSString stringWithFormat:@"%@",moneyStr];
        self.piceLB.textColor =[UIColor redColor];

        //价格布局
        CGFloat renshuW = [moneyStr getSizeWithMaxSize:CGSizeMake(200, 20) withFontSize:14].width;
        
        self.piceLB.mj_w = renshuW;
        
        //折扣价计算
        NSString * dazheStr =  [NSString stringWithFormat:@"￥%@",model.discontM];
        
        NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:dazheStr];
        [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, dazheStr.length)];
        [attri addAttribute:NSStrikethroughColorAttributeName value:CharacterGrayColor range:NSMakeRange(0, dazheStr.length)];
        [self.discontLB setAttributedText:attri];
        
        
        //打折的几个进行重新布局
        CGFloat disContW = [dazheStr getSizeWithMaxSize:CGSizeMake(200, 20) withFontSize:14].width;
        self.discontLB.mj_x = CGRectGetMaxX(self.piceLB.frame) + 5;
        self.discontLB.mj_w = disContW;
        
        
        
        //几折布局(不确定是返回值,还是根据优惠价计算)
        self.jizheLB.mj_x = CGRectGetMaxX(self.discontLB.frame);
        
 
        
    }

}





- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
