//
//  LxmOrderStateVC.h
//  HappyTogether
//
//  Created by 李晓满 on 16/12/12.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "BaseTableViewController.h"
typedef enum {
    
    LxmOrderStateVC_Type_weiPay = 1,
    LxmOrderStateVC_Type_weiJiHuo = 2,
    LxmOrderStateVC_Type_weiUse = 3,
    LxmOrderStateVC_Type_peiSong = 4,
    LxmOrderStateVC_Type_overOrder = 5
    
}LxmOrderStateVC_Type;
@interface LxmOrderStateVC : BaseTableViewController
@property(nonatomic,assign)LxmOrderStateVC_Type type;
@property(nonatomic,weak)UIViewController * preVC;
@end
