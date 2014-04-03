//
//  SMPortalUtile.m
//  SMHJYueChe
//
//  Created by smartrookie on 4/2/14.
//  Copyright (c) 2014 zdf. All rights reserved.
//

#import "SMPortalUtile.h"

#define   SM_XIN_YUE_BJXC_PORTAL      @"http://xinyue.bjxueche.net:8005"
#define   SM_HAI_JIA_BJXC_PORTAL      @"http://haijia.bjxueche.net:8001"

@interface SMPortalUtile()

@end

@implementation SMPortalUtile

+ (void)studentLoginwithUserName:(NSString *)username andPassword:(NSString *)password andSuccess:(success)success andFailure:(failure)failure
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *urlString = [NSString stringWithFormat:@"%@/user/stulogin?username=%@&password=%@&usertype=(null)&uid=(null)",SM_XIN_YUE_BJXC_PORTAL,username,password];
        NSURLRequest *loginRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:loginRequest];
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (success) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    success(operation,responseObject);
                });
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (failure) {
                dispatch_sync(dispatch_get_main_queue(), ^{
                    failure(operation,error);
                });
            }
        }];
        [operation start];
    });
}

+ (void)checkIsBindingwithUserName:(NSString *)username andSuccess:(success)success andFailure:(failure)failure
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *urlString = [NSString stringWithFormat:@"%@/User/isbinding?username=%@",SM_XIN_YUE_BJXC_PORTAL,username];
        NSURLRequest *loginRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:loginRequest];
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (success) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    success(operation,responseObject);
                });
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (failure) {
                dispatch_sync(dispatch_get_main_queue(), ^{
                    failure(operation,error);
                });
            }
        }];
        [operation start];
    });
}

+ (void)haijiaSystemLoginwithUserName:(NSString *)username andPassword:(NSString *)password andSuccess:(success)success andFailure:(failure)failure
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    
        NSString *urlString = [NSString stringWithFormat:@"%@/system/login?username=%@&password=%@",SM_HAI_JIA_BJXC_PORTAL,@"bjcsxq",@"bjcsxq2012"];
        NSURLRequest *loginRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:loginRequest];
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (success) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    success(operation,responseObject);
                });
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (failure) {
                dispatch_sync(dispatch_get_main_queue(), ^{
                    failure(operation,error);
                });
            }
        }];
        [operation start];
    });
}

+ (void)haijiaYuYueTimeSectionQuerywithXxzh:(NSString *)xxzh andSuccess:(success)success andFailure:(failure)failure
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSString *urlString = [NSString stringWithFormat:@"%@/KM2/ClYyTimeSectionUIQuery2?xxzh=%@",SM_HAI_JIA_BJXC_PORTAL,xxzh];
        NSURLRequest *loginRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:loginRequest];
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (success) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    success(operation,responseObject);
                });
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (failure) {
                dispatch_sync(dispatch_get_main_queue(), ^{
                    failure(operation,error);
                });
            }
        }];
        [operation start];
    });
}

+ (void)haijiaYuYueCarsQuerywithYyrq:(NSString *)yyrq andYysd:(NSString *)yysd andXxzh:(NSString *)xxzh andSuccess:(success)success andFailure:(failure)failure
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    
        NSString *urlString = [NSString stringWithFormat:@"%@/KM2/ClYyCars2?filters[yyrq]=%@&filters[xnsd]=%@&filters[xxzh]=%@&pageno=1&pagesize=1000",SM_HAI_JIA_BJXC_PORTAL,yyrq,yysd,xxzh];
        NSURLRequest *loginRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:loginRequest];
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (success) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    success(operation,responseObject);
                });
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (failure) {
                dispatch_sync(dispatch_get_main_queue(), ^{
                    failure(operation,error);
                });
            }
        }];
        [operation start];
    });
    
}

+ (void)haijiaYuYueCarwithXxzh:(NSString *)xxzh andClbh:(NSString *)clbh andYyrq:(NSString *)yyrq andYysd:(NSString *)yysd andSuccess:(success)success andFailure:(failure)failure
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    
        NSString *urlString = [NSString stringWithFormat:@"%@/KM2/ClYyAddByMutil?xxzh=%@&params=%@.%@.%@..&isJcsdYyMode=5",SM_HAI_JIA_BJXC_PORTAL,xxzh,clbh,yyrq,yysd];
        NSURLRequest *loginRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:loginRequest];
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (success) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    success(operation,responseObject);
                });
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (failure) {
                dispatch_sync(dispatch_get_main_queue(), ^{
                    failure(operation,error);
                });
            }
        }];
        [operation start];
    });
    
}


@end