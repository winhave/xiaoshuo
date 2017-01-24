//
//  ListTableViewController.m
//  DPRead
//
//  Created by shan on 2017/1/22.
//  Copyright © 2017年 sahn. All rights reserved.
//

#import "ListTableViewController.h"
#import "ListTableViewCell.h"
#import "ViewController.h"
@interface ListTableViewController ()

@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation ListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _index = [[[NSUserDefaults standardUserDefaults] objectForKey:@"ReadIndex"] integerValue];
    NSString *txtPath = [[NSBundle mainBundle] pathForResource:@"list" ofType:@"txt"];
    NSString *string = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
    self.dataArray = [string componentsSeparatedByString:@"\n"].mutableCopy;
    

    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_index inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count - 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListTableViewCell" forIndexPath:indexPath];
    cell.centerTitle1.text = _dataArray[indexPath.row];
    if(_index == indexPath.row)
    {
        cell.centerTitle1.textColor = [UIColor greenColor];
    }
    else
    {
        cell.centerTitle1.textColor = [UIColor blackColor];
    }
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ViewController *vc =   [[UIStoryboard storyboardWithName:@"Main" bundle:nil]   instantiateViewControllerWithIdentifier:@"ViewController"];
    vc.indexNub = @(indexPath.row);
    [self.navigationController pushViewController:vc animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
