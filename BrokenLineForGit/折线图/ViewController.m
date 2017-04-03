//
//  ViewController.m
//  折线图
//
//  Created by 何钰堂 on 17/3/30.
//  Copyright © 2017年 heXin. All rights reserved.
//

#import "ViewController.h"
#import "BrokenLine.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BrokenLine *brokenLine = [[BrokenLine alloc] initWithFrame:CGRectMake(0,100, self.view.frame.size.width, 100)];
    [self.view addSubview:brokenLine];
    // Do
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
