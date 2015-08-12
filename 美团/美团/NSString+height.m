//
//  NSString+height.m
//  News
//
//  Created by lanou3g on 15/7/2.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "NSString+height.h"

@implementation NSString (height)

+ (CGFloat)heightForString:(NSString *)string size:(CGSize)size font:(UIFont *)font
{
    NSDictionary *dic = @{NSFontAttributeName:font};
    CGRect rect = [string boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dic context:nil];
    return rect.size.height;
}

+ (CGFloat)widthForSingleString:(NSString *)string size:(CGSize)size font:(UIFont *)font
{
    NSDictionary *dic = @{NSFontAttributeName:font};
    CGRect rect = [string boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dic context:nil];
    return rect.size.width;
}

@end
