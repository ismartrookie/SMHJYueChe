//
//  SMShareCenter.h
//  SMHJYueChe
//
//  Created by smartrookie on 4/16/14.
//  Copyright (c) 2014 zdf. All rights reserved.
//

@class SMEnUser;
@interface SMShareCenter : NSObject

@property (assign, nonatomic) BOOL isLogin;
@property (strong, nonatomic) SMEnUser *user;
@property (strong, nonatomic) NSDictionary *timeSections;

/**
 * gets singleton object.
 * @return singleton
 */
+ (SMShareCenter*)sharedInstance;




@end
