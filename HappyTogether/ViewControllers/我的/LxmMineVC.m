//
//  LxmMineVC.m
//  HappyTogether
//
//  Created by 李晓满 on 16/12/8.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "LxmMineVC.h"
#import "LxmSettingVC.h"
#import "LxmMyOrderVC.h"
#import "LxmLeJuZhiVC.h"
#import "LxmShenQingTuiDanVC.h"
#import "ZKMianXiaoXiVC.h"

@interface LxmMineVC ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UINavigationBar * _myNavibar;
    UIImageView * _topBgImageView;
    UIButton *_headerImgBtn;
    UILabel * _nameLabel;
    UILabel * _jifenLabel;
    UIImagePickerController *_picker;
    UIImage *_headerImg;
}
@end

@implementation LxmMineVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH);
    self.tableView.separatorColor = BGGrayColor;
    
    UINavigationBar * myNavibar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    _myNavibar = myNavibar;
    [myNavibar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    myNavibar.shadowImage = [[UIImage alloc] init];
    [self.view addSubview:myNavibar];
    
    UINavigationItem * item = [[UINavigationItem alloc] init];
    myNavibar.items = @[item];
    
    
    UIButton *leftBtn=[[UIButton alloc] initWithFrame:CGRectMake(0,0, 25, 25)];
    leftBtn.tag = 100;
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"ico_fanhui_1"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    item.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    UIButton *rightBtn=[[UIButton alloc] initWithFrame:CGRectMake(0,0, 25, 25)];
    rightBtn.tag = 101;
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"ico_xiaoxi"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    item.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    [self initTableView];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y<=0)
    {
        CGRect rect = _topBgImageView.frame;
        rect.size.height = self.tableView.tableHeaderView.bounds.size.height-scrollView.contentOffset.y;
        rect.size.width = (rect.size.height)*self.tableView.tableHeaderView.bounds.size.width/(self.tableView.tableHeaderView.bounds.size.width*0.5);
        rect.origin.y = scrollView.contentOffset.y;
        rect.origin.x = (self.tableView.tableHeaderView.bounds.size.width-rect.size.width)*0.5;
        _topBgImageView.frame = rect;
    }
}

-(void)initTableView
{
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 230)];
    headerView.backgroundColor = BGGrayColor;
    
    self.tableView.tableHeaderView = headerView;
    
    _topBgImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, headerView.bounds.size.width, headerView.bounds.size.height)];
    _topBgImageView.image=[UIImage imageNamed:@"bg_wd"];
    [headerView addSubview:_topBgImageView];
    
    
    _headerImgBtn=[[UIButton alloc] initWithFrame:CGRectMake(headerView.bounds.size.width*0.5-30, headerView.bounds.size.height*0.5-20-10, 60, 60)];
    
    _headerImgBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    _headerImgBtn.layer.cornerRadius = 30;
    _headerImgBtn.layer.borderWidth = 2;
    _headerImgBtn.layer.masksToBounds = YES;
    [_headerImgBtn setBackgroundImage:[UIImage imageNamed:@"pic_2"] forState:UIControlStateNormal];
//    [_headerImgBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:[LxmURLDefine getImgUrlFromInfo:_model.user_pic]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"touxiang"] options:SDWebImageRetryFailed];
    [_headerImgBtn addTarget:self action:@selector(headerImgBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:_headerImgBtn];
    
    
    UILabel * nameLab = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_headerImgBtn.frame)+5, ScreenW, 20)];
    nameLab.text = @"";
    nameLab.shadowColor = [UIColor darkGrayColor];
    nameLab.shadowOffset = CGSizeMake(0, 1);
    nameLab.font = [UIFont systemFontOfSize:14];
    nameLab.textColor = [UIColor whiteColor];
    nameLab.textAlignment = 1;
    [headerView addSubview:nameLab];
    _nameLabel = nameLab;
    
    UILabel * phoneLab = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_headerImgBtn.frame)+5+20, ScreenW, 20)];
    phoneLab.text = [zkSignleTool shareTool].session_uid;
    phoneLab.shadowColor = [UIColor darkGrayColor];
    phoneLab.shadowOffset = CGSizeMake(0, 1);
    phoneLab.font = [UIFont systemFontOfSize:14];
    phoneLab.textColor = [UIColor whiteColor];
    phoneLab.textAlignment = 1;
    [headerView addSubview:phoneLab];
    
}

