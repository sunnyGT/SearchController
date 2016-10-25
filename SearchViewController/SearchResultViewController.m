//
//  SearchResultViewController.m
//  SearchViewController
//
//  Created by Robin on 16/10/10.
//  Copyright © 2016年 Robin. All rights reserved.
//

#import "SearchResultViewController.h"


static NSString *cellIdentifer = @"Cell";
@interface SearchResultViewController ()<UITableViewDelegate ,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@end

@implementation SearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -44, CGRectGetWidth([[UIScreen mainScreen] bounds]), CGRectGetHeight([[UIScreen mainScreen] bounds])) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 44.f;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifer];
    }
    
    return _tableView;
}

#pragma mark - tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.resultData.count? :10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    cell.textLabel.text = [NSString stringWithFormat:@"section:%zi, row:%zi",indexPath.section,indexPath.row];
    cell.textLabel.textColor = [UIColor colorWithRed:208/255.0 green:128/255.0 blue:124/255.0 alpha:1];
    return cell;
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
