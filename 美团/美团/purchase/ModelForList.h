//
//  ModelForList.h
//  美团
//
//  Created by lanou3g on 15/7/25.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelForList : NSObject

@property (nonatomic, strong) NSString *name;       //点名

@property (nonatomic, strong) NSString *addr;       //详细地址

@property (nonatomic, strong) NSString *areaName;   //地址

@property (nonatomic, strong) NSNumber *avgPrice;   //均价

@property (nonatomic, strong) NSNumber *lowestPricel; //最低消费

@property (nonatomic, strong) NSNumber *avgScore;   //平均评分

@property (nonatomic, strong) NSString *cateName;   // 类型

@property (nonatomic, strong) NSDictionary *extra;  // 额外 图标

@property (nonatomic, strong) NSString *featureMenus; //推荐菜

@property (nonatomic, strong) NSString *campaignTag; //优惠

@property (nonatomic, strong) NSString *frontImg;

@property (nonatomic, strong) NSString *introduction;

@property (nonatomic, strong) NSNumber *isWaimai;

@property (nonatomic, strong) NSString *phone;

@property (nonatomic, strong) NSString *poiid;

@property (nonatomic, strong) NSMutableArray *payAbstrct;

@end
