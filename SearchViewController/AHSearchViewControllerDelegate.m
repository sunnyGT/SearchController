//
//  AHSearchViewControllerDelegate.m
//  SearchViewController
//
//  Created by Robin on 16/10/10.
//  Copyright © 2016年 Robin. All rights reserved.
//

#import "AHSearchViewControllerDelegate.h"

@interface AHSearchViewControllerDelegate ()<UIScrollViewDelegate>{
    UISearchBar *tempSearchBar;
}
@property (nonatomic ,strong)UIScrollView *dimView;
@property (nonatomic ,strong)UILabel *titleLabel;
@property (nonatomic ,weak)UIViewController *target;
@end
@implementation AHSearchViewControllerDelegate

- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithTarget:(id)target{
    self = [super init];
    if (self) {
        self.target = target;
    }
    return self;
}

#pragma mark - searchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    tempSearchBar = searchBar;
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{

 
}
- (UILabel*)titleLabel{
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([[UIScreen mainScreen] bounds]), CGRectGetHeight([[UIScreen mainScreen] bounds]))];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.text = @"Set custom UI for nothing";
        _titleLabel.textColor = [UIColor colorWithRed:208/255.0 green:128/255.0 blue:124/255.0 alpha:1];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIScrollView *)dimView{
    if (!_dimView) {
        _dimView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([[UIScreen mainScreen] bounds]), CGRectGetHeight([[UIScreen mainScreen] bounds]))];
        _dimView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.98];
        _dimView.delegate = self;
        _dimView.contentSize = CGSizeMake(0, CGRectGetHeight([[UIScreen mainScreen] bounds])+ 10);
        [_dimView addSubview:self.titleLabel];
        
    }
    return _dimView;
}

#pragma mark - searchViewControllerDelegate

- (void)willPresentSearchController:(UISearchController *)searchController{
    
    [self.target.view addSubview:self.dimView];
}

- (void)willDismissSearchController:(UISearchController *)searchController{
    [self.dimView removeFromSuperview];
}

#pragma mark - updating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
}

#pragma mark - scrollDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (tempSearchBar.isFirstResponder) {
        [tempSearchBar resignFirstResponder];
    }
}
@end
