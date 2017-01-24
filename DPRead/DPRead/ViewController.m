//
//  ViewController.m
//  DPRead
//
//  Created by shan on 2017/1/22.
//  Copyright © 2017年 sahn. All rights reserved.
//

#import "ViewController.h"
#import "ListTableViewController.h"
#import <CoreText/CoreText.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *contentTitle;

@property (nonatomic,strong) NSMutableArray *dataArray;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if(_indexNub != nil)
    [[NSUserDefaults standardUserDefaults] setObject:_indexNub forKey:@"ReadIndex"];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *Path = [[NSBundle mainBundle] pathForResource:@"list" ofType:@"txt"];
    NSString *str = [[NSString  alloc] initWithContentsOfFile:Path encoding:NSUTF8StringEncoding error:nil];
    self.dataArray = [str componentsSeparatedByString:@"\n"].mutableCopy;
    [self.dataArray removeObject:[self.dataArray lastObject]];
    
    self.title = self.dataArray[[_indexNub integerValue]];
    
    NSString *txtPath = [[NSBundle mainBundle] pathForResource:self.title ofType:@"txt"];
    //    将txt到string对象中，编码类型为NSUTF8StringEncoding
    NSString *string = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
    
    self.contentTitle.attributedText = [self sh_changeLineAndTextSpaceWithTotalString:string LineSpace:5 textSpace:2];
    
    

    
    
}

- (IBAction)beforAction:(id)sender {

    self.scrollView.contentOffset = CGPointMake(0, -64);
    self.indexNub = @([self.indexNub integerValue] - 1);
    [[NSUserDefaults standardUserDefaults] setObject:_indexNub forKey:@"ReadIndex"];
    
    
    self.title = self.dataArray[[self.indexNub integerValue]];
    NSString *txtPath = [[NSBundle mainBundle] pathForResource:self.title ofType:@"txt"];
    //    将txt到string对象中，编码类型为NSUTF8StringEncoding
    NSString *string = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
    
    
    self.contentTitle.attributedText = [self sh_changeLineAndTextSpaceWithTotalString:string LineSpace:5 textSpace:2];
    
    
    
}

- (IBAction)centerAction:(id)sender {
    
    ListTableViewController *vc =  [[UIStoryboard storyboardWithName:@"Main" bundle:nil]  instantiateViewControllerWithIdentifier:@"ListTableViewController"];
    vc.index = [self.indexNub integerValue];
    [self.navigationController pushViewController:vc animated:YES];
   
}
- (IBAction)nextAction:(id)sender {
 
    self.scrollView.contentOffset = CGPointMake(0, -64);
    self.indexNub = @([self.indexNub integerValue] + 1);
        [[NSUserDefaults standardUserDefaults] setObject:_indexNub forKey:@"ReadIndex"];
    
    
    self.title = self.dataArray[[self.indexNub integerValue]];
    NSString *txtPath = [[NSBundle mainBundle] pathForResource:self.title ofType:@"txt"];
    //    将txt到string对象中，编码类型为NSUTF8StringEncoding
    NSString *string = [[NSString  alloc] initWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
    
    
    self.contentTitle.attributedText = [self sh_changeLineAndTextSpaceWithTotalString:string LineSpace:5 textSpace:2];
    
}

/**
 *  同时更改行间距和字间距
 *
 *  @param totalString 需要改变的字符串
 *  @param lineSpace   行间距
 *  @param textSpace   字间距
 *
 *  @return 生成的富文本
 */
- (NSMutableAttributedString *)sh_changeLineAndTextSpaceWithTotalString:(NSString *)totalString LineSpace:(CGFloat)lineSpace textSpace:(CGFloat)textSpace
{
    NSMutableAttributedString *attributeStr =  [[NSMutableAttributedString alloc]initWithString:totalString];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:lineSpace];
    
    [attributeStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, totalString.length)];
    
    
    long number = textSpace;
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &number);
    [attributeStr addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(0, attributeStr.length)];
    CFRelease(num);
    
    return attributeStr;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
