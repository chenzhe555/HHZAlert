//
//  HHZViewController.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHZViewController : UIViewController
/**
 *  初始化数据(重写)
 */
-(void)initializeData;

/**
 *  创建主视图(重写)
 */
-(void)createMainView;

/**
 *  视图创建完之后做的一些事情，比如网络请求等
 */
-(void)doSomeThingsBeforeShow;

/**
 *  离开当前视图(重写)
 */
-(void)back;
@end
