//
//  RegisterMessageVC.m
//  gongdi
//
//  Created by 李炎 on 16/8/18.
//  Copyright © 2016年 李炎. All rights reserved.
//

#import "RegisterMessageVC.h"
#import "RegisterViewController.h"

@interface RegisterMessageVC ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic,strong)UITableView *TV;
@property (nonatomic,strong)UIImage *icon;
@property (nonatomic,strong)NSMutableArray *btnArr;
@property (nonatomic,strong)UITextField *textField1, *textField2;
@property (nonatomic,strong)UIImagePickerController *picker;

@property (nonatomic)CGFloat SCREENW,SCREENH;
@end

@implementation RegisterMessageVC
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
    _btnArr = [NSMutableArray array];
    
    UIButton * backItemBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [backItemBtn setBackgroundImage:[UIImage imageNamed:@"ico_fanhui"] forState:UIControlStateNormal];
    [backItemBtn addTarget:self action:@selector(backItemBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backItemBtn];
    
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.navigationItem.title = @"注册";
    [self.view addSubview:self.TV];
    _textField1 = [[UITextField alloc] init];
    _textField2 = [[UITextField alloc] init];
    [self config];
    // Do any additional setup after loading the view.
}
-(void)backItemBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)config{
    CGSize Size = [@"联系方式" getSizeWithMaxSize:CGSizeMake(99, 99) withFontSize:15];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _SCREENW, 273+44+10)];
    headerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //头像按钮
    UIButton *iconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (_icon) {
        [iconBtn setBackgroundImage:_icon forState:UIControlStateNormal];
    }else{
        [iconBtn setBackgroundImage:[UIImage imageNamed:@"pic_shangchuangtp"] forState:UIControlStateNormal];
    }
    iconBtn.layer.cornerRadius = 40;
    iconBtn.layer.masksToBounds = YES;
    iconBtn.frame = CGRectMake((_SCREENW-80)/2, 20, 80, 80);
    [iconBtn addTarget:self action:@selector(changIcon) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:iconBtn];
    //联系方式
    UIView *view2 = [[UIView alloc] init];
    view2.frame = CGRectMake(0, 165, _SCREENW, 44);
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"真实姓名";
    label2.frame = CGRectMake(10, ((44-Size.height)/2), Size.width, Size.height);
    [view2 addSubview:label2];
//    _textField2 = [[UITextField alloc] init];
    _textField2.placeholder = @"请输入您的真实姓名";
//    [_textField2 setValue:CharacterGrayColor forKeyPath:@"_placeholderLabel.textColor"];
    _textField2.frame = CGRectMake(Size.width+30, ((44-Size.height)/2), _SCREENW-Size.width-30, Size.height);
    [view2 addSubview:_textField2];
    //昵称
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 120, _SCREENW, 44)];
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"昵称";
    label1.frame = CGRectMake(10, ((44-Size.height)/2), Size.width, Size.height);
    [view1 addSubview:label1];
//    _textField1 = [[UITextField alloc] init];
    _textField1.placeholder = @"请输入您的昵称";
