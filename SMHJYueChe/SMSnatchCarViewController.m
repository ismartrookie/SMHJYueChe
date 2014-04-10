//
//  SMSnatchCarViewController.m
//  SMHJYueChe
//
//  Created by smartrookie on 4/9/14.
//  Copyright (c) 2014 zdf. All rights reserved.
//

#import "SMSnatchCarViewController.h"

@interface SMSnatchCarViewController ()

@end

@implementation SMSnatchCarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"抢车界面"];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:2.0f/255 green:115.0f/255 blue:195.0f/255 alpha:1]];
    
    UIImageView *backgroundv = [[UIImageView alloc] init];
    [backgroundv setFrame:CGRectMake(0, 0, 320, 568)];
    [backgroundv setImage:[UIImage imageNamed:@"images.bundle/tcar_background.png"]];
    [self.view addSubview:backgroundv];
    
    UIImageView *clocklogo = [[UIImageView alloc] init];
    [clocklogo setFrame:CGRectMake(0, 0, 48, 48)];
    [clocklogo setCenter:CGPointMake(160, 100)];
    [clocklogo setImage:[UIImage imageNamed:@"images.bundle/tcar_clocklogo.png"]];
    [self.view addSubview:clocklogo];
    
    
    
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
