//
//  SMViewController.m
//  SMHJYueChe
//
//  Created by administrator on 14-4-1.
//  Copyright (c) 2014年 SM. All rights reserved.
//

#import "SMViewController.h"
#import "AFNetworking.h"

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
    
    tableDataArr = @[@"user/stulogin",@"isbinding",@"system/login",@"ClYyTimeSectionUIQuery2",@"/KM2/ClYyCars2",@"/KM2/ClYyAddByMutil"];
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
            NSString *loginStr = @"http://xinyue.bjxueche.net:8005/User/isbinding?username=8777866";
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
            
        }
            break;
        case 7:{
            
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

- (void)testFunction:(UIButton *)sender
{
    NSLog(@"Hello Button!");
    
   }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
