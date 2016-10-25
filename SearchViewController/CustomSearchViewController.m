//
//  CustomSearchViewController.m
//  SearchViewController
//
//  Created by Robin on 16/10/9.
//  Copyright © 2016年 Robin. All rights reserved.
//

#import "CustomSearchViewController.h"


@interface CustomSearchViewController ()
- (IBAction)cancelAction:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UISearchBar *searchTextField;

@end

@implementation CustomSearchViewController


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.frame = [[UIScreen mainScreen] bounds];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [self.searchTextField becomeFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view from its nib.
    self.searchTextField.backgroundImage = [UIImage new];
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
- (void)viewWillDisappear:(BOOL)animated{
    [self.searchTextField resignFirstResponder];
}
- (IBAction)cancelAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
}
@end
