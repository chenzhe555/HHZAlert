//
//  HHZPickerView.m
//  HHZBaseClass
//
//  Created by 仁和Mac on 2017/9/22.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZPickerView.h"

@interface HHZPickerView ()
@property (nonatomic, strong) UIFont * textFont;
@property (nonatomic, strong) UIColor * textColor;
@end

@implementation HHZPickerView

+(instancetype)gainPickerViewDelegate:(id<UIPickerViewDelegate>)delegate dataSource:(id<UIPickerViewDataSource>)dataSource textFont:(UIFont *)textFont textColor:(UIColor *)textColor
{
    HHZPickerView * pickerView = [[HHZPickerView alloc] init];
    pickerView.delegate = delegate;
    pickerView.dataSource = dataSource;
    pickerView.textFont = textFont;
    pickerView.textColor = textColor;
    
    return pickerView;
}

+(instancetype)gainPickerViewDelegate:(id<UIPickerViewDelegate>)delegate dataSource:(id<UIPickerViewDataSource>)dataSource
{
    return [self gainPickerViewDelegate:delegate dataSource:dataSource textFont:nil textColor:nil];
}

-(UILabel *)gainPickerViewLabel:(UIView *)view
{
    UILabel * pickerLabel = (UILabel*)view;
    
    if (!pickerLabel)
    {
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        if (self.textFont) pickerLabel.font = self.textFont;
        if (self.textColor) pickerLabel.textColor = self.textColor;
    }
    return pickerLabel;
}

@end
