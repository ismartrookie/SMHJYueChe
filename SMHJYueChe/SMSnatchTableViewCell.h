//
//  SMSnatchTableViewCell.h
//  SMHJYueChe
//
//  Created by smartrookie on 4/10/14.
//  Copyright (c) 2014 zdf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMEntity/SMEnUIDatas.h"

@interface SMSnatchTableViewCell : UITableViewCell

@property (strong, nonatomic) UILabel *l_yysd;
@property (strong, nonatomic) UIButton *btn_check;
@property (strong, nonatomic) UILabel *l_sl;
@property (strong, nonatomic) UIButton *btn_yy;

@property (strong, nonatomic) SMEnUIDatas *uiData;
@property (assign, nonatomic) BOOL isSelected;

@end
