//
//  HHZConfigTool.h
//  HHZConfigs
//
//  Created by 仁和Mac on 2017/10/7.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZConfigTool : NSObject
/**
 *  顶部Bar高度
 */
+(CGFloat)gainTopHeight;
/**
 *  顶部状态栏高度
 */
+(CGFloat)gainStateBarHeight;
/**
 *  顶部导航栏高度
 */
+(CGFloat)gainNavBarHeight;
/**
 *  底部Tabbar高度
 */
+(CGFloat)gainTabBarHeight;
/**
 *  是否是iPhoneX
 */
+(BOOL)is_iPhoneX;
@end

NS_ASSUME_NONNULL_END
