//
//  HHZSearchViewController.m
//  RHCRM
//
//  Created by 仁和Mac on 2017/9/6.
//  Copyright © 2017年 Renhe. All rights reserved.
//

#import "HHZSearchViewController.h"
#import <HHZConfigs/HHZConfig.h>

@interface HHZSearchViewController ()

@end

@implementation HHZSearchViewController

#pragma mark 视图控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 数据初始化
-(void)configSomethings
{
    // 设置为NO,可以点击搜索出来的内容
    self.dimsBackgroundDuringPresentation = NO;
    self.searchBar.frame = CGRectMake(0, 0, SCREENW, 44);
    [self.searchBar sizeToFit];
    self.searchBar.barTintColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1];
    
}


#pragma mark 视图创建


#pragma mark 自定义辅助方法
-(void)configDelegate:(id<UISearchControllerDelegate>)delegate searchResultsUpdaterDelegate:(id<UISearchResultsUpdating>)searchResultsUpdater searchBarDelegate:(id<UISearchBarDelegate>)searchBarDelegate
{
    self.delegate = delegate;
    self.searchResultsUpdater = searchResultsUpdater;
    self.searchBar.delegate = searchBarDelegate;
}

#pragma mark 触发事件


#pragma mark 回调事件

@end
