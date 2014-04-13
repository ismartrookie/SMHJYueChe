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
#import "SMPortalUtile.h"
#import "SVProgressHUD.h"

@interface SMSnatchCarViewController ()<UITableViewDelegate,UITableViewDataSource> {
    UITableView *tableview;
    
    UILabel *l_nowtime;
    UILabel *l_daytime;
    
    UIButton *snatchBtn;
    
    NSArray *xnsdList;
    NSArray *yyrqList;
    NSArray *uIDatas;
    
    NSMutableArray *selectedTag;
}

@property (assign, nonatomic) BOOL isSnatchEnd;
@property (assign, nonatomic) int snatchCount;
@property (assign, nonatomic) BOOL hasBook;

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
    [snatchBtn addTarget:self action:@selector(snatchButtonFunction:) forControlEvents:UIControlEventTouchUpInside];
    
    
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

- (void)snatchButtonFunction:(UIButton *)sender
{
    NSMutableArray *needSnatchArr = [NSMutableArray array];
    for (int i = 0; i < [selectedTag count]; i++) {
        BOOL tag = [selectedTag[i] boolValue];
        if (tag) {
            [needSnatchArr addObject:uIDatas[i]];
        }
    }
//    NSLog(@"needSnatchArr = %@",needSnatchArr);
    if ([needSnatchArr count] == 0) {
        [SVProgressHUD showErrorWithStatus:@"你没有选择任何需要抢约的时段!" duration:2];
        return;
    }
    [SVProgressHUD showWithStatus:@"开始约车,手不要抖!" maskType:SVProgressHUDMaskTypeBlack];
    _snatchCount = 0;
    self.hasBook = NO;
    dispatch_apply([needSnatchArr count], dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^(size_t i) {
        
        NSString *xnsd =  [needSnatchArr[i] objectForKey:@"Xnsd"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
        NSString *yyrq =[needSnatchArr[i] objectForKey:@"Yyrq"];
        NSDate *date = [formatter dateFromString:yyrq];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        yyrq = [formatter stringFromDate:date];
        NSLog(@"yyrq = %@",yyrq);
        [SMPortalUtile haijiaYuYueCarsQuerywithYyrq:yyrq andYysd:xnsd andXxzh:_user.xxzh andSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSDictionary *respDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            int code = [[respDic objectForKey:@"code"] intValue];
            if (code == 0) {
                NSArray *cars = [[respDic objectForKey:@"data"] objectForKey:@"Result"];
                if ([cars count] == 0) {
                    if ([needSnatchArr count] == i+1 && _snatchCount == 0) {
                        _snatchCount = 1;
                        self.snatchCount--;
                    }
                    NSLog(@"该时段没车了 = %@",xnsd);
                    return ;
                }
                _snatchCount += [cars count];
                dispatch_apply([cars count], dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t j) {
                    NSString *CNBH = [[cars objectAtIndex:j] objectForKey:@"CNBH"];
                    [self cyclerRequestYuyueCarWithXxzh:_user.xxzh andClbh:CNBH andYyrq:yyrq andYysd:xnsd];
                });
            } else {
                NSLog(@"ErroMessage = %@",[respDic objectForKey:@"message"]);
            }
        } andFailure:^(AFHTTPRequestOperation *operation, NSError *error) {
            ;
        }];
    });
    
    
}

- (void)cyclerRequestYuyueCarWithXxzh:(NSString *)xxzh andClbh:(NSString *)clbh andYyrq:(NSString *)yyrq andYysd:yysd
{
    [SMPortalUtile haijiaYuYueCarwithXxzh:xxzh andClbh:clbh andYyrq:yyrq andYysd:yysd andSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        int code = [[resDict objectForKey:@"code"] intValue];
        if (code == 0) {
            //预约成功
            self.hasBook = YES;
            [SVProgressHUD dismiss];
            dispatch_async(dispatch_get_main_queue(), ^{
                [NSString stringWithFormat:@"预约成功 车辆号:%@ 时段:%@",clbh,yysd];
                UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"恭喜您" message:@"预约成功 车辆号:" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alertview show];
            });
        } else if (code == 1) {
            //非预约开放时间
            NSString *message = [resDict objectForKey:@"message"];
            if (!self.hasBook && [message isEqualToString:@"非预约开放时间\r\n\r\n"]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [SVProgressHUD setStatus:[NSString stringWithFormat:@"%@ 车号:%@ -- %@ 时段 -- %@",yyrq,clbh, message,yysd]];
                });
                [self cyclerRequestYuyueCarWithXxzh:xxzh andClbh:clbh andYyrq:yyrq andYysd:yysd];
            } else {
                self.snatchCount--;
            }
        } else {
            return ;
        }
    } andFailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (!self.hasBook) {
            [self cyclerRequestYuyueCarWithXxzh:xxzh andClbh:clbh andYyrq:yyrq andYysd:yysd];
        }
    }];
}

- (void)setSnatchCount:(int)snatchCount
{
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (_snatchCount == 1 && snatchCount <= 0) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [SVProgressHUD dismissWithError:@"很抱歉,此轮约车已经结束!" afterDelay:3];
            });
        }
        _snatchCount = snatchCount;
    });
    
}




@end
