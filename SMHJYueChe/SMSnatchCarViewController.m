//
//  SMSnatchCarViewController.m
//  SMHJYueChe
//
//  Created by smartrookie on 4/9/14.
//  Copyright (c) 2014 zdf. All rights reserved.
//

#import "SMSnatchCarViewController.h"
#import "SMSnatchTableViewCell.h"

@interface SMSnatchCarViewController ()<UITableViewDelegate,UITableViewDataSource> {
    UITableView *tableview;
    NSArray *tableDataArr;
    
    UILabel *l_nowtime;
    UILabel *l_daytime;
    
    UIButton *snatchBtn;
}

@end

@implementation SMSnatchCarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"抢车界面"];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:2.0f/255 green:115.0f/255 blue:195.0f/255 alpha:1]];
    
    UIImageView *backgroundv = [[UIImageView alloc] init];
    [backgroundv setFrame:CGRectMake(0, 0, 320, 568)];
    [backgroundv setImage:[UIImage imageNamed:@"images.bundle/tcar_background.png"]];
    [self.view addSubview:backgroundv];
    
    UIImageView *clocklogo = [[UIImageView alloc] init];
    [clocklogo setFrame:CGRectMake(0, 0, 48, 48)];
    [clocklogo setCenter:CGPointMake(160, 100)];
    [clocklogo setImage:[UIImage imageNamed:@"images.bundle/tcar_clocklogo.png"]];
    [self.view addSubview:clocklogo];
    
    l_nowtime = [[UILabel alloc] init];
    [l_nowtime setFrame:CGRectMake(0, CGRectGetMaxY(clocklogo.frame)+4, 320, 30)];
    [l_nowtime setBackgroundColor:[UIColor clearColor]];
    [l_nowtime setText:@"07:30:22"];
    [l_nowtime setFont:[UIFont fontWithName:@"Arial-BoldMT" size:30]];
    [l_nowtime setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:l_nowtime];
    
    l_daytime = [[UILabel alloc] init];
    [l_daytime setFrame:CGRectMake(0, CGRectGetMaxY(l_nowtime.frame), 320, 15)];
    [l_daytime setBackgroundColor:[UIColor clearColor]];
    [l_daytime setText:@"2014-04-10"];
    [l_daytime setFont:[UIFont fontWithName:@"ArialMT" size:15]];
    [l_daytime setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:l_daytime];
    
    snatchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [snatchBtn setFrame:CGRectMake(15, CGRectGetHeight(self.view.frame)-70, 290, 42)];
    [snatchBtn setBackgroundImage:[UIImage imageNamed:@"images.bundle/snatchCarBtn.png"] forState:UIControlStateNormal];
    [self.view addSubview:snatchBtn];
    
    
    tableview = ({
        UITableView *_tableview = [[UITableView alloc] init];
        [_tableview setDelegate:self];
        [_tableview setDataSource:self];
        [_tableview setFrame:CGRectMake(0, CGRectGetMaxY(l_daytime.frame)+10, 320, CGRectGetMinY(snatchBtn.frame)-CGRectGetMaxY(l_daytime.frame)-37)];
        [_tableview setBackgroundColor:[UIColor clearColor]];
        [_tableview setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        _tableview;
    });
    [self.view addSubview:tableview];
    
    tableDataArr = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七"];
    
}
#pragma mark -UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 7;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 24.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImageView *headerview = [[UIImageView alloc] init];
    [headerview setFrame:CGRectMake(0, 0, 320, 24)];
    [headerview setImage:[UIImage imageNamed:@"images.bundle/tcar_snatchCellHead.png"]];
    
    UILabel *l_header = [[UILabel alloc] init];
    [l_header setFrame:headerview.frame];
    [l_header setText:@"    Date : 2014.04.05 周一"];
    [l_header setTextColor:[UIColor whiteColor]];
    [headerview addSubview:l_header];
    return headerview;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    SMSnatchTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[SMSnatchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}



@end
