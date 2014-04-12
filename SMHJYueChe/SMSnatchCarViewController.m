//
//  SMSnatchCarViewController.m
//  SMHJYueChe
//
//  Created by smartrookie on 4/9/14.
//  Copyright (c) 2014 zdf. All rights reserved.
//

#import "SMSnatchCarViewController.h"
#import "SMSnatchTableViewCell.h"
#import "SMEnUIDatas.h"

@interface SMSnatchCarViewController ()<UITableViewDelegate,UITableViewDataSource> {
    UITableView *tableview;
    NSArray *tableDataArr;
    
    UILabel *l_nowtime;
    UILabel *l_daytime;
    
    UIButton *snatchBtn;
    
    NSArray *xnsdList;
    NSArray *yyrqList;
    NSArray *uIDatas;
    
    NSMutableArray *selectedTag;
}

@end

@implementation SMSnatchCarViewController

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)setTimeSections:(NSDictionary *)timeSections
{
    _timeSections = timeSections;
    if (timeSections) {
        xnsdList = timeSections[@"XnsdList"];
        yyrqList = timeSections[@"YyrqList"];
        uIDatas = timeSections[@"UIDatas"];
        
        selectedTag = [NSMutableArray arrayWithCapacity:[uIDatas count]];
        for (int i = 0; i < [uIDatas count]; i++) {
            [selectedTag addObject:@false];
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"抢车界面"];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:2.0f/255 green:115.0f/255 blue:195.0f/255 alpha:1]];
    
    UIImageView *backgroundv = [[UIImageView alloc] init];
    [backgroundv setFrame:CGRectMake(0, 0, 320, 568)];
    [backgroundv setImage:[UIImage imageNamed:@"tcar_background.png"]];
    [self.view addSubview:backgroundv];
    
    UIImageView *clocklogo = [[UIImageView alloc] init];
    [clocklogo setFrame:CGRectMake(0, 0, 48, 48)];
    [clocklogo setCenter:CGPointMake(160, 100)];
    [clocklogo setImage:[UIImage imageNamed:@"tcar_clocklogo.png"]];
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
    [snatchBtn setBackgroundImage:[UIImage imageNamed:@"snatchCarBtn.png"] forState:UIControlStateNormal];
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

    self.timeSections = self.timeSections;
}
#pragma mark -UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [yyrqList count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [xnsdList count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 24.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImageView *headerview = [[UIImageView alloc] init];
    [headerview setFrame:CGRectMake(0, 0, 320, 24)];
    [headerview setImage:[UIImage imageNamed:@"tcar_snatchCellHead.png"]];
    
    UILabel *l_header = [[UILabel alloc] init];
    [l_header setFrame:headerview.frame];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSString *yyrq =[yyrqList[section] objectForKey:@"Yyrq"];
    NSDate *date = [formatter dateFromString:yyrq];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [formatter stringFromDate:date];
    
    [l_header setText:[NSString stringWithFormat:@"    Date : %@ %@",dateString,[yyrqList[section] objectForKey:@"DisplayWeek"]]];
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
        [cell.btn_check addTarget:self action:@selector(cellCheckBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    [cell.l_yysd setText:[xnsdList[row] objectForKey:@"XnsdName"]];
    
    NSInteger number = (section * 3) +row;
    [cell.btn_check setTag:number];
    
    NSDictionary *uiDataDic = [uIDatas objectAtIndex:number];
    SMEnUIDatas *uiData = [[SMEnUIDatas alloc] init];
    [uiData setYyrq:[uiDataDic objectForKey:@"Yyrq"]];
    [uiData setXnsd:[uiDataDic objectForKey:@"Xnsd"]];
    [uiData setSL:[[uiDataDic objectForKey:@"SL"] intValue]];
    [uiData setIsBpked:[[uiDataDic objectForKey:@"IsBpked"] boolValue]];
    
    NSLog(@"cell isBpked = %d  andnumber = %d",uiData.IsBpked,(int)number);
    
    [cell setUiData:uiData];
    cell.isSelected = [[selectedTag objectAtIndex:number] boolValue];
    
    return cell;
}

- (void)cellCheckBtnAction:(UIButton *)sender
{
    BOOL selected = [selectedTag[sender.tag] boolValue];
    [selectedTag replaceObjectAtIndex:sender.tag withObject:[NSNumber numberWithBool:!selected]];
    [tableview reloadData];
}



@end
