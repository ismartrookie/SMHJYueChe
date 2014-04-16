//
//  AppDelegate.m
//  SMHJYueChe
//
//  Created by smartrookie on 4/1/14.
//  Copyright (c) 2014 zdf. All rights reserved.
//

#import "AppDelegate.h"
#import "SMViewController.h"
#import "SMSignInViewController.h"
#import "SMMainViewController.h"
#import "SMSnatchCarViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
//    SMViewController *vctrl = [[SMViewController alloc] init];
//    UINavigationController *navictrl = [[UINavigationController alloc] initWithRootViewController:vctrl];
//    [self.window setRootViewController:navictrl];
    
//    SMMainViewController *mainvctrl = [[SMMainViewController alloc] init];
//    UINavigationController *mnav = [[UINavigationController alloc] initWithRootViewController:mainvctrl];
//    [self.window setRootViewController:mnav];
    
//    SMSignInViewController *signInvctrl = [[SMSignInViewController alloc] init];
//    UINavigationController *navictrl = [[UINavigationController alloc] initWithRootViewController:signInvctrl];
//    [self.window setRootViewController:navictrl];
    
    
    //抢车界面
    SMSnatchCarViewController *snatchVctrl = [[SMSnatchCarViewController alloc] init];
    UINavigationController *navictrl = [[UINavigationController alloc] initWithRootViewController:snatchVctrl];
    [self.window setRootViewController:navictrl];
    
    
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{}

- (void)applicationDidEnterBackground:(UIApplication *)application
{}

- (void)applicationWillEnterForeground:(UIApplication *)application
{}

- (void)applicationDidBecomeActive:(UIApplication *)application
{}

- (void)applicationWillTerminate:(UIApplication *)application
{}

@end
