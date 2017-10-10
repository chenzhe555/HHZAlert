//
//  HHZResultViewController.h
//  RHCRM
//
//  Created by 仁和Mac on 2017/9/6.
//  Copyright © 2017年 Renhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHZSearchViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHZResultViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, assign) HHZSearchViewController * searchVC;

@property (nonatomic, strong) UIView * searchBarTopView;
@property (nonatomic, strong) UIView * contentView;
//contentView-无搜索结果
@property (nonatomic, strong) UILabel * noneDataLabel;
//contentView-数据展示
@property (nonatomic, strong) UITableView * tableView;
//contentView-数据展示数据源
@property (nonatomic, strong) NSMutableArray * dataArray;

//搜索的数组
@property (nonatomic, strong) NSArray * searchArray;

//记录键盘的高度，如果有变化就update视图
@property (nonatomic, assign) CGFloat originKeyboardHeight;


#pragma mark Required
//文本变化是触发的方法
-(void)inputTextChanged;

#pragma mark Optional
//更新内部视图坐标
-(void)updateAllViewFrame;
//判断tableView显示状态
-(void)judgeViewShowState:(BOOL)isHaveData;
@end

NS_ASSUME_NONNULL_END
