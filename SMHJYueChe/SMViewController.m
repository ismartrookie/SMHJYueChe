//
//  SMViewController.m
//  SMHJYueChe
//
//  Created by administrator on 14-4-1.
//  Copyright (c) 2014年 SM. All rights reserved.
//

#import "SMViewController.h"
#import "AFNetworking.h"
#import "SMEnYCBH.h"

@interface SMViewController ()<UITableViewDataSource,UITableViewDelegate> {
    UITableView *tableview;
    NSArray *tableDataArr;
}

@end

@implementation SMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"海驾接口测试"];
    
    tableview = ({
        UITableView *_tableview = [[UITableView alloc] init];
        [_tableview setFrame:CGRectMake(0, 0, 320, CGRectGetHeight(self.view.frame))];
        [_tableview setDataSource:self];
        [_tableview setDelegate:self];
        _tableview;
    });
    
    [self.view addSubview:tableview];
    
    tableDataArr = @[@"user/stulogin",@"isbinding",@"system/login",@"ClYyTimeSectionUIQuery2",@"/KM2/ClYyCars2",@"/KM2/ClYyAddByMutil",@"开始约车",@"查找可用车友号"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableDataArr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    [[cell textLabel] setText:[tableDataArr objectAtIndex:indexPath.row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:{
            NSString *loginStr = @"http://xinyue.bjxueche.net:8005/user/stulogin?username=8777866&password=wjh19890714&usertype=(null)&uid=(null)";
            NSURLRequest *loginRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:loginStr]];
            AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:loginRequest];
            [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"operationResponse = %@",operation.responseString);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"operation request Failure");
            }];
            [operation start];

        }
            break;
        case 1:{
            NSString *loginStr = @"http://xinyue.bjxueche.net:8005/User/isbinding?username=5670981";
            NSURLRequest *loginRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:loginStr]];
            AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:loginRequest];
            [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"operationResponse = %@",operation.responseString);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"operation request Failure");
            }];
            [operation start];

        }
            break;
        case 2:{
            NSString *loginStr = @"http://haijia.bjxueche.net:8001/system/login?username=bjcsxq&password=bjcsxq2012";
            NSURLRequest *loginRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:loginStr]];
            AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:loginRequest];
            [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"operationResponse = %@",operation.responseString);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"operation request Failure");
            }];
            [operation start];
        }
            break;
        case 3:{
            NSString *loginStr = @"http://haijia.bjxueche.net:8001/KM2/ClYyTimeSectionUIQuery2?xxzh=51168600";
            NSURLRequest *loginRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:loginStr]];
            AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:loginRequest];
            [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"operationResponse = %@",operation.responseString);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"operation request Failure");
            }];
            [operation start];
        }
            break;
        case 4:{
            NSString *loginStr = @"http://haijia.bjxueche.net:8001/KM2/ClYyCars2?filters%5Byyrq%5D=2014-04-02&filters%5Bxnsd%5D=812&filters%5Bxxzh%5D=51168600&pageno=1&pagesize=1000";
            NSURLRequest *loginRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:loginStr]];
            AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:loginRequest];
            [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"operationResponse = %@",operation.responseString);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"operation request Failure");
            }];
            [operation start];
        }
            break;
        case 5:{
            NSString *loginStr = @"http://haijia.bjxueche.net:8001/KM2/ClYyAddByMutil?xxzh=51168600&params=08090.2014-04-02.812..&isJcsdYyMode=5";
            NSURLRequest *loginRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:loginStr]];
            AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:loginRequest];
            [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"operationResponse = %@",operation.responseString);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"operation request Failure");
            }];
            [operation start];
        }
            break;
        case 6:{
            NSString *loginStr = @"http://haijia.bjxueche.net:8001/system/login?username=bjcsxq&password=bjcsxq2012";
            NSURLRequest *loginRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:loginStr]];
            AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:loginRequest];
            [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//                NSLog(@"operationResponse = %@",operation.responseString);
                NSDictionary *respDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                NSLog(@"系统账号登录成功!");
                int code = [[respDic objectForKey:@"code"] intValue];
                if (code == 0) {
                    //51168515  张东风
//                    NSString *xxzh = @"51168600"; 吴炯红
                    NSString *xxzh = @"51168515";
                    NSString *yyrq = @"2014-04-9";
                    NSString *yysd = @"812";
                    //上午  812
                    NSString *loginStr =[NSString stringWithFormat:@"http://haijia.bjxueche.net:8001/KM2/ClYyCars2?filters[yyrq]=%@&filters[xnsd]=%@&filters[xxzh]=%@&pageno=1&pagesize=1000",yyrq,yysd,xxzh];
                    NSURLRequest *loginRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:loginStr]];
                    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:loginRequest];
                    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                        NSLog(@"operationResponse = %@",operation.responseString);
                        NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                        NSArray *Result = [[dataDic objectForKey:@"data"] objectForKey:@"Result"];
                        
                        NSMutableArray *recBHs = [NSMutableArray arrayWithCapacity:[Result count]];
                        
                        for (int i = 0; i < [Result count]; i++) {
                            NSDictionary *dicOne = [Result objectAtIndex:i];
                            NSString *CNBH =[dicOne objectForKey:@"CNBH"];
                            NSLog(@"CNBH = %@",CNBH);
                            SMEnYCBH *enycbh = [[SMEnYCBH alloc] init];
                            enycbh.CNBH = CNBH;
                            [recBHs addObject:enycbh];
                        }
                        [self recursionYYCwithArr:recBHs withXxzh:xxzh withYyrq:yyrq withYysd:yysd];
                        
                    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                        NSLog(@"operation request Failure");
                    }];
                    [operation start];
                    
                    //下午  15
                    
                    //晚上  58
                    
                    
                    /*
                    NSString *loginStr = @"http://haijia.bjxueche.net:8001/KM2/ClYyTimeSectionUIQuery2?xxzh=51168600";
                    NSURLRequest *loginRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:loginStr]];
                    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:loginRequest];
                    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                        NSLog(@"查询Data成功");
                        
                        
                        
                        
                
                    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                        NSLog(@"operation request Failure");
                    }];
                    [operation start];
                    
                    */
                } else {
                    NSLog(@"系统账号登录失败!");
                }
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"operation request Failure");
            }];
            [operation start];
        }
            break;
        case 7:{
            //查询可用车友号
            int username = 5695982;
            for (int i = 1000; i < 3000; i++) {
                NSString *loginStr = [NSString stringWithFormat:@"http://xinyue.bjxueche.net:8005/User/isbinding?username=%5d",username+i];
                NSURLRequest *loginRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:loginStr]];
                AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:loginRequest];
                [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//                    NSLog(@"operationResponse = %@",operation.responseString);
                    NSDictionary *retData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                    int code = [[retData objectForKey:@"code"] intValue];
                    if (code == 0) {
                        NSLog(@"可用车友号为:%5d",username+i);
                    } else {
                        NSLog(@"code = %5d",username+i);
                    }
                    
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    NSLog(@"operation request Failure");
                }];
                [operation start];

            }
            NSLog(@"------ end --------");
            
            
        }
            break;
        case 8:{
            
        }
            break;
        case 9:{
            
        }
            break;
        case 10:{
            
        }
            break;
        case 11:{
            
        }
            break;
        case 12:{
            
        }
            break;
        case 13:{
            
        }
            break;
        case 14:{
            
        }
            break;
        case 15:{
            
        }
            break;
            
        default:
            break;
    }
}

