//
//  LxmLeJuZhiVC.h
//  HappyTogether
//
//  Created by 李晓满 on 16/12/12.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "BaseTableViewController.h"

typedef enum {
    
    LxmLeJuZhiVC_Type_zhi,
    LxmLeJuZhiVC_Type_tong
    
}LxmLeJuZhiVC_Type;
@interface LxmLeJuZhiVC : BaseTableViewController
@property(nonatomic,assign)LxmLeJuZhiVC_Type type;
@end