-(void)headerImgBtnClick
{
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

#pragma mark- picker delegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    //添加到图片中
    _headerImg = [[UIImage alloc] init];
    _headerImg = image;
    [_headerImgBtn setBackgroundImage:image forState:UIControlStateNormal];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2)
    {
        return 2;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell)
        {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            UIButton * leftViewBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, ScreenW * 0.5-0.25, 100)];
            leftViewBtn.tag = 100;
            [leftViewBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:leftViewBtn];
            
            UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(ScreenW * 0.5-0.25, 0, 0.5, 100)];
            lineView.backgroundColor = BGGrayColor;
            [cell addSubview:lineView];
            
            UILabel *leftLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, ScreenW * 0.5-0.25, 40)];
            leftLab.text = @"28";
            leftLab.textAlignment = 1;
            leftLab.font = [UIFont systemFontOfSize:30];
            leftLab.textColor = [UIColor colorWithRed:252/201.0 green:179/255.0 blue:0/255.0 alpha:1];
            [leftViewBtn addSubview:leftLab];
            
            UIButton * leftbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 55, ScreenW * 0.5-0.25, 30)];
            [leftbtn setImage:[UIImage imageNamed:@"ico_lejuz"] forState:UIControlStateNormal];
            leftbtn.userInteractionEnabled = NO;
            leftbtn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 5);
            [leftbtn setTitle:@"乐聚值" forState:UIControlStateNormal];
            [leftbtn setTitleColor:CharacterDarkColor forState:UIControlStateNormal];
            leftbtn.titleLabel.font = [UIFont systemFontOfSize:14];
            [leftViewBtn addSubview:leftbtn];
            
            UIButton * rightViewBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenW * 0.5+0.25, 0, ScreenW * 0.5-0.25, 100)];
            rightViewBtn.tag = 101;
            [rightViewBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:rightViewBtn];
            
            UILabel *rightLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, ScreenW * 0.5-0.25, 40)];
            NSString * str1 = @"￥20";
            NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:str1];
            [attri addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, 1)];
            rightLab.textAlignment = 1;
            rightLab.font = [UIFont systemFontOfSize:30];
            rightLab.textColor = [UIColor colorWithRed:252/201.0 green:179/255.0 blue:0/255.0 alpha:1];
            rightLab.attributedText = attri;
            [rightViewBtn addSubview:rightLab];
            
            
            UIButton * rightbtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenW * 0.5+0.25, 55, ScreenW * 0.5-0.25, 30)];
            rightbtn.userInteractionEnabled = NO;
            [rightbtn setImage:[UIImage imageNamed:@"ico_lejut"] forState:UIControlStateNormal];
            rightbtn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 5);
            [rightbtn setTitle:@"乐聚通" forState:UIControlStateNormal];
            [rightbtn setTitleColor:CharacterDarkColor forState:UIControlStateNormal];
            rightbtn.titleLabel.font = [UIFont systemFontOfSize:14];
            [leftViewBtn addSubview:rightbtn];
            
        }
        return cell;
    }
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        UIImageView * accImgView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenW-35, 28, 7, 13)];
        accImgView.image = [UIImage imageNamed:@"lxmcelljiantou"];
        cell.accessoryView = accImgView;
    }
    cell.textLabel.textColor = CharacterDarkColor;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    if (indexPath.section == 1)
    {
        cell.imageView.image = [UIImage imageNamed:@"ico_wddd"];
        cell.textLabel.text = @"我的订单";
    }
    else
    {
        if (indexPath.row == 0)
        {
            cell.imageView.image = [UIImage imageNamed:@"ico_kefuzx"];
            cell.textLabel.text = @"客服中心";
        }
        else
        {
            cell.imageView.image = [UIImage imageNamed:@"ico_wddd-1"];
            cell.textLabel.text = @"设置";
        }
    }
    return cell;
}
-(void)leftBtnClick:(UIButton *)btn
{
    LxmLeJuZhiVC * vc = [[LxmLeJuZhiVC alloc] init];
    if (btn.tag == 100)
    {
        //乐聚值
        vc.type = LxmLeJuZhiVC_Type_zhi;
    }
    else
    {
        //乐聚通
        vc.type = LxmLeJuZhiVC_Type_tong;
    }
    [self.navigationController pushViewController:vc animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 100;
    }
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 2)
    {
        return 0.01;
    }
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0)
    {
        
    }
    else if (indexPath.section == 1)
    {
        //我的订单
        LxmMyOrderVC * vc= [[LxmMyOrderVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else
    {
        if (indexPath.row == 0)
        {
            //客服中心
            LxmShenQingTuiDanVC * vc = [[LxmShenQingTuiDanVC alloc] init];
            vc.type = LxmShenQingTuiDanVC_kefuCenter;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else
        {
            LxmSettingVC * vc = [[LxmSettingVC alloc] initWithTableViewStyle:UITableViewStyleGrouped];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

-(void)btnClick:(UIButton *)btn
{
    if (btn.tag == 100)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        //xiaoxi
        ZKMianXiaoXiVC * VC =[[ZKMianXiaoXiVC alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
       
    }
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

@end
