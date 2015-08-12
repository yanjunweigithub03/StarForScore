//
//  categoryModel.m
//  美团
//
//  Created by lanou3g on 15/7/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "categoryModel.h"

@implementation categoryModel


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.uid = value;
    }
}

@end
