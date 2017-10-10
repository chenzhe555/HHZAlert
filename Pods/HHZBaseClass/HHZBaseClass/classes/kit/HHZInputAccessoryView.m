//
//  HHZInputAccessoryView.m
//  HHZBaseClass
//
//  Created by 仁和Mac on 2017/9/22.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZInputAccessoryView.h"

@interface HHZInputAccessoryView ()
@property (nonatomic, assign) id<HHZInputAccessoryViewDelegate> delegate;
@end

@implementation HHZInputAccessoryView

+(instancetype)gainInputAccessoryView:(id<HHZInputAccessoryViewDelegate>)delegate
{
    HHZInputAccessoryView * vie = [[HHZInputAccessoryView alloc] init];
    vie.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1];
    vie.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44);
    vie.delegate = delegate;
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 90, (vie.bounds.size.height - 30)/2, 80, 30);
    btn.layer.cornerRadius = 6.0f;
    btn.layer.masksToBounds = YES;
    [btn setTitle:@"完成" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:vie action:@selector(completebtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor colorWithRed:0/255.0 green:166/255.0 blue:228/255.0 alpha:1]];
    [vie addSubview:btn];
    
    UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(10, (vie.bounds.size.height - 30)/2, 80, 30);
    btn2.layer.cornerRadius = 6.0f;
    btn2.layer.masksToBounds = YES;
    [btn2 setTitle:@"取消" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn2 addTarget:vie action:@selector(cancelbtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setBackgroundColor:[UIColor redColor]];
    [vie addSubview:btn2];
    
    vie.showTextLabel = [[UILabel alloc] init];
    vie.showTextLabel.frame = CGRectMake(90, (vie.bounds.size.height - 20)/2, [UIScreen mainScreen].bounds.size.width - 90*2, 20);
    vie.showTextLabel.textAlignment = NSTextAlignmentCenter;
    vie.showTextLabel.font = [UIFont systemFontOfSize:12.0f];
    vie.showTextLabel.text = @"请选择";
    [vie addSubview:vie.showTextLabel];
    
    return vie;
}

-(void)completebtnClicked
{
    if (_delegate && [_delegate respondsToSelector:@selector(dlConfirmButtonClicked:)])
    {
        [_delegate dlConfirmButtonClicked:self];
    }
}

-(void)cancelbtnClicked
{
    if (_delegate && [_delegate respondsToSelector:@selector(dlCancelButtonClicked:)])
    {
        [_delegate dlCancelButtonClicked:self];
    }
}
@end
