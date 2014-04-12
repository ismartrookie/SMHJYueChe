//
//  SMSnatchTableViewCell.m
//  SMHJYueChe
//
//  Created by smartrookie on 4/10/14.
//  Copyright (c) 2014 zdf. All rights reserved.
//

#import "SMSnatchTableViewCell.h"

@interface SMSnatchTableViewCell() {
    
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
        
        _l_yysd = [[UILabel alloc] init];
        [_l_yysd setFrame:CGRectMake(10, 5, 100, 30)];
        [_l_yysd setText:@"08:00-12:00"];
        [_l_yysd setTextAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:_l_yysd];
        
        _btn_check = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn_check setFrame:CGRectMake(130, 7, 33, 26)];
        [_btn_check setBackgroundImage:[UIImage imageNamed:@"images.bundle/tcar_selected.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:_btn_check];
        
        _l_sl = [[UILabel alloc] init];
        [_l_sl setFrame:CGRectMake(180, 5, 45, 30)];
        [_l_sl setBackgroundColor:[UIColor clearColor]];
        [_l_sl setText:@"256"];
        [self.contentView addSubview:_l_sl];
        
        _btn_yy = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn_yy setFrame:CGRectMake(240, 8, 60, 24)];
        [_btn_yy setBackgroundImage:[UIImage imageNamed:@"images.bundle/tcar_snatchCarBtn.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:_btn_yy];

    }
    return self;
}

- (void)setUiData:(SMEnUIDatas *)uiData
{
    [_l_sl setText:[NSString stringWithFormat:@"%d",(int)uiData.SL]];
    int sl = (int)uiData.SL;
    if (sl < 1) {
        [_btn_yy setBackgroundImage:[UIImage imageNamed:@"tcar_indicate_nocar.png"] forState:UIControlStateNormal];
        [_btn_yy setEnabled:NO];
    } else {
        [_btn_yy setBackgroundImage:[UIImage imageNamed:@"tcar_snatchCarBtn.png"] forState:UIControlStateNormal];
        [_btn_yy setEnabled:YES];
    }
    if (uiData.IsBpked) {
        [_btn_yy setBackgroundImage:[UIImage imageNamed:@"tcar_indicate_caring.png"] forState:UIControlStateNormal];
        [_btn_yy setEnabled:NO];
    } else {
        
    }
//    if (uiData.IsBpked) {
//        [self setBgofBtnyy];
//    }
    _uiData = uiData;
}

//- (void)setBgofBtnyy
//{
//    [_btn_yy setBackgroundImage:[UIImage imageNamed:@"images.bundle/tcar_indicate_caring.png"] forState:UIControlStateNormal];
//}

- (void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    if (isSelected) {
        [_btn_check setBackgroundImage:[UIImage imageNamed:@"images.bundle/tcar_selected.png"] forState:UIControlStateNormal];
    } else {
        [_btn_check setBackgroundImage:[UIImage imageNamed:@"images.bundle/tcar_noselect.png"] forState:UIControlStateNormal];
    }
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
