//
//  LxmSureOrderYouHuiCell.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/5.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmSureOrderYouHuiCell.h"

@implementation LxmSureOrderYouHuiCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 12, 20, 20)];
        _imgView.layer.cornerRadius = 5;
        _imgView.clipsToBounds = YES;
        _imgView.image = [UIImage imageNamed:@"pic_qrdd"];
        [self addSubview:_imgView];
        
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(45, 12, ScreenW-55-100, 20)];
        _titleLab.textColor = CharacterDarkColor;
        _titleLab.font = [UIFont systemFontOfSize:12];
        [self addSubview:_titleLab];
        
        _detailelab = [[UILabel alloc] initWithFrame:CGRectMake(ScreenW-15-100, 12, 100, 20)];
        _detailelab.textAlignment = 2;
        _detailelab.text = @"-￥30.00";
        _detailelab.textColor = [UIColor redColor];
        _detailelab.font = [UIFont systemFontOfSize:12];
        [self addSubview:_detailelab];
    }
    return self;
}

@end
