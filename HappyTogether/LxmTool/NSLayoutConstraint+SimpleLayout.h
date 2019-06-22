//
//  NSLayoutConstraint+SimpleLayout.h
//  Fenxiao
//
//  Created by sny on 15/6/15.
//  Copyright (c) 2015年 sny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (SimpleLayout)
/**
 设置view固定宽度
 */
+(void)layoutSetWitdh:(CGFloat)width forItem:(id)view;
/**
 设置view固定高度
 */
+(void)layoutSetHeight:(CGFloat)height forItem:(id)view;
/**
 设置view固定size
 */
+(void)layoutSetSize:(CGSize)size forItem:(id)view;

/**
 设置view1在view2中心位置
 */
+(void)layoutItem1:(id)view1 centerInItem2:(id)view2;
/**
 设置view1的Y轴在view2中心位置
 */
+(void)layoutItem1:(id)view1 centerYInItem2:(id)view2;
/**
 设置view1的X轴在view2中心位置
 */
+(void)layoutItem1:(id)view1 centerXInItem2:(id)view2;
/**
 view1充满父视图
 */
+(void)layoutItem:(id)view1 fullSuperView:(id)view2 withEdge:(UIEdgeInsets)edge;
/**
 view1宽充满父视图
 */
+(void)layoutItem:(id)view1 widthFullSuperView:(id)view2 withEdge:(UIEdgeInsets)edge;
/**
 view1高充满父视图
 */
+(void)layoutItem:(id)view1 heightFullSuperView:(id)view2 withEdge:(UIEdgeInsets)edge;
/********对齐父视图*********/
+(void)layoutItem:(id)view1 alignToTopSuperView:(id)view2 withSpace:(CGFloat)space itemHeight:(CGFloat)height;
+(void)layoutItem:(id)view1 alignToLeftSuperView:(id)view2 withSpace:(CGFloat)space itemWidth:(CGFloat)width;
+(void)layoutItem:(id)view1 alignToBottomSuperView:(id)view2 withSpace:(CGFloat)space itemHeight:(CGFloat)height;
+(void)layoutItem:(id)view1 alignToRightSuperView:(id)view2 withSpace:(CGFloat)space itemWidth:(CGFloat)width;

/**
 设置view等宽高
 */
+(void)layoutWidthEqualHeightItem:(id)view1 inSuperView:(id)view2;
@end
