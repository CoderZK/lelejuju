//
//  ZKFaQingJianVC.m
//  HappyTogether
//
//  Created by kunzhang on 16/12/12.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "ZKFaQingJianVC.h"
#import "LxmLabelTextFieldView.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
@interface ZKFaQingJianVC ()<AMapLocationManagerDelegate,MAMapViewDelegate>

/** 地图 */
@property(nonatomic , strong)MAMapView *mapView;

/** 定位 */
@property(nonatomic , strong)AMapLocationManager *locationManager;


/** 被邀请人姓名 */
@property(nonatomic , strong)LxmLabelTextFieldView *beiYaoNameLF;
/** 请客人的名字 */
@property(nonatomic , strong)LxmLabelTextFieldView *YaoQingRenNameLF;
/** 请客时间 */
@property(nonatomic , strong)LxmLabelTextFieldView *timeLF;
/** 包厢号 */
@property(nonatomic , strong)LxmLabelTextFieldView *baoxiangNumberLF;
/** 九点名字 */
@property(nonatomic , strong)LxmLabelTextFieldView *jiuDianNameLF;
/**地点*/
@property(nonatomic , strong)LxmLabelTextFieldView *addressLF;
/** 地图的高 */
@property(nonatomic , assign)CGFloat  MapHeight;

/** 请求字典 */
@property(nonatomic , strong)NSMutableDictionary *requestDic;

/** 分享界面的背景View */
@property(nonatomic , strong)UIView *backView;


//本地经纬度
@property(nonatomic,assign)CGFloat longitude;
@property(nonatomic,assign)CGFloat latitude;


@end

@implementation ZKFaQingJianVC

-(NSMutableDictionary *)requestDic {
    if (_requestDic == nil) {
        _requestDic = [NSMutableDictionary dictionary];
    }
    return _requestDic;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    self.mapView.mapType = MAMapTypeStandard;
    [self.locationManager stopUpdatingLocation];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title = @"请柬";

    //创建,初始化
    [self setAllLF];
    
    //分享界面
    [self setFenXiangJieMain];
    
    
}

//
- (void)setAllLF {
    
    self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH-50);
    self.tableView.backgroundColor =[UIColor groupTableViewBackgroundColor];
    UIView * headView =[[UIView alloc] initWithFrame:CGRectMake(0,0, ScreenW, ScreenH)];
    headView.backgroundColor =[UIColor groupTableViewBackgroundColor];
    self.tableView.tableHeaderView = headView;
    
    //地图的高度
    self.MapHeight = 200;
    //此处地图初始化
    self.mapView =[[MAMapView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, self.MapHeight)];
    self.mapView.mapType = MAMapTypeStandard;
    self.mapView.delegate = self;
    self.mapView.showsScale = NO;
    self.mapView.showsCompass = NO;
    [headView addSubview:self.mapView];
    
    self.locationManager =[[AMapLocationManager alloc] init];
    self.locationManager.delegate = self;

    [self.locationManager startUpdatingLocation];
//    self.mapView.centerCoordinate = CLLocationCoordinate2DMake(39.907728, 116.397968);
//    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(39.907728, 116.397968) animated:YES];

    self.mapView.showsUserLocation = YES;
    
    //   定位超时时间，最低2s，此处设置为10s
    _locationManager.locationTimeout = 10;
    //   逆地理请求超时时间，最低2s，此处设置为10s
    _locationManager.reGeocodeTimeout = 10;
    
    
