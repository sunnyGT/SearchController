//
//  ViewController.m
//  SearchViewController
//
//  Created by Robin on 16/10/9.
//  Copyright © 2016年 Robin. All rights reserved.
//

#import "ViewController.h"
#import "CustomSearchViewController.h"
#import "PresentAnimator.h"
#import "DismissAnimatior.h"
#import "AHSearchViewController.h"
#import "TestViewController.h"


#define CELLIDENTIFER @"CELL"
@interface ViewController ()<UIViewControllerTransitioningDelegate,UITableViewDelegate,UITableViewDataSource>{
    
    NSArray *_titles;
}
- (IBAction)presentAction:(UIButton *)sender;
@property (nonatomic ,strong)UITableView *tableView;
@end

@implementation ViewController

- (void)loadView{
    [super loadView];
    [self.view addSubview:self.tableView];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Search";
    
    _titles = @[@"AHSearchViewController",@"CustomSearchViewController"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,CGRectGetWidth([[UIScreen mainScreen] bounds]), CGRectGetHeight([[UIScreen mainScreen] bounds])) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
        _tableView.rowHeight = 44.f;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELLIDENTIFER];
        
    }
    return _tableView;
}

#pragma mark - TableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:CELLIDENTIFER];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = _titles[indexPath.section];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Class class = NSClassFromString(_titles[indexPath.section]);
    UIViewController *viewController = [class new];
    
    if (indexPath.section) {
        viewController.transitioningDelegate = self;
        viewController.definesPresentationContext = NO;
        [self presentViewController:viewController animated:YES completion:NULL];
    }else{

        [self.navigationController pushViewController:viewController animated:YES];
    }
    
}



#pragma mark - ViewControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    return [PresentAnimator new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    return [PresentAnimator new];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)presentAction:(UIButton *)sender {
    
    CustomSearchViewController *presentVC = [CustomSearchViewController new];
    presentVC.transitioningDelegate = self;
    presentVC.definesPresentationContext = NO;

    [self presentViewController:presentVC animated:YES completion:^{
        
    }];
}
@end
