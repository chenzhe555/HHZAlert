//
//  HHZPickerView.h
//  HHZBaseClass
//
//  Created by 仁和Mac on 2017/9/22.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZPickerView : UIPickerView

/**
 *  创建PickerView
 */
+(instancetype)gainPickerViewDelegate:(id<UIPickerViewDelegate> _Nullable)delegate dataSource:(id<UIPickerViewDataSource> _Nullable)dataSource;

/**
 *  创建PickerView并设置文本属性
 */
+(instancetype)gainPickerViewDelegate:(id<UIPickerViewDelegate> _Nullable)delegate dataSource:(id<UIPickerViewDataSource> _Nullable)dataSource textFont:(UIFont * _Nullable)textFont textColor:(UIColor * _Nullable)textColor;

/**
 *  如果要修改默认的字体颜色等，在创建的时候就要赋值
 */
-(UILabel *)gainPickerViewLabel:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