//    [_textField1 setValue:CharacterGrayColor forKeyPath:@"_placeholderLabel.textColor"];
    _textField1.frame = CGRectMake(Size.width+30, ((44-Size.height)/2), _SCREENW-Size.width-30, Size.height);
    [view1 addSubview:_textField1];
    
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 164+44+2, _SCREENW, 44)];
    view3.backgroundColor = [UIColor whiteColor];
    UILabel *label3 = [[UILabel alloc] init];
    label3.text = @"性别";
    label3.frame = CGRectMake(10, ((44-Size.height)/2), Size.width, Size.height);
    [view3 addSubview:label3];
    
    
    
    UIButton * manBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 0, 80, 50)];
    manBtn.tag = 111;
    manBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [manBtn setTitle:@"先生" forState:UIControlStateNormal];
    [manBtn setTitleColor:CharacterDarkColor forState:UIControlStateNormal];
    [manBtn setImage:[UIImage imageNamed:@"pic_1"] forState:UIControlStateNormal];
    [manBtn setImage:[UIImage imageNamed:@"ico_xuanzhong"] forState:UIControlStateSelected];
    [manBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    [manBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [view3 addSubview:manBtn];
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
    [view3 addSubview:womenBtn];
    [_btnArr addObject:womenBtn];
    
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"注册" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_xiayibu"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 229+44+10, _SCREENW, 44);
    [btn addTarget:self action:@selector(jumpToLogin) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:btn];
    
    _textField1.font = _textField2.font =label3.font= label2.font = label1.font = [UIFont systemFontOfSize:15];
    label1.textColor =label2.textColor= label2.textColor = CharacterDarkColor;
    [headerView addSubview:view1];
    [headerView addSubview:view2];
    [headerView addSubview:view3];
    view1.backgroundColor = view2.backgroundColor = [UIColor whiteColor];
    self.TV.tableHeaderView = headerView;
}
-(void)btnClick:(UIButton *)btn
{
    for (int i=0; i<_btnArr.count; i++)
    {
        UIButton * btn1 = [_btnArr objectAtIndex:i];
        if (btn1==btn)
        {
            btn1.selected = YES;
        }
        else
        {
            btn1.selected = NO;
        }
    }

}
- (void)changIcon{
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"使用相机打开" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _picker = [[UIImagePickerController alloc] init];
        _picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        _picker.delegate = self;
        [self presentViewController:_picker animated:YES completion:nil];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"使用相册打开" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _picker = [[UIImagePickerController alloc] init];
        _picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        _picker.delegate = self;
        [self presentViewController:_picker animated:YES completion:nil];
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [ac addAction:action1];
    [ac addAction:action2];
    [ac addAction:action3];
    
    [self.navigationController presentViewController:ac animated:YES completion:nil];
}

- (void)jumpToLogin{
//    if (!_icon|| _textField1.text.length < 1 || _textField2.text.length < 1) {
//        [SVProgressHUD showErrorWithStatus:@"头像、昵称、联系方式不能为空"];
//    }else if(![NSString isValablePhone:_textField2.text]){
//        [SVProgressHUD showErrorWithStatus:@"手机不合法"];
//    }else{
//        [self canRegister];
//    }
}
//注册
- (void)Toregister{
//    NSData *data = UIImageJPEGRepresentation(_icon, 0.7);
//    NSDictionary *dict = @{@"userName":_userName,@"password":_password,@"nickName":_textField1.text,@"phone":_textField2.text};
//    
//    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
//    [manager POST:[Url Register] parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        [formData appendPartWithFileData:data name:@"headImg" fileName:@"19592645846261359.png" mimeType:@"image/jpeg"];
//    } success:^(NSURLSessionDataTask *task, id responseObject) {
//        //注册成功
//        [SVProgressHUD dismiss];
//        /*
//        RegisterViewController *vc = self.navigationController.viewControllers[self.navigationController.viewControllers.count - 2];
//        vc.isLogin = YES;
//        [self.navigationController popViewControllerAnimated:YES];
//         */
//        [[Accout currentAccout] saveUserName:responseObject[@"result"][@"id"]];
//        //保存账号、存头像、昵称、手机、
//        [[NSUserDefaults standardUserDefaults] setObject:responseObject[@"result"][@"userName"] forKey:@"userName"];
//        [[NSUserDefaults standardUserDefaults] setObject:responseObject[@"result"][@"nickName"] forKey:@"nickName"];
//        [[NSUserDefaults standardUserDefaults] setObject:responseObject[@"result"][@"headImg"] forKey:@"headImg"];
//        [[NSUserDefaults standardUserDefaults] setObject:responseObject[@"result"][@"phone"] forKey:@"phone"];
//        [[NSUserDefaults standardUserDefaults] setObject:responseObject[@"result"][@"authentication"] forKey:@"authentication"];
//        
//        if (!_isCollection) {
//            [self.navigationController popToRootViewControllerAnimated:YES];
//            //发出登录成功的通知
//            [[NSNotificationCenter defaultCenter] postNotificationName:kLoginSuccess object:nil];
////            self.tabBarController.tabBar.hidden = NO;
//            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
//        }else{
//            [self.navigationController popToRootViewControllerAnimated:YES];
//            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
//        }
//        
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        [SVProgressHUD dismiss];
//        [SVProgressHUD showErrorWithStatus:@"注册失败"];
//    }];
}
//判断注册ID是否存在
- (void)canRegister{
//    NSDictionary *dict = @{@"userName":_userName};
//    [SVProgressHUD show];
//    [LxmNetworking networkingGET:[Url canRegister] parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {
//        [self Toregister];
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        [SVProgressHUD showErrorWithStatus:@"用户名已存在"];
//    }];
}
#pragma mark-代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

#pragma mark- picker delegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    //添加到图片中
    _icon = [[UIImage alloc] init];
    _icon = image;
    [self config];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
