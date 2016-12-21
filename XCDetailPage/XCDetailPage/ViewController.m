//
//  ViewController.m
//  XCDetailPage
//
//  Created by zhangyu on 2016/12/21.
//  Copyright © 2016年 zhangyu. All rights reserved.
//

#import "ViewController.h"
#import "XCDetailController.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (IBAction)ComeDetailVC:(id)sender {
//    ZHCustomLayoutTableViewController *customeVC = [[ZHCustomLayoutTableViewController alloc]init];
//    [self.navigationController pushViewController:customeVC animated:YES];
    XCDetailController *detailController = [[XCDetailController alloc]init];
    self.navigationController.navigationBarHidden = YES;
    [self.navigationController pushViewController:detailController animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
