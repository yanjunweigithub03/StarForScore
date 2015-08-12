//
//  MpdelForAllCategory.m
//  美团
//
//  Created by lanou3g on 15/7/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MpdelForAllCategory.h"
#import "categoryModel.h"

@implementation MpdelForAllCategory

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.cid = value;
    }
    if ([key isEqualToString:@"list"]) {
        self.aList = [NSMutableArray array];
        for (NSDictionary *dic in value) {
            categoryModel *model = [[categoryModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [self.aList addObject:model];
            //NSLog(@"------%@",model);
        }
    }
}

@end
