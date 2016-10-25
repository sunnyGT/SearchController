//
//  AHSearchViewController.m
//  SearchViewController
//
//  Created by Robin on 16/10/10.
//  Copyright © 2016年 Robin. All rights reserved.
//

#import "AHSearchViewController.h"
#import "SearchResultViewController.h"
#import "AHSearchViewControllerDelegate.h"

@interface AHSearchViewController ()<UITableViewDelegate ,UITableViewDataSource>


@property (nonatomic ,strong)UITableView *testTabelView;
@property (nonatomic ,strong)UISearchController *searchViewController;
@property (nonatomic ,strong)SearchResultViewController *resultViewController;
@property (nonatomic ,strong)AHSearchViewControllerDelegate *searchDelegate;
@end

@implementation AHSearchViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.testTabelView];
    self.testTabelView.tableHeaderView = self.searchViewController.searchBar;
    
    
    self.searchViewController.searchBar.barTintColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1];
    self.searchViewController.searchBar.tintColor = [UIColor colorWithRed:208/255.0 green:128/255.0 blue:124/255.0 alpha:1];

}

- (UITableView *)testTabelView{
    if (!_testTabelView) {
        _testTabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height) style:UITableViewStyleGrouped];
        _testTabelView.backgroundColor = [UIColor clearColor];
        _testTabelView.delegate = self;
        _testTabelView.dataSource = self;
        _testTabelView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        [_testTabelView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    
    return _testTabelView;
}


#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"section:%zi, row:%zi",indexPath.section,indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.searchViewController.searchBar becomeFirstResponder];
}

- (AHSearchViewControllerDelegate *)searchDelegate{
    if (!_searchDelegate) {
        _searchDelegate = [[AHSearchViewControllerDelegate alloc] initWithTarget:self];
    }
    return _searchDelegate;
}


- (UISearchController *)searchViewController{
    
    if (!_searchViewController) {
        _searchViewController = [[UISearchController alloc] initWithSearchResultsController:self.resultViewController];
        
        _searchViewController.delegate = self.searchDelegate;
        _searchViewController.searchBar.delegate = self.searchDelegate;
        _searchViewController.searchResultsUpdater = self.searchDelegate;
        _searchViewController.dimsBackgroundDuringPresentation = NO;
        
        //?????????????????
        _searchViewController.definesPresentationContext = YES;
    }
    return _searchViewController;
}

- (UIViewController *)resultViewController{
    
    if (!_resultViewController) {
        _resultViewController = [SearchResultViewController new];
    }
    return _resultViewController;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
