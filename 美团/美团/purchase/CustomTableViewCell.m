//
//  CustomTableViewCell.m
//  美团
//
//  Created by lanou3g on 15/7/25.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self layoutTableViewCell];
    }
    return self;
}


- (void)layoutTableViewCell
{
    self.iconImageView = [[UIImageView alloc] init];
    
    self.titleLabel = [[UILabel alloc] init];
    self.sorceLabel = [[UILabel alloc] init];
    self.priceLabel = [[UILabel alloc] init];
    self.addrLabel  = [[UILabel alloc] init];
    self.typeLabel  = [[UILabel alloc] init];
    self.PayLabel   = [[UILabel alloc] init];
    self.preferentialLabel = [[UILabel alloc] init];
    
    self.extraIcon1 = [[UIImageView alloc] init];
    self.extraIcon2 = [[UIImageView alloc] init];
    self.extraIcon3 = [[UIImageView alloc] init];
    self.payImage   = [[UIImageView alloc] init];
    
    self.titleLabel.font = [UIFont boldSystemFontOfSize:14.0];
    self.sorceLabel.font = [UIFont systemFontOfSize:12.0];
    self.priceLabel.font = [UIFont systemFontOfSize:12.0];
    self.typeLabel.font  = [UIFont systemFontOfSize:12.0];
    self.addrLabel.font  = [UIFont systemFontOfSize:12.0];
    self.PayLabel.font   = [UIFont systemFontOfSize:12.0];
    self.preferentialLabel.font = [UIFont systemFontOfSize:10.0];
    
    self.sorceLabel.textColor = [UIColor orangeColor];
    
    self.priceLabel.textAlignment = NSTextAlignmentRight;
    self.addrLabel.textAlignment  = NSTextAlignmentRight;
    
    self.preferentialLabel.textAlignment = NSTextAlignmentCenter;
    self.preferentialLabel.textColor = [UIColor orangeColor];
    
    [self.contentView addSubview:self.iconImageView];
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.sorceLabel];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.addrLabel];
    [self.contentView addSubview:self.typeLabel];
    [self.contentView addSubview:self.PayLabel];
    [self.contentView addSubview:self.preferentialLabel];
    
    [self.contentView addSubview:self.extraIcon1];
    [self.contentView addSubview:self.extraIcon2];
    [self.contentView addSubview:self.extraIcon3];
    [self.contentView addSubview:self.payImage];
    
    
    lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:lineView];
    
    starView = [[StarsForScoreView alloc] init];
    [self.contentView addSubview:starView];
    
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    lineView.frame = CGRectMake(80, 70, WIDTH - 80, 1);
    self.iconImageView.frame = CGRectMake(8, 8, 65, 65);
    
    self.titleLabel.frame = CGRectMake(80, 8, WIDTH - 80, 24);
    self.sorceLabel.frame = CGRectMake(165, 34, 50, 15);
    self.priceLabel.frame = CGRectMake(WIDTH - 110, 34, 100, 15);
    self.typeLabel.frame  = CGRectMake(80, 50, 100, 15);
    self.addrLabel.frame  = CGRectMake(WIDTH - 150, 50, 140, 15);
    
    self.preferentialLabel.frame = CGRectMake(33, 75, 40, 15);
    
    self.PayLabel.frame = CGRectMake(100, 75, WIDTH - 108, 15);
    self.payImage.frame = CGRectMake(80, 75, 15, 15);
    
    self.extraIcon1.frame = CGRectMake(WIDTH - 53, 8, 15, 15);
    self.extraIcon2.frame = CGRectMake(WIDTH - 38, 8, 15, 15);
    self.extraIcon3.frame = CGRectMake(WIDTH - 23, 8, 15, 15);
    
    starView.frame = CGRectMake(80, 34, 80, 15);
}


- (void)setListModel:(ModelForList *)listModel
{
    if (_listModel != listModel) {
        _listModel = listModel;
    }
    self.titleLabel.text = listModel.name;
    self.sorceLabel.text = [NSString stringWithFormat:@"%@分",[listModel.avgScore stringValue]];
    self.priceLabel.text = [NSString stringWithFormat:@"人均￥%@",[listModel.avgPrice stringValue]];
    self.typeLabel.text  = listModel.cateName;
    self.addrLabel.text  = listModel.areaName;
    self.preferentialLabel.text = listModel.campaignTag;
    if (self.preferentialLabel.text.length > 0) {
        self.preferentialLabel.layer.borderColor = [UIColor orangeColor].CGColor;
        self.preferentialLabel.layer.borderWidth = 1.0;
        self.preferentialLabel.layer.cornerRadius = 2.0;
    }else{
        self.preferentialLabel.layer.borderColor = [UIColor clearColor].CGColor;
    }
    
    [starView setupStarViewForScore:[listModel.avgScore floatValue]];
    
}



@end
