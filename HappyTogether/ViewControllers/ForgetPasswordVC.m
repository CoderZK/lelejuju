//
//  ForgetPasswordVC.m
//  gongdi
//
//  Created by 李炎 on 16/8/19.
//  Copyright © 2016年 李炎. All rights reserved.
//

#import "ForgetPasswordVC.h"


@interface ForgetPasswordVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *TV;

@property (nonatomic,strong)UITextField *textField1, *textField2, *textField3, *textField4;
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic)int time;
@property (nonatomic,strong)NSString *phone;

@property (nonatomic,strong)UIButton *btn4;

@property (nonatomic)CGFloat SCREENW,SCREENH;
@end

@implementation ForgetPasswordVC

- (UITableView *)TV{
    if (_TV == nil) {
        _TV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, _SCREENW, _SCREENH) style:UITableViewStyleGrouped];
        _TV.separatorStyle = UITableViewCellSeparatorStyleNone;
        _TV.delegate = self;
        _TV.dataSource = self;
        _TV.scrollEnabled = NO;
        //添加点击取消第一响应手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyboard)];
        tap.cancelsTouchesInView = NO;//设置成NO表示当前控件响应后会传播到其他控件上，默认为YES
        [_TV addGestureRecognizer:tap];
    }
    return _TV;
}
- (void)closeKeyboard{
    [self.TV endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _SCREENW = ScreenW;
    _SCREENH = ScreenH;
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.navigationItem.title = @"忘记密码";
    [self.view addSubview:self.TV];
    [self config];
    // Do any additional setup after loading the view.
}

- (void)config{
    CGSize Size = [@"获取验证码" getSizeWithMaxSize:CGSizeMake(99, 99) withFontSize:15];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _SCREENW, 253)];
    headerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //输出用户
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 10, ScreenW, 44)];
    view1.backgroundColor = [UIColor whiteColor];
    UIImageView *img1 = [[UIImageView alloc] initWithFrame:CGRectMake(9, 9, 25, 25)];
    img1.image = [UIImage imageNamed:@"icon_yonghum"];
    [view1 addSubview:img1];
    _textField1 = [[UITextField alloc] initWithFrame:CGRectMake(44, 0, ScreenW-58-Size.width-20, 44)];
    _textField1.placeholder = @"请输入您账号";
    //        [_textField1 setValue:CharacterGrayColor forKeyPath:@"_placeholderLabel.textColor"];
    [view1 addSubview:_textField1];
    _btn4 = [UIButton  buttonWithType:UIButtonTypeCustom];
    [_btn4 setTitle:@"发送验证码" forState:UIControlStateNormal];
    [_btn4 setTitleColor:YellowColor forState:UIControlStateNormal];
    _btn4.titleLabel.font = [UIFont systemFontOfSize:15];
    _btn4.frame = CGRectMake(ScreenW-Size.width-7-20, (view1.frame.size.height-Size.height)/2, Size.width+20, Size.height);
    _btn4.titleLabel.textAlignment = 1;
    [_btn4 addTarget:self action:@selector(getYanZhengMa) forControlEvents:UIControlEventTouchUpInside];
    [view1 addSubview:_btn4];
    //输入密码
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 100, _SCREENW, 44)];
    view2.backgroundColor = [UIColor whiteColor];
    UIImageView *img2 = [[UIImageView alloc] initWithFrame:CGRectMake(9, 9, 25, 25)];
    img2.image = [UIImage imageNamed:@"icon_mima"];
    [view2 addSubview:img2];
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setImage:[UIImage imageNamed:@"ico_kejian"] forState:UIControlStateNormal];
    btn1.frame = CGRectMake(_SCREENW-34, 9, 25, 25);
    [btn1 addTarget:self action:@selector(changIsKanjian:) forControlEvents:UIControlEventTouchUpInside];
    btn1.tag = 400;
    [view2 addSubview:btn1];
    _textField2 = [[UITextField alloc] initWithFrame:CGRectMake(44, 0, _SCREENW-88, 44)];
    _textField2.placeholder = @"请输入您的密码";
//    [_textField2 setValue:CharacterGrayColor forKeyPath:@"_placeholderLabel.textColor"];
    [view2 addSubview:_textField2];
    //输入验证码
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 55, _SCREENW, 44)];
    view4.backgroundColor = [UIColor whiteColor];
    UIImageView *img4 = [[UIImageView alloc] initWithFrame:CGRectMake(9, 9, 25, 25)];
    img4.image = [UIImage imageNamed:@"icon_yanz"];
    [view4 addSubview:img4];
    _textField4 = [[UITextField alloc] initWithFrame:CGRectMake(44, 0, _SCREENW-58-Size.width, 44)];
    _textField4.placeholder = @"请输入手机验证码";
