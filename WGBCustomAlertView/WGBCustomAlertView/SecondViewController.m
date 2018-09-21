//
//  SecondViewController.m
//  WGBCustomAlertView
//
//  Created by CoderWGB on 2018/9/21.
//  Copyright © 2018年 王贵彬. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];

}

- (void)setup{
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200 , 200)];
    testView.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0f green:arc4random()%256/255.0f  blue:arc4random()%256/255.0f alpha:1.0f];
    [self.view addSubview: testView];
    
    UISwitch *switchBtn = [[UISwitch alloc] initWithFrame:CGRectMake(50, 350, 100 , 37)];
    switchBtn.on = NO;
    [switchBtn addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview: switchBtn];
}

- (void)change:(UISwitch *)switchBtn{
    !self.block?:self.block();
}


@end
