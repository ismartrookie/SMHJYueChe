//
//  SMEnUser.m
//  SMHJYueChe
//
//  Created by administrator on 14-4-1.
//  Copyright (c) 2014年 SM. All rights reserved.
//

#import "SMEnUser.h"

@implementation SMEnUser




- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_userName forKey:@"_userName"];
    [aCoder encodeObject:_phoneNum forKey:@"_phoneNum"];
    [aCoder encodeObject:_nickName forKey:@"_nickName"];
    [aCoder encodeObject:_email forKey:@"_email"];
    [aCoder encodeObject:_password forKey:@"_password"];
    [aCoder encodeObject:_xxzh forKey:@"_xxzh"];
    [aCoder encodeObject:_jgid forKey:@"_jgid"];
    [aCoder encodeObject:_webapiurl forKey:@"_webapiurl"];
    [aCoder encodeObject:_xybh forKey:@"_xybh"];
    [aCoder encodeObject:_sfzh forKey:@"_sfzh"];
    [aCoder encodeObject:_iconpath forKey:@"_iconpath"];
    [aCoder encodeObject:_username forKey:@"_username"];
    [aCoder encodeObject:_phonenum forKey:@"_phonenum"];
    [aCoder encodeObject:_nickname forKey:@"_nickname"];
    [aCoder encodeObject:_qquid forKey:@"_qquid"];
    [aCoder encodeObject:_sinauid forKey:@"_sinauid"];
    [aCoder encodeObject:_apiurl forKey:@"_apiurl"];
    [aCoder encodeObject:_jxmc forKey:@"_jxmc"];
    [aCoder encodeObject:_xm forKey:@"_xm"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        _userName = [aDecoder decodeObjectForKey:@"_userName"];
        _phoneNum = [aDecoder decodeObjectForKey:@"_phoneNum"];
        _nickName = [aDecoder decodeObjectForKey:@"_nickName"];
        _email = [aDecoder decodeObjectForKey:@"_email"];
        _password = [aDecoder decodeObjectForKey:@"_password"];
        _xxzh = [aDecoder decodeObjectForKey:@"_xxzh"];
        _jgid = [aDecoder decodeObjectForKey:@"_jgid"];
        _webapiurl = [aDecoder decodeObjectForKey:@"_webapiurl"];
        _xybh = [aDecoder decodeObjectForKey:@"_xybh"];
        _sfzh = [aDecoder decodeObjectForKey:@"_sfzh"];
        _iconpath = [aDecoder decodeObjectForKey:@"_iconpath"];
        _username = [aDecoder decodeObjectForKey:@"_username"];
        _phonenum = [aDecoder decodeObjectForKey:@"_phonenum"];
        _nickname = [aDecoder decodeObjectForKey:@"_nickname"];
        _qquid = [aDecoder decodeObjectForKey:@"_qquid"];
        _sinauid = [aDecoder decodeObjectForKey:@"_sinauid"];
        _apiurl = [aDecoder decodeObjectForKey:@"_apiurl"];
        _jxmc = [aDecoder decodeObjectForKey:@"_jxmc"];
        _xm = [aDecoder decodeObjectForKey:@"_xm"];
    }
    return self;
}


@end
