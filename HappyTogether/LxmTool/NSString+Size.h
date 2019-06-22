//
//  NSString+Size.h
//  buqiuren
//
//  Created by 李晓满 on 16/9/13.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Size)


// 电话号码验证
-(BOOL) verifyPhone;

/**
 获得字符串的大小
 */

-(CGSize)getSizeWithMaxSize:(CGSize)maxSize withFontSize:(int)fontSize;

//根据行间距 和 行的宽 字的大小计算行的高度

- (CGFloat)getHeigtWithFontSize:(int)fontSize lineSpace:(int )lineSpace width:(NSInteger )widht;


/**
把字符串装换成日期型的格式化字符串
 */
+(NSString *)stringWithDateStrwithyymmddHHmm:(NSNumber *)str;

/**
 把字符串装换成日期型的格式化字符串
 */
+(NSString *)stringWithDateStrwithyymmdd:(NSNumber *)str;


/** 根据时间进行判断返回时间*/
+(NSString *)stringWithDateStr:(NSNumber *)str;


@end