//    [_textField4 setValue:CharacterGrayColor forKeyPath:@"_placeholderLabel.textColor"];
    [view4 addSubview:_textField4];
    
    _textField1.font = [UIFont systemFontOfSize:15];
    _textField2.font = [UIFont systemFontOfSize:15];
    _textField3.font = [UIFont systemFontOfSize:15];
    _textField4.font = [UIFont systemFontOfSize:15];
    _textField1.textColor = _textField2.textColor = _textField3.textColor = _textField4.textColor = CharacterDarkColor;
    _textField2.secureTextEntry = _textField3.secureTextEntry = YES;
    
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(0, 209, _SCREENW, 44);
    [btn3 setTitle:@"登录" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"btn_xiayibu"] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(nextStep) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:btn3];
    
    [headerView addSubview:view1];
    [headerView addSubview:view2];
    [headerView addSubview:view4];
    self.TV.tableHeaderView = headerView;
}

- (void)changIsKanjian:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        if (sender.tag == 400) {
            _textField2.secureTextEntry = NO;
        }else{
            _textField3.secureTextEntry = NO;
        }
        [sender setImage:[UIImage imageNamed:@"ico_kejian_1"] forState:UIControlStateNormal];
    }else{
        if (sender.tag == 400) {
            _textField2.secureTextEntry = YES;
        }else{
            _textField3.secureTextEntry = YES;
        }
        [sender setImage:[UIImage imageNamed:@"ico_kejian"] forState:UIControlStateNormal];
    }
}

//登录
- (void)nextStep{
//    if (_textField1.text.length < 1 || _textField2.text.length < 1 || _textField3.text.length < 1 || _textField4.text.length < 1) {
//        [SVProgressHUD showErrorWithStatus:@"账号、验证码、密码不能为空"];
//        return;
//    }
//    if (![_textField3.text isEqualToString:_textField2.text]) {
//        [SVProgressHUD showErrorWithStatus:@"两次输入的密码不同"];
//        return;
//    }
//    if (!_phone) {
//        [SVProgressHUD showErrorWithStatus:@"验证码获取中"];
//        return;
//    }
//    
//    NSDictionary *dict = @{@"userName":_textField1.text,@"code":_textField4.text,@"phone":_phone,@"newpassword":_textField2.text};
//    [SVProgressHUD show];
//    [LxmNetworking networkingGET:[Url GetForgetUrl] parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {
//        [SVProgressHUD dismiss];
//        if ([[responseObject objectForKey:@"key"] intValue] != 1)
//        {
//            [SVProgressHUD showErrorWithStatus:responseObject[@"message"]];
//        }
//        else
//        {
//            //保存登录信息
//            RegisterModel *Remodel = [[RegisterModel alloc] initWithDictionary:responseObject[@"result"]];
//            [[Accout currentAccout] saveUserName:Remodel.ID];
//            //保存账号、存头像、昵称、手机、认证
//            [[NSUserDefaults standardUserDefaults] setObject:Remodel.userName forKey:@"userName"];
//            [[NSUserDefaults standardUserDefaults] setObject:Remodel.nickName forKey:@"nickName"];
//            [[NSUserDefaults standardUserDefaults] setObject:Remodel.headImg forKey:@"headImg"];
//            [[NSUserDefaults standardUserDefaults] setObject:Remodel.phone forKey:@"phone"];
//            [[NSUserDefaults standardUserDefaults] setObject:Remodel.authentication forKey:@"authentication"];
//            
//            [self.navigationController popToRootViewControllerAnimated:YES];
//            //发出登录成功的通知
//            [[NSNotificationCenter defaultCenter] postNotificationName:kLoginSuccess object:nil];
////            self.tabBarController.tabBar.hidden = NO;
//            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
//        }
//        
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        [SVProgressHUD showErrorWithStatus:@"登录失败"];
//    }];
}
//获取验证码
- (void)getYanZhengMa{
//    if (_textField1.text.length < 1) {
//        [SVProgressHUD showErrorWithStatus:@"账号不能为空"];
//    }else{
//        [self LoadCode];
//    }
}

-(void)LoadCode
{
    
//    NSDictionary *dict = @{@"userName":_textField1.text};
//    [SVProgressHUD show];
//    [LxmNetworking networkingGET:[Url GetYanzhengUrl] parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {
//        [SVProgressHUD dismiss];
//        if ([[responseObject objectForKey:@"key"] intValue] != 1)
//        {
//            [SVProgressHUD showErrorWithStatus:responseObject[@"message"]];
//        }
//        else
//        {
////            _phone = responseObject[@"result"][@"phone"];
//            _btn4.enabled=NO;
//            [_timer invalidate];
//            _timer=nil;
//            _time=60;
//            _timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTimer1) userInfo:nil repeats:YES];
//        }
//        
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        [SVProgressHUD dismiss];
//        NSLog(@"%@",error);
//    }];
}

-(void)onTimer1
{
//    [_btn4 setTitle:[NSString stringWithFormat:@"获取验证码(%d)",_time--] forState:UIControlStateDisabled];
//    [_btn4 setTitleColor:Gray_COLOR forState:UIControlStateNormal];
//    if (_time<0)
//    {
//        [_timer invalidate];
//        _timer=nil;
//        _btn4.enabled=YES;
//        [_btn4 setTitle:@"获取验证码" forState:UIControlStateDisabled];
//        [_btn4 setTitleColor:GREEN_COLOR forState:UIControlStateNormal];
//    }
}

#pragma mark-代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    _timer = nil;
}

@end
