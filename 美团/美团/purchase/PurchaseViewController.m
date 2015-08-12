//
//  PurchaseViewController.m
//  美团
//
//  Created by lanou3g on 15/7/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "PurchaseViewController.h"
#import "Network.h"
#import "categoryView.h"
#import "categoryModel.h"

#import "allCategoryTVC.h"
#import "ListViewController.h"
#import "HotelTVC.h"

@interface PurchaseViewController ()<clickButtonDelegate>
{
    categoryView *cView;
}


@end

@implementation PurchaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setupView];
}

- (void)setupView
{
    cView = [[categoryView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, 150)];
    cView.delegate = self;
    cView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:cView];
}

- (void)clickButton:(UIButton *)btn array:(NSMutableArray *)cateArr
{
    NSLog(@"%ld",btn.tag);
    if (btn.tag == 815) {
        
        allCategoryTVC *allC = [[allCategoryTVC alloc] initWithStyle:(UITableViewStyleGrouped)];
        
        allC.dataArray = [NSArray arrayWithArray:cateArr];
        allC.navigationItem.title = @"全部分类";
        allC.view.backgroundColor = [UIColor whiteColor];
        
        [allC setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:allC animated:YES];
        
    } else {
        
        ListViewController *list = [[ListViewController alloc] init];
        if (btn.tag == 802) {
            list.URL = kHOTELURL;
        }else{
            list.listUrl = [[cView.dataArray[btn.tag - 800] uid] stringValue];
        }
        list.navigationItem.title = [cView.dataArray[btn.tag - 800] name];
        list.view.backgroundColor = [UIColor whiteColor];
        
        [list setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:list animated:YES];
    }
    
}




@end
