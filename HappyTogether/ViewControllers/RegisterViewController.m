//
//  RegisterViewController.m
//  gongdi
//
//  Created by 李炎 on 16/8/18.
//  Copyright © 2016年 李炎. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterMessageVC.h"
#import "ForgetPasswordVC.h"

@interface RegisterViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *TV;

@property (nonatomic,strong)UITextField *textField1, *textField3, *textField4;
@property (nonatomic,strong)UIButton *btn4;
@end

@implementation RegisterViewController
- (UITableView *)TV{
    if (_TV == nil) {
        _TV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH) style:UITableViewStyleGrouped];
        _TV.separatorStyle = UITableViewCellSeparatorStyleNone;
        _TV.delegate = self;
        _TV.dataSource = self;
        _TV.scrollEnabled = NO;
    }
    return _TV;
}

- (void)viewWillAppear:(BOOL)animated{
    [self config];
    if (_isLogin) {
        self.navigationItem.title = @"登录";
        self.navigationItem.rightBarButtonItem.title = @"注册";
    }else{
        self.navigationItem.title = @"注册";
        self.navigationItem.rightBarButtonItem.title = @"登录";
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.TV];
    [self configRight];
    
    
    UIButton *cha = [UIButton buttonWithType:UIButtonTypeCustom];
    [cha setImage:[UIImage imageNamed:@"cha"] forState:UIControlStateNormal];
    cha.frame = CGRectMake(10, [UIApplication sharedApplication].statusBarFrame.size.height + 2, 40, 40);
    [cha addTarget:self action:@selector(cha) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cha];
    
    //添加左键点击后退
    UIButton *left = [UIButton buttonWithType:UIButtonTypeCustom];
    [left setImage:[UIImage imageNamed:@"ico_fanhui"] forState:UIControlStateNormal];
    left.frame = CGRectMake(0, 0, 25, 25);
    [left addTarget:self action:@selector(backTo) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:left];
    
    //添加点击取消第一响应手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyboard)];
    tap.cancelsTouchesInView = NO;//设置成NO表示当前控件响应后会传播到其他控件上，默认为YES
    [_TV addGestureRecognizer:tap];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    // Do any additional setup after loading the view.
}

- (void)cha {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//取消登录注册
- (void)backTo{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)configRight{
    self.navigationItem.title = @"注册";
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(changMode)];
    right.tintColor = CharacterDarkColor;
    self.navigationItem.rightBarButtonItem = right;
}

- (void)changMode{
    _isLogin = !_isLogin;
    if (_isLogin) {
        self.navigationItem.title = @"登录";
        self.navigationItem.rightBarButtonItem.title = @"注册";
    }else{
        self.navigationItem.title = @"注册";
        self.navigationItem.rightBarButtonItem.title = @"登录";
    }
        [self config];
}

- (void)config{
    
    CGSize Size = [@"获取验证码" getSizeWithMaxSize:CGSizeMake(99, 99) withFontSize:15];
    if (!_isLogin) {//加载注册
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 240)];
        headerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        //输出用户
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 60, ScreenW, 44)];
        view1.backgroundColor = [UIColor whiteColor];
        UIImageView *img1 = [[UIImageView alloc] initWithFrame:CGRectMake(9, 9, 25, 25)];
        img1.image = [UIImage imageNamed:@"icon_yonghum"];
        [view1 addSubview:img1];
        _textField1 = [[UITextField alloc] initWithFrame:CGRectMake(44, 0, ScreenW-58-Size.width-20, 44)];
        _textField1.placeholder = @"请输入您账号";
//        [_textField1 setValue:CharacterGrayColor forKeyPath:@"_placeholderLabel.textColor"];
        [view1 addSubview:_textField1];
        _btn4 = [UIButton  buttonWithType:UIButtonTypeCustom];
