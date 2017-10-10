//
//  HHZResultViewController.m
//  RHCRM
//
//  Created by 仁和Mac on 2017/9/6.
//  Copyright © 2017年 Renhe. All rights reserved.
//

#import "HHZResultViewController.h"
#import <UIView+HHZCategory.h>
#import <HHZConfigs/HHZConfig.h>

@interface HHZResultViewController ()

@end

@implementation HHZResultViewController

#pragma mark 视图控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _originKeyboardHeight = 0;
        [self registNotification];
        [self createSearchBarTopView];
        
        if (self.dataArray.count == 0) [self judgeViewShowState:NO];
    }
    return self;
}

#pragma mark 数据初始化
-(void)registNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShowHappened:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(inputTextChanged) name:UITextFieldTextDidChangeNotification object:nil];
}

#pragma mark 视图创建
-(void)createSearchBarTopView
{
    self.searchBarTopView = [[UIView alloc] init];
    self.searchBarTopView.frame = CGRectMake(0, 0, SCREENW, 64);
    self.searchBarTopView.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1];
    [self.view addSubview:self.searchBarTopView];
    [self.view bringSubviewToFront:self.searchBarTopView];
}

#pragma mark 自定义辅助方法
-(void)inputTextChanged
{
    
}


-(void)updateAllViewFrame
{
    self.noneDataLabel.frame = CGRectMake(0, (self.contentView.height - 25)/2, self.contentView.width, 25);
    self.tableView.frame = self.contentView.bounds;
}

-(void)keyboardShowHappened:(NSNotification *)notification
{
    CGFloat height = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    if (_originKeyboardHeight != height)
    {
        _originKeyboardHeight = height;
        self.contentView.frame = CGRectMake(0, self.searchBarTopView.yPlushHeight, SCREENW, SCREENH - 64 - _originKeyboardHeight);
        [self updateAllViewFrame];
    }
}

-(void)judgeViewShowState:(BOOL)isHaveData
{
    if (isHaveData)
    {
        if (self.tableView.hidden)
        {
            self.tableView.hidden = NO;
            self.noneDataLabel.hidden = YES;
        }
    }
    else
    {
        if (!self.tableView.hidden)
        {
            self.tableView.hidden = YES;
            self.noneDataLabel.hidden = NO;
        }
    }
}



#pragma mark 自定义辅助方法 属性懒加载
-(UIView *)contentView
{
    if (!_contentView)
    {
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_contentView];
    }
    return _contentView;
}

-(UILabel *)noneDataLabel
{
    if (!_noneDataLabel)
    {
        _noneDataLabel = [[UILabel alloc] init];
        _noneDataLabel.text = @"无搜索结果";
        _noneDataLabel.font = [UIFont boldSystemFontOfSize:20];
        _noneDataLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_noneDataLabel];
    }
    return _noneDataLabel;
}

-(UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:self.contentView.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1];
        [self.contentView addSubview:_tableView];
    }
    return _tableView;
}

#pragma mark 触发事件


#pragma mark 回调事件


@end
