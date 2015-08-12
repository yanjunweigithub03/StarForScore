//
//  CustomTableViewCell.h
//  美团
//
//  Created by lanou3g on 15/7/25.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelForList.h"
#import "ModelForPay.h"
#import "StarsForScoreView.h"

@interface CustomTableViewCell : UITableViewCell
{
    StarsForScoreView *starView;
    UIView *lineView;
}

@property (nonatomic , strong) UIImageView *iconImageView;

@property (nonatomic , strong) UILabel *titleLabel;

@property (nonatomic , strong) UIImageView *extraIcon1;

@property (nonatomic , strong) UIImageView *extraIcon2;

@property (nonatomic , strong) UIImageView *extraIcon3;

@property (nonatomic , strong) UILabel *sorceLabel;

@property (nonatomic , strong) UILabel *priceLabel;

@property (nonatomic , strong) UILabel *typeLabel;

@property (nonatomic , strong) UILabel *addrLabel;

@property (nonatomic , strong) UILabel *preferentialLabel;//优惠

@property (nonatomic , strong) UILabel *PayLabel;

@property (nonatomic , strong) UIImageView *payImage;

@property (nonatomic , strong) ModelForList *listModel;

@end