//        [_btn4 setTitle:@"发送验证码" forState:UIControlStateNormal];
//        [_btn4 setTitleColor:YellowColor forState:UIControlStateNormal];
//        _btn4.titleLabel.font = [UIFont systemFontOfSize:15];
//        _btn4.frame = CGRectMake(ScreenW-Size.width-7-20, (view1.frame.size.height-Size.height)/2, Size.width+20, Size.height);
//        _btn4.titleLabel.textAlignment = 1;
//        [_btn4 addTarget:self action:@selector(getYanZhengMa) forControlEvents:UIControlEventTouchUpInside];
//        [view1 addSubview:_btn4];
        //输入密码
//        UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 55, ScreenW, 44)];
//        view2.backgroundColor = [UIColor whiteColor];
//        UIImageView *img4 = [[UIImageView alloc] initWithFrame:CGRectMake(9, 9, 25, 25)];
//        img4.image = [UIImage imageNamed:@"icon_yanz"];
//        [view2 addSubview:img4];
//        _textField4 = [[UITextField alloc] initWithFrame:CGRectMake(44, 0, ScreenW-44, 44)];
//        _textField4.placeholder = @"请输入手机验证码";
////        [_textField4 setValue:CharacterGrayColor forKeyPath:@"_placeholderLabel.textColor"];
//        [view2 addSubview:_textField4];
        //再次输入密码
        UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 130, ScreenW, 44)];
        view3.backgroundColor = [UIColor whiteColor];
        UIImageView *img3 = [[UIImageView alloc] initWithFrame:CGRectMake(9, 9, 25, 25)];
        img3.image = [UIImage imageNamed:@"icon_mima"];
        [view3 addSubview:img3];
        UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn2 setImage:[UIImage imageNamed:@"ico_kejian"] forState:UIControlStateNormal];
        btn2.frame = CGRectMake(ScreenW-34, 9, 25, 25);
        [btn2 addTarget:self action:@selector(changIsKanjian:) forControlEvents:UIControlEventTouchUpInside];
        btn2.tag = 401;
        [view3 addSubview:btn2];
        _textField3 = [[UITextField alloc] initWithFrame:CGRectMake(44, 0, ScreenW-88, 44)];
        _textField3.placeholder = @"请输入您的密码";
//        [_textField3 setValue:CharacterGrayColor forKeyPath:@"_placeholderLabel.textColor"];
        [view3 addSubview:_textField3];
        
        _textField1.font = [UIFont systemFontOfSize:15];
//        _textField2.font = [UIFont systemFontOfSize:15];
        _textField3.font = [UIFont systemFontOfSize:15];
        _textField4.font = [UIFont systemFontOfSize:15];
        _textField1.textColor =  _textField3.textColor = _textField4.textColor = CharacterDarkColor;
        _textField3.secureTextEntry = YES;
        
        UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn3.frame = CGRectMake(0, 200, ScreenW, 44);
        [btn3 setTitle:@"登录注册" forState:UIControlStateNormal];
        [btn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn3 setBackgroundImage:[UIImage imageNamed:@"btn_xiayibu"] forState:UIControlStateNormal];
        [btn3 addTarget:self action:@selector(nextStep) forControlEvents:UIControlEventTouchUpInside];
        [headerView addSubview:btn3];
        
        [headerView addSubview:view1];
//        [headerView addSubview:view2];
        [headerView addSubview:view3];
        self.TV.tableHeaderView = headerView;
    }else{//加载登录
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 187)];
        headerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        //输出用户
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 10, ScreenW, 44)];
        view1.backgroundColor = [UIColor whiteColor];
        UIImageView *img1 = [[UIImageView alloc] initWithFrame:CGRectMake(9, 9, 25, 25)];
        img1.image = [UIImage imageNamed:@"icon_yonghum"];
        [view1 addSubview:img1];
        _textField1 = [[UITextField alloc] initWithFrame:CGRectMake(44, 0, ScreenW-44, 44)];
        _textField1.placeholder = @"请输入您账号";
