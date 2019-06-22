//
//  ZKMainXiaoXiCell.m
//  HappyTogether
//
//  Created by kunzhang on 16/12/12.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "ZKMainXiaoXiCell.h"

@implementation ZKMainXiaoXiCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //标题
        self.titleLB =[[UILabel alloc] initWithFrame:CGRectMake(15, 10, ScreenW - 30, 20)];
        self.titleLB.textColor = [UIColor blackColor];
        self.titleLB.font =[UIFont monospacedDigitSystemFontOfSize:15 weight:0.2];
        self.titleLB.text = @"白食单";
        [self.contentView addSubview:self.titleLB];
        
        
        //内容
        self.contentLB =[[UILabel alloc] initWithFrame:CGRectMake(15, 40, ScreenW - 30, 40)];
        self.contentLB.textColor = CharacterDarkColor;
        self.contentLB.font =[UIFont systemFontOfSize:13];

        self.contentLB.numberOfLines = 0;
        self.contentLB.text = @"您的抢白食单已经激活,请您按参加抢白是活动,谢谢你的支持";
        [self.contentView addSubview:self.contentLB];
        
        self.blackView =[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.contentLB.frame) + 10, ScreenW, 5)];
        self.blackView.backgroundColor=[UIColor groupTableViewBackgroundColor];
   
        [self.contentView addSubview:self.blackView];
        
        
}
    
    
    
    return self;
}



- (void)setModel:(ZKMainXiaoXiModel *)model {
    _model = model;
    
    self.titleLB.text =  [NSString stringWithFormat:@"%@",model.title];
    
    NSMutableAttributedString * att =[[NSMutableAttributedString alloc] initWithString: [NSString stringWithFormat:@"%@",model.content] attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]}];
    NSMutableParagraphStyle * para =[[NSMutableParagraphStyle alloc] init];
    para.lineSpacing = 5;
    
    [att addAttribute:NSParagraphStyleAttributeName value:para range:NSMakeRange(0, model.content.length)];
    
    self.contentLB.lineBreakMode = NSLineBreakByTruncatingTail;
    
    
    
    self.contentLB.attributedText = att;
    
    CGFloat contentHeight =[att boundingRectWithSize:CGSizeMake(ScreenW - 30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading context:nil].size.height;

    self.contentLB.mj_h = contentHeight;
    
    self.blackView.mj_y = CGRectGetMaxY(self.contentLB.frame) + 10;
 
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
