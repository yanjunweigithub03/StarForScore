//
//  MovieTableViewCell.m
//  美团
//
//  Created by lanou3g on 15/7/26.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MovieTableViewCell.h"

@implementation MovieTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.label = [[UILabel alloc] init];
        [self.contentView addSubview:self.label];
    }
    return self;    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = [NSString widthForSingleString:self.priceLabel.text size:CGSizeMake(100, 21) font:[UIFont boldSystemFontOfSize:16.0]];
    
    self.priceLabel.frame = CGRectMake(12, 56, width, 21);
    self.label.frame = CGRectMake(12 + width, 58, 30, 17);
    self.titleLabel.frame = CGRectMake(12, 10, WIDTH - 75, 21);
    self.addrLabel.frame  =  CGRectMake(WIDTH - 150, 58, 140, 17);

    starView.frame = CGRectMake(12, 33, 80, 15);
    lineView.frame = CGRectZero;
    
    self.priceLabel.font = [UIFont boldSystemFontOfSize:16.0];
    self.priceLabel.textColor = [UIColor cyanColor];
    self.priceLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.font = [UIFont systemFontOfSize:16.0];
    self.label.font  = [UIFont systemFontOfSize:12.0];
    
    
}

- (void)setModel:(ModelForList *)model
{
    if (_model != model) {
        _model = model;
    }
    self.label.text  = @"元起";
    
    self.titleLabel.text = model.name;
    self.addrLabel.text  = model.areaName;
    self.priceLabel.text = [model.avgPrice stringValue];
    
    [starView setupStarViewForScore:[model.avgScore floatValue]];
    
}


@end
