//
//  RootTBC.m
//  美团
//
//  Created by lanou3g on 15/7/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "RootTBC.h"

#import "PurchaseViewController.h"
#import "AccidenceViewController.h"
#import "MerchantViewController.h"
#import "MineTableViewController.h"
#import "MoreTableViewController.h"

@interface RootTBC ()

@end

@implementation RootTBC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PurchaseViewController *purchase = [[PurchaseViewController alloc] init];
    UINavigationController *purchaseNav = [[UINavigationController alloc] initWithRootViewController:purchase];
    [purchaseNav.navigationBar setBarStyle:(UIBarStyleBlackOpaque)];
    purchase.tabBarItem.title = @"团购";
    purchase.tabBarItem.image = [UIImage imageNamed:@"iconfont-tuangou.png"];
    
    AccidenceViewController *accidence = [[AccidenceViewController alloc] init];
    UINavigationController *accidenceNav = [[UINavigationController alloc] initWithRootViewController:accidence];
    accidence.tabBarItem.title = @"上门";
    accidence.tabBarItem.image = [UIImage imageNamed:@"iconfont-fuwu.png"];
    
    MerchantViewController *merchant = [[MerchantViewController alloc] init];
    UINavigationController *merchantNav = [[UINavigationController alloc] initWithRootViewController:merchant];
    merchant.tabBarItem.title = @"商家";
    merchant.tabBarItem.image = [UIImage imageNamed:@"iconfont-shangjia.png"];
    
    MineTableViewController *mine = [[MineTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:mine];
    mine.tabBarItem.title = @"我的";
    mine.tabBarItem.image = [UIImage imageNamed:@"iconfont-wode.png"];
    
    MoreTableViewController *more = [[MoreTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    UINavigationController *moreNav = [[UINavigationController alloc] initWithRootViewController:more];
    more.tabBarItem.title = @"更多";
    more.tabBarItem.image = [UIImage imageNamed:@"iconfont-gengduo.png"];
    
    self.viewControllers = @[purchaseNav,accidenceNav,merchantNav,mineNav,moreNav];
    self.tabBar.tintColor = [UIColor cyanColor];
    
}

@end
