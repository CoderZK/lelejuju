//
//  NSString+Size.m
//  buqiuren
//
//  Created by 李晓满 on 16/9/13.
//  Copyright © 2016年 李晓满. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

// 电话号码验证

-(BOOL) verifyPhone
{
    
    NSString * phoneString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[0-9]|7[0-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:phoneString] == YES)
        || ([regextestcm evaluateWithObject:phoneString] == YES)
        || ([regextestct evaluateWithObject:phoneString] == YES)
        || ([regextestcu evaluateWithObject:phoneString] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
}


/**
 获得字符串的大小
 */

-(CGSize)getSizeWithMaxSize:(CGSize)maxSize withFontSize:(int)fontSize
{
    CGSize size=[self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]} context:nil].size;
    return size;
}


- (CGFloat)getHeigtWithFontSize:(int)fontSize lineSpace:(int )lineSpace width:(NSInteger )widht {
    
    CGSize size = [self sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}];
    
    CGFloat  WD = widht * 1.0;
    
    CGFloat rows = size.width / WD;
    
    NSLog(@"=====%f",rows);
    
    //行数
    if (rows <= 1) {
        return size.height + lineSpace ;
    } else {
        
        return size.height * rows  + (rows - 1) * lineSpace ;
    }

}


+(NSString *)stringWithDateStrwithyymmddHHmm:(NSNumber *)str
{
    //以毫秒为单位 就除以1000 默认以秒为单位
    long long beTime = [str longLongValue];//1000.0;
    NSString * distanceStr;
    
    NSDate * beDate = [NSDate dateWithTimeIntervalSince1970:beTime];
    NSDateFormatter * df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy/MM/dd HH:mm"];
    distanceStr = [df stringFromDate:beDate];
    return distanceStr;
}

+(NSString *)stringWithDateStrwithyymmdd:(NSNumber *)str {
    //以毫秒为单位 就除以1000 默认以秒为单位
    long long beTime = [str longLongValue];//1000.0;
    NSString * distanceStr;
    
    NSDate * beDate = [NSDate dateWithTimeIntervalSince1970:beTime];
    NSDateFormatter * df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm"];
    distanceStr = [df stringFromDate:beDate];
    return distanceStr;
}


//根据时间判断
+(NSString *)stringWithDateStr:(NSNumber *)str
{
    //以毫秒为单位 就除以1000 默认以秒为单位
    long long beTime = [str longLongValue];//1000.0;
    NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
    double distanceTime = now - beTime;
    NSString * distanceStr;
    
    NSDate * beDate = [NSDate dateWithTimeIntervalSince1970:beTime];
    NSDateFormatter * df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"HH:mm"];
    NSString * timeStr = [df stringFromDate:beDate];
    
    [df setDateFormat:@"yyyy"];
    NSString * nowYear = [df stringFromDate:[NSDate date]];
    NSString * lastYear = [df stringFromDate:beDate];
    
    [df setDateFormat:@"dd"];
    NSString * nowDay = [df stringFromDate:[NSDate date]];
    NSString * lastDay = [df stringFromDate:beDate];
    
    if (distanceTime < 60)
    {   //小于一分钟
        distanceStr = @"刚刚";
    }
    else if (distanceTime < 60*60)
    {   //时间小于一个小时
        distanceStr = [NSString stringWithFormat:@"%ld分钟前",(long)distanceTime/60];
    }
    else if(distanceTime < 24*60*60 && [nowDay integerValue] == [lastDay integerValue])
    {  //时间小于一天
        distanceStr = [NSString stringWithFormat:@"今天 %@",timeStr];
    }
    else if(distanceTime< 24*60*60*2 && [nowDay integerValue] != [lastDay integerValue])
    {
        if ([nowDay integerValue] - [lastDay integerValue] == 1 || ([lastDay integerValue] - [nowDay integerValue] > 10 && [nowDay integerValue] == 1))
        {
            distanceStr = [NSString stringWithFormat:@"昨天 %@",timeStr];
        }
        else
        {
            [df setDateFormat:@"HH:mm"];
            distanceStr = [NSString stringWithFormat:@"前天 %@",[df stringFromDate:beDate]];
        }
    
    }
    else if(distanceTime < 24*60*60*365)
    {
        if ([nowDay integerValue] - [lastDay integerValue] == 2 || ([lastDay integerValue] - [nowDay integerValue] > 10 && [nowDay integerValue] == 1))
        {//包含前天的部分
            [df setDateFormat:@"HH:mm"];
            distanceStr = [NSString stringWithFormat:@"前天 %@",[df stringFromDate:beDate]];
        }
        else
        {
            if ([nowYear integerValue] == [lastYear integerValue])
            {//包含今年的部分
                [df setDateFormat:@"MM-dd HH:mm"];
                distanceStr = [df stringFromDate:beDate];
            }
            else
            {
                [df setDateFormat:@"yyyy-MM-dd HH:mm"];
                distanceStr = [df stringFromDate:beDate];
            }
        }
    }
    else
    {
        [df setDateFormat:@"yyyy-MM-dd HH:mm"];
        distanceStr = [df stringFromDate:beDate];
    }
    return distanceStr;
    
}



@end
