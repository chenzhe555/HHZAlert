//
//  HHZDateTool.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//
#import <Foundation/Foundation.h>
//@"yyyy-MM-dd HH:mm:ss";
#define HHZDateToolFormat1 @"yyyy"
#define HHZDateToolFormat2 @"yyyy-MM"
#define HHZDateToolFormat3 @"yyyy-MM-dd HH"
#define HHZDateToolFormat4 @"yyyy-MM-dd HH:mm"
#define HHZDateToolFormat5 @"HH:mm"

NS_ASSUME_NONNULL_BEGIN

@interface HHZDateTool : NSObject
@property (nonatomic, strong) NSDateFormatter * fommat;

/**
 *  获取DateFormmater实例
 *
 *  @return
 */
+(instancetype _Nullable)shareDateFommat;

/**
 *  提供时间戳获取时间字符串(HHZDateTool_Year/HHZDateTool_Time/HHZDateTool_YearAndTime)
 *
 *  @param 时间戳
 *
 *  @return
 */
-(NSString *)getTimeStringFromTimeStamp:(NSTimeInterval)timeStamp;

/**
 *  提供时间字符串获取时间戳
 *
 *  @param 时间戳
 *
 *  @return
 */
-(NSTimeInterval)getTimeStampFromTimeString:(NSString *)timeString;

/**
 *  提供时间戳获取时间字符串(HHZDateTool_Common)
 *
 *  @param 时间戳
 *
 *  @return
 */
-(NSString *)getTimeStringFromTimeStamp:(NSTimeInterval)timeStamp format:(NSString *)format;

/**
 *  提供Date对象获取时间字符串
 *
 *  @param date
 *
 *  @return
 */
-(NSString *)getStringFromDate:(NSDate *)date;

/**
 *  提供时间字符串获取Date对象
 *
 *  @param dateString
 *
 *  @return
 */
-(NSDate *)getDateFromString:(NSString *)dateString;




/**
 *  获取当前时区时间戳
 *
 *  @return
 */
+(NSTimeInterval)getCurrentZoneInterval;

/**
 *  获取当前时间戳
 *
 *  @return 
 */
+(NSTimeInterval)getTimeStamp;

@end

NS_ASSUME_NONNULL_END
