//
//  LxmSelectPeopleVC.h
//  HappyTogether
//
//  Created by 李晓满 on 16/12/6.
//  Copyright © 2016年 李晓满. All rights reserved.
//



#import "BaseTableViewController.h"
typedef enum{
    LxmSelectPeopleVC_Type_qingbaishi,
    LxmSelectPeopleVC_Type_laidianjiu
}LxmSelectPeopleVC_Type;
@interface LxmSelectPeopleVC : BaseTableViewController
@property(nonatomic,assign)LxmSelectPeopleVC_Type type;

@property(nonatomic , copy)void(^sendLianXiRenBlock)(NSString *str);

@end
