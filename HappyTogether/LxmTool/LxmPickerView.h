//
//  LxmPickerView.h
//  ShareGo
//
//  Created by 李晓满 on 16/4/23.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LxmPickerViewDatasource;
@protocol LxmPickerViewDelegate;

@interface LxmPickerView : UIView

@property(nonatomic,weak)id<LxmPickerViewDatasource>dataSource;
@property(nonatomic,weak)id<LxmPickerViewDelegate>delegate;


+(LxmPickerView *)pickerView;

- (NSInteger)selectedRowInComponent:(NSInteger)component;
- (void)reloadAllComponents;
- (void)reloadComponent:(NSInteger)component;
-(void)show;
-(void)dismiss;


@end

/**
 *  /////////////////////////////////////////////////////////////////////////
 */
@protocol LxmPickerViewDatasource <NSObject>
/**
 *  列数
 */
- (NSInteger)numberOfComponentsInPickerView:(LxmPickerView *)pickerView;
/**
 *  某一列的行数
 */
- (NSInteger)pickerView:(LxmPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
@end

@protocol LxmPickerViewDelegate <NSObject>


-(void)LxmPickerViewDelegate:(LxmPickerView *)view btnAtIndex:(NSInteger)index;
/**
 返回标题
 */
- (UIView *)pickerView:(LxmPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view;
/**
 选中的行
 */
-(void)pickerView:(LxmPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;

@end