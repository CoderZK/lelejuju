//
//  ZKMianXiaoXiVC.m
//  HappyTogether
//
//  Created by kunzhang on 16/12/12.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "ZKMianXiaoXiVC.h"
#import "ZKMainXiaoXiCell.h"
#import "YJHomeModel.h"
@interface ZKMianXiaoXiVC ()



/** 数据 */
@property(nonatomic,strong)NSMutableArray<YJHomeModel *> *dataArray;

@end

@implementation ZKMianXiaoXiVC

- (NSMutableArray<YJHomeModel *> *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
   self.navigationItem.title = @"消息";
    
    self.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH);
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    
    
    [self.tableView registerClass:[ZKMainXiaoXiCell class] forCellReuseIdentifier:@"cell"];
    
    //假数据
//    for (int i = 0 ; i < 10 ; i ++) {
//
//        ZKMainXiaoXiModel * model =[[ZKMainXiaoXiModel alloc] init];
//        model.title =  [NSString stringWithFormat:@"系统消息%d",i];
//
//        if (i%2 == 0) {
//
//            model.content =  [NSString stringWithFormat:@"%d吃葡萄不吐葡萄皮,不吃葡萄到吐葡萄皮,一瘸子担了一旦茄子,路上碰到个橛子,橛子绊倒瘸子,瘸子拿了茄子砸了橛子一茄子",i];
//
//        }else {
//             model.content =  [NSString stringWithFormat:@"%d吃葡萄不吐葡萄皮,不吃葡萄到吐葡萄皮",i];
//        }
//
//        [self.dataArray addObject:model];
//
//    }
    
    
    
    
    
    [self getData];
    
    
}

- (void)getData {
    
    NSString * sql = [NSString stringWithFormat:@"select *from kk_news where name = '%@'",[zkSignleTool shareTool].session_uid];
    FMDatabase * db = [FMDBSingle shareFMDB].fd;
    BOOL isOpen = [db open];
    if (isOpen) {
        FMResultSet * result = [db executeQuery:sql];
        while ([result next]) {
            YJHomeModel * model = [[YJHomeModel alloc] init];
            model.title = [result stringForColumn:@"name"];
            model.content = [result stringForColumn:@"content"];
            [self.dataArray addObject:model];
        }
        [self.tableView reloadData];
        
    }else {
        [SVProgressHUD showErrorWithStatus:@"数据异常请稍后再试"];
    }
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    ZKMainXiaoXiCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.titleLB.text = self.dataArray[indexPath.row].title;
    cell.contentLB.text = self.dataArray[indexPath.row].content;
    // cell.nameLB.text = @"fgkodkgfeoprkgkp";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YJHomeModel * model = self.dataArray[indexPath.row];
    NSString * contentStr =  [NSString stringWithFormat:@"%@",model.content];
    
    NSMutableAttributedString * att =[[NSMutableAttributedString alloc] initWithString:contentStr attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]}];
    NSMutableParagraphStyle * para =[[NSMutableParagraphStyle alloc] init];
    para.lineSpacing = 5;
    
    [att addAttribute:NSParagraphStyleAttributeName value:para range:NSMakeRange(0, contentStr.length)];
    
    CGFloat contentH = [att boundingRectWithSize:CGSizeMake(ScreenW - 30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading context:nil].size.height;
    

    return 10 + 20 + 10 + contentH + 10 + 5;
    
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}


//编辑过程中
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView beginUpdates];
    if (editingStyle == UITableViewCellEditingStyleDelete) {

        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.dataArray removeObjectAtIndex:indexPath.row];

    }
    
    
    
    
    [tableView endUpdates];
    
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
}










@end
