//
//  SMSnatchCarViewController.m
//  SMHJYueChe
//
//  Created by smartrookie on 4/9/14.
//  Copyright (c) 2014 zdf. All rights reserved.
//

#import "SMSnatchCarViewController.h"

@interface SMSnatchCarViewController ()<UITableViewDelegate,UITableViewDataSource> {
    UITableView *tableview;
    NSArray *tableDataArr;
}

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
    
    
    
    tableview = ({
        UITableView *_tableview = [[UITableView alloc] init];
        [_tableview setDelegate:self];
        [_tableview setDataSource:self];
        [_tableview setFrame:CGRectMake(0, 240, 320, CGRectGetMaxY(self.view.frame)-150-240)];
        _tableview;
    });
    [self.view addSubview:tableview];
    
    tableDataArr = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七"];
    
    
    
    
}
#pragma mark -UITableViewDelegate
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
    UITableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell.textLabel setText:[tableDataArr objectAtIndex:indexPath.row]];
    return cell;
}



@end
