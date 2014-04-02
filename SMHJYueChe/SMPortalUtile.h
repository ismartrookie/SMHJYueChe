//
//  SMPortalUtile.h
//  SMHJYueChe
//
//  Created by smartrookie on 4/2/14.
//  Copyright (c) 2014 zdf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void (^success)(AFHTTPRequestOperation *operation,id responseObject);
typedef void (^failure)(AFHTTPRequestOperation *operation,NSError *error);

@interface SMPortalUtile : NSObject

+ (void)studentLoginwithUserName:(NSString *)username andPassword:(NSString *)password andSuccess:(success)success andFailure:(failure)failure;

+ (void)checkIsBindingwithUserName:(NSString *)username andSuccess:(success)success andFailure:(failure)failure;

+ (void)haijiaSystemLoginwithUserName:(NSString *)username andPassword:(NSString *)password andSuccess:(success)success andFailure:(failure)failure;

+ (void)haijiaYuYueTimeSectionQuerywithXxzh:(NSString *)xxzh andSuccess:(success)success andFailure:(failure)failure;

+ (void)haijiaYuYueCarsQuerywithYyrq:(NSString *)yyrq andYysd:(NSString *)yysd andXxzh:(NSString *)xxzh andSuccess:(success)success andFailure:(failure)failure;

+ (void)haijiaYuYueCarwithXxzh:(NSString *)xxzh andClbh:(NSString *)clbh andYyrq:(NSString *)yyrq andYysd:(NSString *)yysd andSuccess:(success)success andFailure:(failure)failure;


@end
