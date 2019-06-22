//
//  LxmAddAdressVC.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/7.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmAddAdressVC.h"
#import "LxmLabelTextFieldView.h"

@interface LxmAddAdressVC ()
{
    NSMutableArray * _btnArr;
    UIView * _headerView ;
    LxmLabelTextFieldView * _nameView;
    LxmLabelTextFieldView * _phoneView;
    LxmLabelTextFieldView * _addressView;
    UIView * _sexView;
}
@end

@implementation LxmAddAdressVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    _btnArr = [NSMutableArray array];
    self.navigationItem.title = @"新增信息";
    self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH-50);
    
    if (self.isPeiSong)
    {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 200)];
        _headerView.backgroundColor = [UIColor whiteColor];
        self.tableView.tableHeaderView = _headerView;
        
        _nameView = [[LxmLabelTextFieldView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 50)];
        _nameView.labStr = @"联系人";
        _nameView.tf.placeholder = @"请输入姓名";
        [_headerView addSubview:_nameView];
        
        _phoneView = [[LxmLabelTextFieldView alloc] initWithFrame:CGRectMake(0, 50, ScreenW, 50)];
        _phoneView.labStr = @"联系方式";
        _phoneView.tf.placeholder = @"请输入联系方式";
        [_headerView addSubview:_phoneView];
        
        _addressView = [[LxmLabelTextFieldView alloc] initWithFrame:CGRectMake(0, 100, ScreenW, 50)];
        _addressView.labStr = @"配送地址";
        _addressView.tf.placeholder = @"请输入配送地址";
        [_headerView addSubview:_addressView];
        
        _sexView = [[UIView alloc] initWithFrame:CGRectMake(0, 150, ScreenW, 50)];
        [_headerView addSubview:_sexView];
        
        UILabel * lab = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 50, 20)];
        lab.font = [UIFont systemFontOfSize:15];
        lab.textColor = CharacterDarkColor;
        lab.text = @"性别";
        [_sexView addSubview:lab];
        
        UIButton * manBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 0, 80, 50)];
        manBtn.tag = 111;
        manBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [manBtn setTitle:@"先生" forState:UIControlStateNormal];
        [manBtn setTitleColor:CharacterDarkColor forState:UIControlStateNormal];
        [manBtn setImage:[UIImage imageNamed:@"pic_1"] forState:UIControlStateNormal];
        [manBtn setImage:[UIImage imageNamed:@"ico_xuanzhong"] forState:UIControlStateSelected];
        [manBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
        [manBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_sexView addSubview:manBtn];
        [_btnArr addObject:manBtn];
        
        UIButton * womenBtn = [[UIButton alloc] initWithFrame:CGRectMake(200, 0, 80, 50)];
        womenBtn.tag = 112;
        womenBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [womenBtn setTitle:@"女士" forState:UIControlStateNormal];
        [womenBtn setTitleColor:CharacterDarkColor forState:UIControlStateNormal];
        [womenBtn setImage:[UIImage imageNamed:@"pic_1"] forState:UIControlStateNormal];
        [womenBtn setImage:[UIImage imageNamed:@"ico_xuanzhong"] forState:UIControlStateSelected];
        [womenBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
        [womenBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_sexView addSubview:womenBtn];
        [_btnArr addObject:womenBtn];

    }
    else
    {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 100)];
        _headerView.backgroundColor = [UIColor whiteColor];
        self.tableView.tableHeaderView = _headerView;
        
        _nameView = [[LxmLabelTextFieldView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 50)];
        _nameView.labStr = @"联系人";
        _nameView.tf.placeholder = @"请输入姓名";
        [_headerView addSubview:_nameView];
        
        _phoneView = [[LxmLabelTextFieldView alloc] initWithFrame:CGRectMake(0, 50, ScreenW, 50)];
        _phoneView.labStr = @"联系方式";
        _phoneView.tf.placeholder = @"请输入联系方式";
        [_headerView addSubview:_phoneView];
        
//        _sexView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, ScreenW, 50)];
//        [_headerView addSubview:_sexView];
//
        UILabel * lab = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 50, 20)];
        lab.font = [UIFont systemFontOfSize:15];
        lab.textColor = CharacterDarkColor;
        lab.text = @"性别";
        [_sexView addSubview:lab];
        
        UIButton * manBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 0, 80, 50)];
        manBtn.tag = 111;
        manBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [manBtn setTitle:@"先生" forState:UIControlStateNormal];
        [manBtn setTitleColor:CharacterDarkColor forState:UIControlStateNormal];
        [manBtn setImage:[UIImage imageNamed:@"pic_1"] forState:UIControlStateNormal];
        [manBtn setImage:[UIImage imageNamed:@"ico_xuanzhong"] forState:UIControlStateSelected];
        [manBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
        [manBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_sexView addSubview:manBtn];
        [_btnArr addObject:manBtn];
        
        UIButton * womenBtn = [[UIButton alloc] initWithFrame:CGRectMake(200, 0, 80, 50)];
        womenBtn.tag = 112;
        womenBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [womenBtn setTitle:@"女士" forState:UIControlStateNormal];
        [womenBtn setTitleColor:CharacterDarkColor forState:UIControlStateNormal];
        [womenBtn setImage:[UIImage imageNamed:@"pic_1"] forState:UIControlStateNormal];
        [womenBtn setImage:[UIImage imageNamed:@"ico_xuanzhong"] forState:UIControlStateSelected];
        [womenBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
        [womenBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_sexView addSubview:womenBtn];
        [_btnArr addObject:womenBtn];

    }
    
    
    UIView * footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 70)];
    footerView.backgroundColor = BGGrayColor;
    self.tableView.tableFooterView = footerView;
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 30, ScreenW, 40)];
    [btn setBackgroundImage:[UIImage imageNamed:@"yellow"] forState:UIControlStateNormal];
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(confirmAction:) forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [footerView addSubview:btn];
    
}

- (void)confirmAction:(UIButton *)sender {
    if (_nameView.tf.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入姓名"];
        return;
    }
    if (_phoneView.tf.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入收件人电话"];
        return;
    }

    
    NSString * sql = [NSString stringWithFormat:@"insert into kk_lianXiRen (name,phone,userId) values ('%@','%@','%@')",_nameView.tf.text,_phoneView.tf.text,[zkSignleTool shareTool].session_uid];
    
    FMDatabase * db = [FMDBSingle shareFMDB].fd;
    if ([db open]) {
        BOOL insert = [db executeUpdate:sql];
        if (insert) {
            [SVProgressHUD showSuccessWithStatus:@"添加成功"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.navigationController popViewControllerAnimated:YES];
            });
        }
    }else {
        
        [SVProgressHUD showErrorWithStatus:@"数据异常"];
        
        
    }
    
    
    
    
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
}

@end
