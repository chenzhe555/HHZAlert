//
//  HHZInputAccessoryView.h
//  HHZBaseClass
//
//  Created by 仁和Mac on 2017/9/22.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HHZInputAccessoryView;

NS_ASSUME_NONNULL_BEGIN

@protocol HHZInputAccessoryViewDelegate <NSObject>
//点击完成事件
-(void)dlConfirmButtonClicked:(HHZInputAccessoryView *)inputAccessoryView;
//点击取消事件
-(void)dlCancelButtonClicked:(HHZInputAccessoryView *)inputAccessoryView;

@end

@interface HHZInputAccessoryView : UIView
@property (nonatomic, strong) UILabel * showTextLabel;
+(instancetype)gainInputAccessoryView:(id<HHZInputAccessoryViewDelegate>)delegate;

@end

NS_ASSUME_NONNULL_END
