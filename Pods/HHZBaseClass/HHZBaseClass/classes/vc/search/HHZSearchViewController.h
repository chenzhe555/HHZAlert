//
//  HHZSearchViewController.h
//  RHCRM
//
//  Created by 仁和Mac on 2017/9/6.
//  Copyright © 2017年 Renhe. All rights reserved.
//


/**
 *  //大致意思就是如果为NO，则展示的搜索结果视图将作为根视图，searchBar并未跟着移动，至于是上移还是下移64我就没去测了。为YES，searchBar就会跟着搜索结果视图一起移动。
    self.definesPresentationContext = YES;
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZSearchViewController : UISearchController
#pragma mark Required
-(void)configSomethings;



#pragma mark Optional
-(void)configDelegate:(nullable id<UISearchControllerDelegate>)delegate searchResultsUpdaterDelegate:(nullable id<UISearchResultsUpdating>)searchResultsUpdater searchBarDelegate:(nullable id<UISearchBarDelegate>)searchBarDelegate;

@end

NS_ASSUME_NONNULL_END
