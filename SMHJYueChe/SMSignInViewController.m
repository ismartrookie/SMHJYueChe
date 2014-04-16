//
//  SMSignInViewController.m
//  SMHJYueChe
//
//  Created by administrator on 14-4-2.
//  Copyright (c) 2014年 zdf. All rights reserved.
//

#import "SMSignInViewController.h"
#import "SMMainViewController.h"
#import "SMPortalUtile.h"
#import "SVProgressHUD.h"
#import "SMSnatchCarViewController.h"
#import "SMEnUser.h"
#import "SMShareCenter.h"

@interface SMSignInViewController()

@property (strong, nonatomic) UITextField *tf_account;
@property (strong, nonatomic) UITextField *tf_password;

@end

@implementation SMSignInViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *backgroundv = [[UIImageView alloc] init];
    [backgroundv setFrame:CGRectMake(0, 0, 320, 568)];
    [backgroundv setImage:[UIImage imageNamed:@"tcar_background.png"]];
    [self.view addSubview:backgroundv];
    
    UIImageView *logov = [[UIImageView alloc] init];
    [logov setFrame:CGRectMake(0, 60, 320, 101)];
    [logov setImage:[UIImage imageNamed:@"tcar_logo.png"]];
    [self.view addSubview:logov];
    
    UIImageView *inputbv = [[UIImageView alloc] init];
    [inputbv setFrame:CGRectMake(0, CGRectGetMaxY(logov.frame), 320, 94)];
    [inputbv setImage:[UIImage imageNamed:@"tcar_inputfield.png"]];
    [inputbv setUserInteractionEnabled:YES];
    [self.view addSubview:inputbv];
    
    _tf_account = [[UITextField alloc] init];
    [_tf_account setFrame:CGRectMake(10, 2, 300, 41)];
    [_tf_account setBackgroundColor:[UIColor clearColor]];
    [_tf_account setPlaceholder:@"用户名"];
    [_tf_account setTextAlignment:NSTextAlignmentCenter];
    [_tf_account setKeyboardType:UIKeyboardTypeNumberPad];
    [_tf_account setClearButtonMode:UITextFieldViewModeWhileEditing];
    [inputbv addSubview:_tf_account];
    
    _tf_password = [[UITextField alloc] init];
    [_tf_password setFrame:CGRectMake(10, 48, 300, 42)];
    [_tf_password setBackgroundColor:[UIColor clearColor]];
    [_tf_password setPlaceholder:@"密码"];
    [_tf_password setTextAlignment:NSTextAlignmentCenter];
    [_tf_password setSecureTextEntry:YES];
    [_tf_password setClearButtonMode:UITextFieldViewModeWhileEditing];
    [inputbv addSubview:_tf_password];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setFrame:CGRectMake(15, CGRectGetMaxY(inputbv.frame)+20, 290, 42)];
    [loginBtn setImage:[UIImage imageNamed:@"tcar_loginbtn.png"] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(signInFunction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    UIButton *forgetpwBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [forgetpwBtn setFrame:CGRectMake(0, CGRectGetMaxY(self.view.frame)-50, 80, 30)];
    [forgetpwBtn setImage:[UIImage imageNamed:@"tcar_forgetpw.png"] forState:UIControlStateNormal];
    [self.view addSubview:forgetpwBtn];
    
    UIButton *newuserBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [newuserBtn setFrame:CGRectMake(320-80, CGRectGetMaxY(self.view.frame)-50, 80, 30)];
    [newuserBtn setImage:[UIImage imageNamed:@"tcar_newuser.png"] forState:UIControlStateNormal];
    [self.view addSubview:newuserBtn];

    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    [backItem setTitle:@"返回"];
    [backItem setTintColor:[UIColor blackColor]];
    [self.navigationItem setBackBarButtonItem:backItem];
    
    NSString *account = [[NSUserDefaults standardUserDefaults] objectForKey:@"account"];
    NSString *password = [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];

    if (account && password) {
        [_tf_account setText:account];
        [_tf_password setText:password];
    }
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)signInFunction:(UIButton *)sender
{
    [self resignFirstResponder];
    NSString *account = _tf_account.text;
    NSString *password = _tf_password.text;
    
//    SMSnatchCarViewController *snavctrl = [[SMSnatchCarViewController alloc] init];
//    UINavigationController *navctrl = [[UINavigationController alloc] initWithRootViewController:snavctrl];
//    [self presentViewController:navctrl animated:YES completion:^{
//        
//    }];
    if (!account || [account isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"用户名不能为空"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    } else if (!password || [password isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"密码不能为空"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    } else {
        
        [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeClear];
        [SMPortalUtile studentLoginwithUserName:account andPassword:password andSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"operation = %@",dic);
            int code = [dic[@"code"] intValue];
            if (code) {
                NSString *message = dic[@"message"];
                [SVProgressHUD dismissWithError:message afterDelay:2];
            } else {
                //保存最后一次登录账号
                [[NSUserDefaults standardUserDefaults] setObject:account forKey:@"account"];
                [[NSUserDefaults standardUserDefaults] setObject:password forKey:@"password"];

                //登录成功
                SMEnUser *user = [[SMEnUser alloc] init];
                NSDictionary *data = dic[@"data"];
                for (NSString *key in data.keyEnumerator) {
                    [user setValue:data[key] forKey:key];
                }
                [SMPortalUtile haijiaSystemLoginwithUserName:nil andPassword:nil andSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                    NSDictionary *hjsyslDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                    int code = [hjsyslDic[@"code"] intValue];
                    if (code == 0) {
                        [SMPortalUtile haijiaYuYueTimeSectionQuerywithXxzh:user.xxzh andSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                            [SVProgressHUD dismiss];
                            NSLog(@"TimeSectionQuery Info = %@",operation.responseString);
                            //开始跳转
//                            SMSnatchCarViewController *snavctrl = [[SMSnatchCarViewController alloc] init];
//                            [self.navigationController pushViewController:snavctrl animated:YES];
//                            snavctrl.user = user;
//
                            NSDictionary *timeSections = [[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil] objectForKey:@"data"];
                            [[SMShareCenter sharedInstance] setIsLogin:YES];
                            [[SMShareCenter sharedInstance] setUser:user];
                            [[SMShareCenter sharedInstance] setTimeSections:timeSections];
                            [self dismissViewControllerAnimated:NO completion:^{
                            }];
                            
                        } andFailure:^(AFHTTPRequestOperation *operation, NSError *error) {
                            [SVProgressHUD dismissWithError:@"TimeSection 查询异常" afterDelay:2];
                        }];
                    } else {
                        [SVProgressHUD dismissWithError:@"登录异常" afterDelay:2];
                    }
                } andFailure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    ;
                }];
                
                
            }
        } andFailure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"error = %@",error.description);
            [SVProgressHUD dismissWithError:@"登录错误" afterDelay:2];
        }];
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