//        [_textField1 setValue:CharacterGrayColor forKeyPath:@"_placeholderLabel.textColor"];
        _textField1.font = [UIFont systemFontOfSize:15];
        [view1 addSubview:_textField1];
        //输入密码
        UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 55, ScreenW, 44)];
        view2.backgroundColor = [UIColor whiteColor];
        UIImageView *img2 = [[UIImageView alloc] initWithFrame:CGRectMake(9, 9, 25, 25)];
        img2.image = [UIImage imageNamed:@"icon_mima"];
        [view2 addSubview:img2];
        UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn1 setImage:[UIImage imageNamed:@"ico_kejian"] forState:UIControlStateNormal];
        btn1.frame = CGRectMake(ScreenW-34, 9, 25, 25);
        [btn1 addTarget:self action:@selector(changIsKanjian:) forControlEvents:UIControlEventTouchUpInside];
        btn1.tag = 400;
        [view2 addSubview:btn1];
//        _textField2 = [[UITextField alloc] initWithFrame:CGRectMake(44, 0, ScreenW-88, 44)];
//        _textField2.placeholder = @"请输入您的密码";
//        [_textField2 setValue:CharacterGrayColor forKeyPath:@"_placeholderLabel.textColor"];
//        _textField2.font = [UIFont systemFontOfSize:15];
//        _textField2.secureTextEntry = YES;
//        [view2 addSubview:_textField2];
        //忘记密码
        UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
//        CGSize btn2Size = [@"忘记密码？" getSizeOfStringWihtFont:12 addMaxSize:CGSizeMake(99, 99)];
        CGSize btn2Size = [@"忘记密码？" getSizeWithMaxSize:CGSizeMake(99, 99) withFontSize:12];
        btn2.frame = CGRectMake(ScreenW-btn2Size.width-7, 110, btn2Size.width, btn2Size.height);
        [btn2 setTitleColor:CharacterGrayColor forState:UIControlStateNormal];
        [btn2 setTitle:@"忘记密码？" forState:UIControlStateNormal];
        btn2.titleLabel.font = [UIFont systemFontOfSize:12];
        [btn2 addTarget:self action:@selector(forgetPassword) forControlEvents:UIControlEventTouchUpInside];
        [headerView addSubview:btn2];
        
        UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn3.frame = CGRectMake(0, 143, ScreenW, 44);
        [btn3 setTitle:@"登录" forState:UIControlStateNormal];
        [btn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn3 setBackgroundImage:[UIImage imageNamed:@"btn_xiayibu"] forState:UIControlStateNormal];
        [btn3 addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
        [headerView addSubview:btn3];
        
        [headerView addSubview:view1];
        [headerView addSubview:view2];
        self.TV.tableHeaderView = headerView;
    }
}

- (void)changIsKanjian:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        if (sender.tag == 400) {
//            _textField2.secureTextEntry = NO;
        }else{
            _textField3.secureTextEntry = NO;
        }
        [sender setImage:[UIImage imageNamed:@"ico_kejian_1"] forState:UIControlStateNormal];
    }else{
        if (sender.tag == 400) {
//            _textField2.secureTextEntry = YES;
        }else{
            _textField3.secureTextEntry = YES;
        }
        [sender setImage:[UIImage imageNamed:@"ico_kejian"] forState:UIControlStateNormal];
    }
}

//注册下一步
- (void)nextStep{
    
   
    
    
    if (self.textField1.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入用户名"];
        return;
    }
    if (self.textField3.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        return;
    }
    
    [self loginOrRegist];
    
    
//    if (_textField1.text.length < 1 || _textField2.text.length < 1 || _textField3.text.length < 1) {
//        [SVProgressHUD showErrorWithStatus:@"账号或密码为空"];
//    }else if (![_textField2.text isEqualToString:_textField3.text]) {
//        [SVProgressHUD showErrorWithStatus:@"两次密码输入不同"];
//    }else{
//        [self canRegister];
//    }
}

