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

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
//    SMViewController *vctrl = [[SMViewController alloc] init];
//    UINavigationController *navictrl = [[UINavigationController alloc] initWithRootViewController:vctrl];

    SMSignInViewController *signInvctrl = [[SMSignInViewController alloc] init];
//    UINavigationController *navictrl = [[UINavigationController alloc] initWithRootViewController:signInvctrl];
    [self.window setRootViewController:signInvctrl];
    
//    [self.window setRootViewController:navictrl];
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
