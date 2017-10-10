//
//  HHZConfigTool.m
//  HHZConfigs
//
//  Created by 仁和Mac on 2017/10/7.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZConfigTool.h"

@implementation HHZConfigTool
+(CGFloat)gainTopHeight
{
    return 64;
}

+(CGFloat)gainStateBarHeight
{
    return 20;
}

+(CGFloat)gainNavBarHeight
{
    return 44;
}

+(CGFloat)gainTabBarHeight
{
    return 49;
}

+(BOOL)is_iPhoneX
{
    if ([UIScreen mainScreen].bounds.size.width == 375 && [UIScreen mainScreen].bounds.size.height == 812) return YES;
    else return NO;
}
@end
