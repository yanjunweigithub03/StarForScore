//
//  MovieTableViewCell.h
//  美团
//
//  Created by lanou3g on 15/7/26.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "CustomTableViewCell.h"

#import "ModelForList.h"
#import "ModelForPay.h"

#import "NSString+height.h"

@interface MovieTableViewCell : CustomTableViewCell

@property (nonatomic , strong) UILabel *label;
@property (nonatomic , strong) ModelForList *model;

@end