- (void)loginOrRegist {
    
    FMDatabase * db = [FMDBSingle shareFMDB].fd;
    BOOL isOpen = [db open];
    if (isOpen) {
        NSString * sql = [NSString stringWithFormat:@"select *from 'kk_users' where name = %@ ",self.textField1.text];
        
        FMResultSet * result = [db executeQuery:sql];
        BOOL isOK = NO;
        while ([result next]) {
            
            NSLog(@"%@\n",@"成功!!!!!");
            
            
            NSString * name = [result stringForColumn:@"name"];
            NSString * passWord = [result stringForColumn:@"passWord"];
            if ([name isEqualToString:self.textField1.text]) {
                isOK = YES;
                if ([passWord isEqualToString:self.textField3.text]) {
                    [SVProgressHUD showSuccessWithStatus:@"登录成功"];
                    [zkSignleTool shareTool].isLogin = YES;
                    [zkSignleTool shareTool].session_uid = self.textField1.text;
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [self dismissViewControllerAnimated:YES completion:nil];
                    });
                    
                    break;
                }else {
                    [SVProgressHUD showErrorWithStatus:@"密码错误"];
                    break;
                    
                }
                
            }
        }
        
        
        if (!isOK) {
            NSString * sql = [NSString stringWithFormat:@"insert into kk_users (name,passWord) values (%@,%@)",self.textField1.text,self.textField3.text];
            BOOL insert =  [db executeUpdate:sql];
            if (insert) {
                [SVProgressHUD showSuccessWithStatus:@"登录成功"];
                [zkSignleTool shareTool].session_uid = self.textField1.text;
                [zkSignleTool shareTool].isLogin = YES;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self dismissViewControllerAnimated:YES completion:nil];
                });
                
            }else {
                [SVProgressHUD showErrorWithStatus:@"服务异常"];
            }
        }
    }else {
        [SVProgressHUD showErrorWithStatus:@"数据库异常请稍后再试"];
    }
    
    [db close];
    
    
    
    
}




//判断注册ID是否存在
- (void)canRegister{
//    NSDictionary *dict = @{@"userName":_textField1.text};
//    [SVProgressHUD show];
//    [LxmNetworking networkingGET:[Url canRegister] parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {
//        [SVProgressHUD dismiss];
//        if ([responseObject[@"key"] integerValue] == 1) {
            RegisterMessageVC *registerVC = [[RegisterMessageVC alloc] init];
            registerVC.userName = _textField1.text;
            registerVC.password = _textField3.text;
            registerVC.isCollection = _isCollection;
            [self.navigationController pushViewController:registerVC animated:YES];
//        }else{
//            [SVProgressHUD showErrorWithStatus:responseObject[@"message"]];
//        }
//        
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        [SVProgressHUD showErrorWithStatus:@"注册失败"];
//    }];
}
//登录 RegisterModel
- (void)login{
//    if (_textField1.text.length < 1 || _textField2.text.length < 1) {
//        [SVProgressHUD showErrorWithStatus:@"账号密码不能为空"];
//    }else{
//        [self canLogin];
//    }
}

- (void)canLogin{
//    [SVProgressHUD show];
//    NSDictionary *dict = @{@"userName":_textField1.text,@"password":_textField2.text};
//    [LxmNetworking networkingGET:[Url GetloginUrl] parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {
//        [SVProgressHUD dismiss];
//        if ([responseObject[@"key"] integerValue] == 1) {
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
//            if (!_isCollection) {
//                [self.navigationController popToRootViewControllerAnimated:YES];
//                //发出登录成功的通知
//                [[NSNotificationCenter defaultCenter] postNotificationName:kLoginSuccess object:nil];
////                self.tabBarController.tabBar.hidden = NO;
//                [self.navigationController dismissViewControllerAnimated:YES completion:nil];
//            }else{
//                [self.navigationController popToRootViewControllerAnimated:YES];
//                [self.navigationController dismissViewControllerAnimated:YES completion:nil];
//            }
//            
//        }else{
//            [SVProgressHUD showErrorWithStatus:responseObject[@"message"]];
//        }
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        [SVProgressHUD showErrorWithStatus:@"登录失败"];
//    }];
}

//忘记密码
- (void)forgetPassword{
    ForgetPasswordVC *vc = [[ForgetPasswordVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)closeKeyboard{
    [self.TV endEditing:YES];
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

@end
