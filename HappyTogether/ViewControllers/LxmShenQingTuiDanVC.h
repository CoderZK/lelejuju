//
//  LxmShenQingTuiDanView.h
//  HappyTogether
//
//  Created by 李晓满 on 16/12/8.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "BaseTableViewController.h"
typedef enum {
    
    LxmShenQingTuiDanVC_tuidan,
    LxmShenQingTuiDanVC_kefuCenter
    
}LxmShenQingTuiDanVC_Type;
@interface LxmShenQingTuiDanVC : BaseTableViewController
@property(nonatomic,assign)LxmShenQingTuiDanVC_Type type;
@end
