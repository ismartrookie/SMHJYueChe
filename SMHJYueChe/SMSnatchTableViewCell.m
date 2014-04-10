//
//  SMSnatchTableViewCell.m
//  SMHJYueChe
//
//  Created by smartrookie on 4/10/14.
//  Copyright (c) 2014 zdf. All rights reserved.
//

#import "SMSnatchTableViewCell.h"

@interface SMSnatchTableViewCell() {
    
    UILabel *l_yysd;
    UIButton *btn_check;
    UILabel *l_sl;
    UIButton *btn_yy;
}

@end

@implementation SMSnatchTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
        UIImageView *bottomLine = [[UIImageView alloc] init];
        [bottomLine setFrame:CGRectMake(0, 38, 320, 2)];
        [bottomLine setImage:[UIImage imageNamed:@"images.bundle/tcar_snatchCelline.png"]];
        [self.contentView addSubview:bottomLine];
        
        l_yysd = [[UILabel alloc] init];
        [l_yysd setFrame:CGRectMake(10, 5, 100, 30)];
        [l_yysd setText:@"08:00-12:00"];
        [l_yysd setTextAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:l_yysd];
        
        btn_check = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_check setFrame:CGRectMake(130, 7, 33, 26)];
        [btn_check setBackgroundImage:[UIImage imageNamed:@"images.bundle/tcar_selected.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:btn_check];
        
        l_sl = [[UILabel alloc] init];
        [l_sl setFrame:CGRectMake(180, 5, 45, 30)];
        [l_sl setBackgroundColor:[UIColor clearColor]];
        [l_sl setText:@"256"];
        [self.contentView addSubview:l_sl];
        
        btn_yy = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_yy setFrame:CGRectMake(240, 8, 60, 24)];
        [btn_yy setBackgroundImage:[UIImage imageNamed:@"images.bundle/tcar_snatchCarBtn.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:btn_yy];

    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
