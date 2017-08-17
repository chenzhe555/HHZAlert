//
//  HHZAlertView.h
//  HHZAlert
//
//  Created by 仁和Mac on 2017/8/14.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZAlertView : NSObject
+(void)showAlertViewTitle:(NSString * _Nullable)title message:(NSString *)message delegate:(UIViewController * _Nullable)delegate buttonTitles:(NSArray<NSString *> *)otherButtonTitles tag:(NSInteger)tag;
@end

NS_ASSUME_NONNULL_END
