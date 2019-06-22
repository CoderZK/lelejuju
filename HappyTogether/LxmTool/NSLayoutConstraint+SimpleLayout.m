//
//  NSLayoutConstraint+SimpleLayout.m
//  Fenxiao
//
//  Created by sny on 15/6/15.
//  Copyright (c) 2015年 sny. All rights reserved.
//

#import "NSLayoutConstraint+SimpleLayout.h"

@implementation NSLayoutConstraint (SimpleLayout)
/**
 设置view固定宽度
 */
+(void)layoutSetWitdh:(CGFloat)width forItem:(id)view
{
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[view(width)]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:@{@"width":[NSNumber numberWithFloat:width]} views:NSDictionaryOfVariableBindings(view)]];
}
/**
 设置view固定高度
 */
+(void)layoutSetHeight:(CGFloat)height forItem:(id)view
{
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[view(height)]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:@{@"height":[NSNumber numberWithFloat:height]} views:NSDictionaryOfVariableBindings(view)]];
}
/**
 设置view固定size
 */
+(void)layoutSetSize:(CGSize)size forItem:(id)view
{
    [self layoutSetWitdh:size.width forItem:view];
    [self layoutSetHeight:size.height forItem:view];
}


/**
 设置view1在view2中心位置
 */
+(void)layoutItem1:(id)view1 centerInItem2:(id)view2
{
    [self layoutItem1:view1 centerXInItem2:view2];
    [self layoutItem1:view1 centerYInItem2:view2];
}
/**
 设置view1的Y轴在view2中心位置
 */
+(void)layoutItem1:(id)view1 centerYInItem2:(id)view2
{
    [view2  addConstraint:[self constraintWithItem:view1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
}
/**
 设置view1的X轴在view2中心位置
 */
+(void)layoutItem1:(id)view1 centerXInItem2:(id)view2
{
    [view2  addConstraint:[self constraintWithItem:view1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
}
/**
 view1充满父视图
 */
+(void)layoutItem:(id)view1 fullSuperView:(id)view2 withEdge:(UIEdgeInsets)edge
{
    [view2 addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-left-[view1]-right-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:@{@"left":[NSNumber numberWithFloat:edge.left],@"right":[NSNumber numberWithFloat:edge.right]} views:NSDictionaryOfVariableBindings(view1)]];
    [view2 addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-top-[view1]-bottom-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:@{@"top":[NSNumber numberWithFloat:edge.top],@"bottom":[NSNumber numberWithFloat:edge.bottom]} views:NSDictionaryOfVariableBindings(view1)]];
}
/**
 view1宽充满父视图
 */
+(void)layoutItem:(id)view1 widthFullSuperView:(id)view2 withEdge:(UIEdgeInsets)edge
{
    [view2 addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-left-[view1]-right-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:@{@"left":[NSNumber numberWithFloat:edge.left],@"right":[NSNumber numberWithFloat:edge.right]} views:NSDictionaryOfVariableBindings(view1)]];
}
/**
 view1高充满父视图
 */
+(void)layoutItem:(id)view1 heightFullSuperView:(id)view2 withEdge:(UIEdgeInsets)edge
{
    [view2 addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-top-[view1]-bottom-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:@{@"top":[NSNumber numberWithFloat:edge.top],@"bottom":[NSNumber numberWithFloat:edge.bottom]} views:NSDictionaryOfVariableBindings(view1)]];
}

/********对齐父视图*********/
+(void)layoutItem:(id)view1 alignToTopSuperView:(id)view2 withSpace:(CGFloat)space itemHeight:(CGFloat)height
{
    [view2 addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-space-[view1(height)]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:@{@"space":[NSNumber numberWithFloat:space],@"height":[NSNumber numberWithFloat:height]} views:NSDictionaryOfVariableBindings(view1)]];
}
+(void)layoutItem:(id)view1 alignToLeftSuperView:(id)view2 withSpace:(CGFloat)space itemWidth:(CGFloat)width
{
    [view2 addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-space-[view1(width)]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:@{@"space":[NSNumber numberWithFloat:space],@"width":[NSNumber numberWithFloat:width]} views:NSDictionaryOfVariableBindings(view1)]];

}
+(void)layoutItem:(id)view1 alignToBottomSuperView:(id)view2 withSpace:(CGFloat)space itemHeight:(CGFloat)height
{
    [view2 addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[view1(height)]-space-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:@{@"space":[NSNumber numberWithFloat:space],@"height":[NSNumber numberWithFloat:height]} views:NSDictionaryOfVariableBindings(view1)]];
}
+(void)layoutItem:(id)view1 alignToRightSuperView:(id)view2 withSpace:(CGFloat)space itemWidth:(CGFloat)width
{
    [view2 addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[view1(width)]-space-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:@{@"space":[NSNumber numberWithFloat:space],@"width":[NSNumber numberWithFloat:width]} views:NSDictionaryOfVariableBindings(view1)]];
}
+(void)layoutWidthEqualHeightItem:(id)view1 inSuperView:(id)view2
{
    [view2 addConstraint:[self constraintWithItem:view1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:view1 attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
}

@end
