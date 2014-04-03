//
//  SMSignInViewController.m
//  SMHJYueChe
//
//  Created by administrator on 14-4-2.
//  Copyright (c) 2014年 zdf. All rights reserved.
//

#import "SMSignInViewController.h"
#import "SMMainViewController.h"

@interface SMSignInViewController()

@property (strong, nonatomic) UITextField *tf_account;
@property (strong, nonatomic) UITextField *tf_password;

@end

@implementation SMSignInViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"登录界面"];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    [backItem setTitle:@"返回"];
    [self.navigationItem setBackBarButtonItem:backItem];
    
    _tf_account = [[UITextField alloc] init];
    [_tf_account setFrame:CGRectMake(50, 100, 220, 40)];
    [_tf_account setBackgroundColor:[UIColor yellowColor]];
    [_tf_account setBorderStyle:UITextBorderStyleLine];
    [_tf_account setPlaceholder:@"车友号"];
    [_tf_account setKeyboardType:UIKeyboardTypeNumberPad];
    [self.view addSubview:_tf_account];
    
    _tf_password = [[UITextField alloc] init];
    [_tf_password setFrame:CGRectMake(50, 150, 220, 40)];
    [_tf_password setBackgroundColor:[UIColor yellowColor]];
    [_tf_password setBorderStyle:UITextBorderStyleLine];
    [_tf_password setPlaceholder:@"密码"];
    [_tf_password setSecureTextEntry:YES];
    [self.view addSubview:_tf_password];
    
    UIButton *btn_login = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn_login setFrame:CGRectMake(50, 240, 220, 40)];
    [btn_login setTitle:@"登录" forState:UIControlStateNormal];
    [btn_login addTarget:self action:@selector(signInFunction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_login];
}

- (void)signInFunction:(UIButton *)sender
{
    NSString *account = _tf_account.text;
    NSString *password = _tf_password.text;
    
    account = @"111111";
    password = @"111111";
    
    if (!account || [account isEqualToString:@""]
        || !password || [password isEqualToString:@""]) {
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:nil message:@"登录号或密码不能为空" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertview show];
    } else {
        SMMainViewController *mainctrl = [[SMMainViewController alloc] init];
        [self.navigationController pushViewController:mainctrl animated:YES];
    }
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self resignFirstResponder];
}

- (BOOL)resignFirstResponder
{
    [_tf_account resignFirstResponder];
    [_tf_password resignFirstResponder];
    return [super resignFirstResponder];
}


@end
