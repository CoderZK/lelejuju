//
//  RegisterMessageVC.h
//  gongdi
//
//  Created by 李炎 on 16/8/18.
//  Copyright © 2016年 李炎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterMessageVC : BaseViewController
@property (nonatomic,strong)NSString *userName;//用户账号
@property (nonatomic,strong)NSString *password;//密码

@property (nonatomic)BOOL isCollection;
@end
