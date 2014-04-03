//
//  SMMainViewController.m
//  SMHJYueChe
//
//  Created by administrator on 14-4-3.
//  Copyright (c) 2014年 zdf. All rights reserved.
//

#import "SMMainViewController.h"
#import "SMPortalUtile.h"


@interface SMMainViewController ()

@property (assign, atomic) BOOL hasBook;

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
    
    self.hasBook = NO;
}

- (void)testFunction:(UIButton *)sender
{
    NSString* yyrq;
    NSDate *now = [NSDate dateWithTimeIntervalSinceNow:60*60*24*8];
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    yyrq = [formatter stringFromDate:now];
    
    NSLog(@"当前时间为 ： %@",yyrq);
    NSLog(@"now = %@",now.description);
    
    NSString *xxzh = @"51168515"; //张东风
    
    NSArray *yysds = [NSArray arrayWithObjects:@"812",@"15",@"58", nil];
    
    dispatch_apply([yysds count], dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^(size_t i) {
        [SMPortalUtile haijiaYuYueCarsQuerywithYyrq:yyrq andYysd:[yysds objectAtIndex:i] andXxzh:xxzh andSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//            NSLog(@"可预约车辆 =  %@",operation.responseString);
            NSDictionary *respDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            int code = [[respDic objectForKey:@"code"] intValue];
            if (code == 0) {
                NSArray *cars = [[respDic objectForKey:@"data"] objectForKey:@"Result"];
                dispatch_apply([cars count], dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t j) {
                    if (!_hasBook) {    //判断是否已预约成功
                        NSString *CNBH = [[cars objectAtIndex:j] objectForKey:@"CNBH"];
                        [SMPortalUtile haijiaYuYueCarwithXxzh:xxzh andClbh:CNBH andYyrq:yyrq andYysd:[yysds objectAtIndex:i] andSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                            NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                            int code = [[resDict objectForKey:@"code"] intValue];
                            if (code == 0) {
                                self.hasBook = YES;
                                [NSString stringWithFormat:@"预约成功 车辆号:%@ 时段:%@",CNBH,[yysds objectAtIndex:i]];
                                UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"恭喜您" message:@"预约成功 车辆号:" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                                [alertview show];
                            } else {
                                NSString *message = [resDict objectForKey:@"message"];
                                NSLog(@"......%@",message);
                            }
                        } andFailure:^(AFHTTPRequestOperation *operation, NSError *error) {
                            ;
                        }];
                    }
                    
                });
            } else {
                NSLog(@"ErroMessage = %@",[respDic objectForKey:@"message"]);
            }
        } andFailure:^(AFHTTPRequestOperation *operation, NSError *error) {
            ;
        }];
    });
}



@end
