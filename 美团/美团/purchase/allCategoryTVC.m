//
//  allCategoryTVC.m
//  美团
//
//  Created by lanou3g on 15/7/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "allCategoryTVC.h"
#import "MpdelForAllCategory.h"
#import "categoryModel.h"
#import "UIImageView+WebCache.h"
#import "CategoryTableViewCell.h"

@interface allCategoryTVC ()

@end

@implementation allCategoryTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[CategoryTableViewCell class] forCellReuseIdentifier:@"CELL"];
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSArray *coutArr = [self.dataArray[section] aList];
    return coutArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    MpdelForAllCategory *model = self.dataArray[indexPath.section];
    categoryModel *cModel = model.aList[indexPath.row];
    cell.textLabel.text = cModel.name;
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 21)];
    UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(3, 1, 19, 19)];
    [iconImageView sd_setImageWithURL:[NSURL URLWithString:[self.dataArray[section] iconUrl]]];
    [view addSubview:iconImageView];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(24, 1, 76, 19)];
    [view addSubview:label];
    label.font = [UIFont systemFontOfSize:14.0];
    label.text = [self.dataArray[section] name];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 23;
}

@end