//    UIButton * butto
    
    
    
    //lf 的高度
    CGFloat LFHeight = 50;
   
    //被邀请人
    self.beiYaoNameLF =[[LxmLabelTextFieldView alloc] initWithFrame:CGRectMake(0, self.MapHeight, ScreenW, LFHeight)];
    self.beiYaoNameLF.backgroundColor =[UIColor whiteColor];
    self.beiYaoNameLF.labStr = @"被邀请人\t";
    self.beiYaoNameLF.titleLabel.textColor = CharacterGrayColor;
    self.beiYaoNameLF.tf.placeholder= @"请填写被邀请人名字";
    [headView addSubview:self.beiYaoNameLF];
    
    //邀请人
    self.YaoQingRenNameLF =[[LxmLabelTextFieldView alloc] initWithFrame:CGRectMake(0, self.MapHeight + LFHeight, ScreenW, LFHeight)];
    self.YaoQingRenNameLF.backgroundColor =[UIColor whiteColor];
    self.YaoQingRenNameLF.labStr = @"请客人    \t";
    self.YaoQingRenNameLF.titleLabel.textColor = CharacterGrayColor;
    self.YaoQingRenNameLF.tf.placeholder= @"请填写请客人名字";
    [headView addSubview:self.YaoQingRenNameLF];
    //时间
    self.timeLF =[[LxmLabelTextFieldView alloc] initWithFrame:CGRectMake(0, self.MapHeight+ 2*LFHeight, ScreenW, LFHeight)];
    self.timeLF.backgroundColor =[UIColor whiteColor];
    self.timeLF.labStr = @"请客时间\t";
    self.timeLF.titleLabel.textColor = CharacterGrayColor;
    self.timeLF.tf.placeholder= @"请填写请客时间";
    [headView addSubview:self.timeLF];
    //包厢
    self.baoxiangNumberLF =[[LxmLabelTextFieldView alloc] initWithFrame:CGRectMake(0, self.MapHeight + 3*LFHeight, ScreenW, LFHeight)];
    self.baoxiangNumberLF.backgroundColor =[UIColor whiteColor];
    self.baoxiangNumberLF.labStr = @"包厢号    \t";
    self.baoxiangNumberLF.titleLabel.textColor = CharacterGrayColor;
    self.baoxiangNumberLF.tf.placeholder= @"请填写包厢号";
    [headView addSubview:self.baoxiangNumberLF];
    
    //酒店名
    self.jiuDianNameLF =[[LxmLabelTextFieldView alloc] initWithFrame:CGRectMake(0, self.MapHeight+ LFHeight*4, ScreenW, LFHeight)];
    self.jiuDianNameLF.backgroundColor =[UIColor whiteColor];
    self.jiuDianNameLF.labStr = @"酒店名称\t";
    self.jiuDianNameLF.titleLabel.textColor = CharacterGrayColor;
    self.jiuDianNameLF.tf.placeholder= @"请填写酒店名称";
    [headView addSubview:self.jiuDianNameLF];
    
    //地址
    self.addressLF =[[LxmLabelTextFieldView alloc] initWithFrame:CGRectMake(0, self.MapHeight + 5* LFHeight, ScreenW, LFHeight)];
    self.addressLF.backgroundColor =[UIColor whiteColor];
    self.addressLF.labStr = @"酒店地址\t";
    self.addressLF.titleLabel.textColor = CharacterGrayColor;
    self.addressLF.tf.placeholder= @"请填写酒店地址";
    [headView addSubview:self.addressLF];
    
    UIView * fenxiangView =[[UIView alloc] initWithFrame:CGRectMake(0, ScreenH - 50, ScreenW, 50)];
    fenxiangView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:fenxiangView];
    
    UIButton * fenxiangBT =[UIButton new];
    fenxiangBT.frame = CGRectMake(40, 5, ScreenW - 80, 30);
    [fenxiangBT setTitle:@"确认分享" forState:UIControlStateNormal];
    fenxiangBT.titleLabel.font = [UIFont systemFontOfSize:14];
    [fenxiangBT setBackgroundImage:[UIImage imageNamed:@"yellow"] forState:UIControlStateNormal];
    [fenxiangBT addTarget:self action:@selector(fenxiangAction:) forControlEvents:UIControlEventTouchUpInside];
    fenxiangBT.layer.cornerRadius = 5;
    fenxiangBT.clipsToBounds = YES;
    [fenxiangView addSubview:fenxiangBT];
    
    
}



//点击分享
- (void)fenxiangAction:(UIButton *)button {
    //获取请求字典
    [self getReqDic];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.backView.mj_y = 0;
    }];
    
    
}

//获取请求字典
- (void)getReqDic {
    
    
    
    
    
    
    
    
}

//
- (void)setFenXiangJieMain {
    self.backView =[[UIView alloc] initWithFrame:CGRectMake(0, ScreenH, ScreenW, ScreenH)];

    self.backView.backgroundColor =[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview:self.backView];
    UITapGestureRecognizer * tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancel)];
    
    [self.backView addGestureRecognizer:tap];
    
    
    
    UIView * graView =[[UIView alloc] initWithFrame:CGRectMake(0, ScreenH - 150, ScreenW, 150)];
    graView.backgroundColor =[UIColor groupTableViewBackgroundColor];
    [self.backView addSubview:graView];
    
    CGFloat btWidth = 60;
    CGFloat spaceWidth = (ScreenW - 3 * btWidth) / 4;
    
    NSArray * array =@[@"微信好友",@"手机QQ",@"新浪微博"];
    
    NSArray * picArray = @[@"pic_weixin",@"pic_qq",@"pic_weibo"];
    
    for (int i = 0 ; i < 3; i++) {
        
        UIButton * Bt =[UIButton new];
        Bt.frame = CGRectMake(spaceWidth *(1+i) + btWidth * i , 30, btWidth, btWidth);
        [Bt setBackgroundImage:[UIImage imageNamed:picArray[i]] forState:UIControlStateNormal];
        Bt.tag = 100+i;
        [Bt addTarget:self action:@selector(queRenAction:) forControlEvents:UIControlEventTouchUpInside];
        
        //创建lable
        UILabel * lable =[[UILabel alloc] initWithFrame:CGRectMake(Bt.mj_x, btWidth + 20 +20, btWidth, 20)];
        lable.textColor = CharacterDarkColor;
        lable.font =[UIFont systemFontOfSize:12];
        lable.textAlignment = NSTextAlignmentCenter;
        lable.text = array[i];
        [graView addSubview:Bt];
        [graView addSubview:lable];
        
    }
    
    
    
}

//分享到的位置
- (void)queRenAction:(UIButton *)button  {
    
    NSLog(@"%ld",(long)button.tag);
    
    if (button.tag == 100) {
        //点击的 是微信好友分享
        
        
    } else if (button.tag == 101) {
        //点击的是QQ好友分享
        
    }else {
        //点击的是微博分享
        
        
    }
 
}

- (void)cancel {
    
    [UIView animateWithDuration:0.25 animations:^{
        self.backView.mj_y = ScreenH;
        
        
        
    }];
    
}

/**
 *  当定位发生错误时，会调用代理的此方法。
 *
 *  @param manager 定位 AMapLocationManager 类。
 *  @param error 返回的错误，参考 CLError 。
 */
- (void)amapLocationManager:(AMapLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"\n%@",error);
    
    
}

/**
 *  连续定位回调函数
 *
 *  @param manager 定位 AMapLocationManager 类。
 *  @param location 定位结果。
 */
- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location {
    
    NSLog(@"\n%@",location);
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
