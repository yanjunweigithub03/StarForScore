//
//  CategoryTableViewCell.m
//  美团
//
//  Created by lanou3g on 15/7/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "CategoryTableViewCell.h"

@interface CategoryTableViewCell ()



@end
@implementation CategoryTableViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
    }
    return self;
}

- (void)setModel:(MpdelForAllCategory *)model
{
    if (_model != model) {
        _model = model;
    }
    NSArray *modelArray = [NSArray arrayWithArray:model.aList];
    int num = 0;
    int n = 0;
    if (modelArray.count % 4 == 0) {
        num = (int)modelArray.count / 4;
    } else {
        num = (int)modelArray.count / 4 + 1;
    }
    for (int i = 0; i < num; i ++) {
        for (int j = 0; j < 4; j ++) {
            UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
            btn.frame = CGRectMake(20 + (WIDTH - 40) / 4 * j, 0 + 22 * i, (WIDTH - 44) / 4, 21);
            btn.backgroundColor = [UIColor colorWithWhite:0.729 alpha:1.000];
            btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
            [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
            if (n < modelArray.count) {
                 [btn setTitle:[NSString stringWithFormat:@"%@", [modelArray[n ++] name]] forState:(UIControlStateNormal)];
                
            }else{
                [btn setTitle:[NSString stringWithFormat:@""] forState:(UIControlStateNormal)];
            }
           
            [self.contentView addSubview:btn];
        }
    }
}



@end
