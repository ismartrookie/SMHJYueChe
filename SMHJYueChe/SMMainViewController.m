//
//  SMMainViewController.m
//  SMHJYueChe
//
//  Created by administrator on 14-4-3.
//  Copyright (c) 2014年 zdf. All rights reserved.
//

#import "SMMainViewController.h"


@interface SMMainViewController ()

@end

@implementation SMMainViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"约车界面";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIButton *testButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [testButton setFrame:CGRectMake(100, 200, 100, 40)];
    [testButton setTitle:@"开始约车" forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(testFunction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButton];
}

- (void)testFunction:(UIButton *)sender
{
    NSString* date;
    NSDate *now = [NSDate date];
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    date = [formatter stringFromDate:now];
    
    NSLog(@"当前时间为 ： %@",date);
    NSLog(@"now = %@",now.description);
}



@end
