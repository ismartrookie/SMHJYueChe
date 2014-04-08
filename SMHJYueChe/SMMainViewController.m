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

@property (assign, nonatomic) BOOL hasBook;
@property (strong, nonatomic) NSString *xxzh;

@end

@implementation SMMainViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.xxzh = @"51168515";
    self.title = @"51168515/张东风 2014-04-12";
    
    
    //    NSString *xxzh = @"51168449"; //耿震
    //    NSString *xxzh = @"51168515"; //张东风
    //    NSString *xxzh = @"51168600"; //吴炯红
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIButton *testButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [testButton setFrame:CGRectMake(100, 200, 100, 40)];
    [testButton setTitle:@"开始约车" forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(testFunction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButton];
    
    self.hasBook = NO;
}

- (void)setHasBook:(BOOL)hasBook
{
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        _hasBook = hasBook;
    });
}

- (void)testFunction:(UIButton *)sender
{
    NSString* yyrq1;
    NSDate *now = [NSDate dateWithTimeIntervalSinceNow:60*60*24*7];
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    yyrq1 = [formatter stringFromDate:now];
    NSLog(@"当前时间为 ： %@",yyrq1);
    NSLog(@"now = %@",now.description);
    NSArray *yysds = [NSArray arrayWithObjects:@"812",@"15",@"58", nil];
    dispatch_apply([yysds count], dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^(size_t i) {
        [SMPortalUtile haijiaYuYueCarsQuerywithYyrq:yyrq1 andYysd:[yysds objectAtIndex:i] andXxzh:_xxzh andSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//            NSLog(@"可预约车辆 =  %@",operation.responseString);
            NSDictionary *respDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            int code = [[respDic objectForKey:@"code"] intValue];
            if (code == 0) {
                NSArray *cars = [[respDic objectForKey:@"data"] objectForKey:@"Result"];
                if ([cars count] == 0) {
                    NSLog(@"该时段没车了 = %@",[yysds objectAtIndex:i]);
                    return ;
                }
                dispatch_apply([cars count], dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t j) {
                    NSString *CNBH = [[cars objectAtIndex:j] objectForKey:@"CNBH"];
                    [self cyclerRequestYuyueCarWithXxzh:_xxzh andClbh:CNBH andYyrq:yyrq1 andYysd:[yysds objectAtIndex:i]];
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
            [NSString stringWithFormat:@"预约成功 车辆号:%@ 时段:%@",clbh,yysd];
            UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"恭喜您" message:@"预约成功 车辆号:" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alertview show];
        } else if (code == 1) {
            //非预约开放时间
            NSString *message = [resDict objectForKey:@"message"];
            if (!self.hasBook && [message isEqualToString:@"非预约开放时间\r\n\r\n"]) {
                [self cyclerRequestYuyueCarWithXxzh:xxzh andClbh:clbh andYyrq:yyrq andYysd:yysd];
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






@end
