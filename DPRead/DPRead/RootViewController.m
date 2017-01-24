//
//  RootViewController.m
//  DPRead
//
//  Created by shan on 2017/1/22.
//  Copyright © 2017年 sahn. All rights reserved.
//

#import "RootViewController.h"
#import "ViewController.h"
#import "ListTableViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)continueRead:(id)sender {
    
    ViewController *vc =  [[UIStoryboard storyboardWithName:@"Main" bundle:nil]   instantiateViewControllerWithIdentifier:@"ViewController"];
    
    
    vc.indexNub = [[NSUserDefaults standardUserDefaults] objectForKey:@"ReadIndex"];
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (IBAction)listAction:(id)sender {
    
    ListTableViewController *vc =  [[UIStoryboard storyboardWithName:@"Main" bundle:nil]   instantiateViewControllerWithIdentifier:@"ListTableViewController"];

    [self.navigationController pushViewController:vc animated:YES];
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
