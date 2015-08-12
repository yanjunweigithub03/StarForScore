//
//  categoryView.m
//  美团
//
//  Created by lanou3g on 15/7/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "categoryView.h"
#import "Network.h"
#import "categoryModel.h"
#import "UIButton+WebCache.h"
#import "MpdelForAllCategory.h"

@interface categoryView ()

@property (nonatomic , strong) UIScrollView *headerView;

@property (nonatomic , strong) NSMutableArray *cateArray;
@end


@implementation categoryView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadData];
    }
    return self;
}

- (void)loadData
{
    self.dataArray = [NSMutableArray array];
    self.cateArray = [NSMutableArray array];
    __weak typeof(self) aSelf = self;
    [Network receivedDataWithURLString:CATEURL method:@"GET" body:nil block:^(id tempObj) {
        NSDictionary *dic = tempObj;
        NSDictionary *dataDic = [dic valueForKey:@"data"];
        NSArray *homeArr = [dataDic valueForKey:@"homepage"];
        for (NSDictionary *cateDic in homeArr) {
            categoryModel *model = [[categoryModel alloc] init];
            [model setValuesForKeysWithDictionary:cateDic];
            [aSelf.dataArray addObject:model];
        }
        [aSelf layoutView];
        
        // 全部分类
        // 热门
        NSDictionary *hotDic = [dataDic valueForKey:@"hot"];
        MpdelForAllCategory *hotModel = [[MpdelForAllCategory alloc] init];
        [hotModel setValuesForKeysWithDictionary:hotDic];
        
        [aSelf.cateArray addObject:hotModel];
        //美食
        NSArray *morepageArr = [dataDic valueForKey:@"morepage"];
       // NSDictionary *firstDic = morepageArr.firstObject;
        
        for (int i = 1; i < morepageArr.count; i ++) {
            NSDictionary *listDic = morepageArr[i];
            MpdelForAllCategory *listModel = [[MpdelForAllCategory alloc] init];
            [listModel setValuesForKeysWithDictionary:listDic];
            [aSelf.cateArray addObject:listModel];
        }
        
    }];
    
    
}

- (void)layoutView
{
    self.headerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, CGRectGetHeight(self.bounds))];
    self.headerView.contentSize = CGSizeMake(WIDTH * 2, 150);
    self.headerView.pagingEnabled = YES;
    self.headerView.alwaysBounceHorizontal = YES;
    self.headerView.directionalLockEnabled = YES;
    self.headerView.showsVerticalScrollIndicator = YES;
    self.headerView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.headerView];
    
    for (int i = 0; i < 2; i ++) {
        for (int j = 0; j < self.dataArray.count / 2; j ++) {
            UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
            btn.frame = CGRectMake(20 + j * (WIDTH / 4), 15 + i * 70, 40, 40);
            btn.tag = 800 + self.dataArray.count / 2 * i + j;
            [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:[self.dataArray[self.dataArray.count / 2 * i + j] iconUrl]] forState:(UIControlStateNormal)];
            [btn addTarget:self action:@selector(doClickButton:) forControlEvents:(UIControlEventTouchUpInside)];
            
            [self.headerView addSubview:btn];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15 + j * (WIDTH / 4), 55 + i * 70, 50, 21)];
            
            label.text = [self.dataArray[self.dataArray.count / 2 * i + j] name];
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont systemFontOfSize:12.0];
            
            [self.headerView addSubview:label];
            
        }
    }
}


- (void)doClickButton:(UIButton *)btn
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickButton:array:)]) {
        [self.delegate clickButton:btn array:self.cateArray];
    }
}


@end
