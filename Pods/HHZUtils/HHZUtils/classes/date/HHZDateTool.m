//
//  HHZDateTool.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZDateTool.h"


@implementation HHZDateTool

+(instancetype)shareDateFommat
{
    return nil;
}

-(NSString *)getTimeStringFromTimeStamp:(NSTimeInterval)timeStamp
{
    return [self.fommat stringFromDate:[NSDate dateWithTimeIntervalSince1970:timeStamp]];
}

-(NSTimeInterval)getTimeStampFromTimeString:(NSString *)timeString
{
    return [[self getDateFromString:timeString] timeIntervalSince1970];
}

-(NSString *)getTimeStringFromTimeStamp:(NSTimeInterval)timeStamp format:(NSString *)format
{
    self.fommat.dateFormat = format;
    return [self.fommat stringFromDate:[NSDate dateWithTimeIntervalSince1970:timeStamp]];
}

-(NSString *)getStringFromDate:(NSDate *)date
{
    return [self.fommat stringFromDate:date];
}

-(NSDate *)getDateFromString:(NSString *)dateString
{
    return [[self.fommat dateFromString:dateString] dateByAddingTimeInterval:[HHZDateTool getCurrentZoneInterval]];
}

+(NSTimeInterval)getCurrentZoneInterval
{
    NSTimeZone * timeZone = [NSTimeZone systemTimeZone];
    return [timeZone secondsFromGMTForDate:[NSDate date]];
}

+(NSTimeInterval)getTimeStamp
{
    return [[NSDate date] timeIntervalSince1970]*1000;
}

@end
