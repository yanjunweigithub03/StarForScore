//
//  categoryView.h
//  美团
//
//  Created by lanou3g on 15/7/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol clickButtonDelegate <NSObject>

@optional
- (void)clickButton:(UIButton *)btn array:(NSMutableArray *)cateArr;

@end

@interface categoryView : UIView

@property (nonatomic , assign) id<clickButtonDelegate> delegate;

@property (nonatomic , strong) NSMutableArray *dataArray;

@end