- (void)recursionYYCwithArr:(NSMutableArray *)ycbhArr withXxzh:(NSString *)xxzh withYyrq:(NSString *)yyrq withYysd:(NSString *)yysd
{
    if ([ycbhArr count] <= 0) {
        NSLog(@"无可预约车辆!");
        return;
    }
    SMEnYCBH *ycbh = [ycbhArr objectAtIndex:0];
     NSString *loginStr = [NSString stringWithFormat:@"http://haijia.bjxueche.net:8001/KM2/ClYyAddByMutil?xxzh=%@&params=%@.%@.%@..&isJcsdYyMode=5",xxzh,ycbh.CNBH,yyrq,yysd];
     NSURLRequest *loginRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:loginStr]];
     AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:loginRequest];
     [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
     NSLog(@"operationResponse = %@",operation.responseString);
         NSDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
         int code = [[data objectForKey:@"code"] intValue];
         NSString *message = [data objectForKey:@"message"];
         NSLog(@"message = %@",message);
         if (code == 0) {
             return ;
         } else {
             [ycbhArr removeObject:ycbh];
             [self recursionYYCwithArr:ycbhArr withXxzh:xxzh withYyrq:yyrq withYysd:yysd];
         }
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
     NSLog(@"operation request Failure");
     }];
     [operation start];
     

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
