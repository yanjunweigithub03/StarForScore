//
//  ListViewController.m
//  美团
//
//  Created by lanou3g on 15/7/24.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ListViewController.h"

#import "Network.h"
#import "UIImageView+WebCache.h"

#import "CustomTableViewCell.h"
#import "MovieTableViewCell.h"

#import "ModelForPay.h"
#import "ModelForList.h"

@interface ListViewController ()<UITableViewDataSource , UITableViewDelegate>
{
    UIView *headerView;
}
@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSMutableArray *dataArray;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupHeaderView];
    [self loadData];
    
}

- (void)setupHeaderView
{
    headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, 30)];
    headerView.backgroundColor = [UIColor colorWithRed:0.889 green:0.931 blue:0.965 alpha:1.000];
    [self.view addSubview:headerView];
    NSString *str = self.navigationItem.title;
    NSArray *header = [NSArray arrayWithObjects:str,@"全城",@"智能排序",@"筛选", nil];
    for (int i = 0; i < 4; i ++) {
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        btn.frame = CGRectMake(0 + WIDTH / 4 * i, 0, WIDTH / 4, 30);
        btn.titleLabel.font = [UIFont systemFontOfSize:14.0];
        
        [btn setTitle:header[i] forState:(UIControlStateNormal)];
        [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [btn addTarget:self action:@selector(chooseCategory:) forControlEvents:(UIControlEventTouchUpInside)];
        [headerView addSubview:btn];
        
        UIView *sepraterView = [[UIView alloc] initWithFrame:CGRectMake(WIDTH / 4 *(i + 1), 5, 1, 20)];
        sepraterView.backgroundColor = [UIColor lightGrayColor];
        [headerView addSubview:sepraterView];
    }
    [self setupTableView];
}

- (void)setupTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 94, WIDTH, HEIGHT - 44 - 49) style:(UITableViewStylePlain)];
    
    [_tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"CELL"];
    [_tableView registerClass:[MovieTableViewCell  class] forCellReuseIdentifier:@"MOVIECELL"];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self heightForRow];
    [self.view addSubview:_tableView];
}

- (void)heightForRow
{
    if ([self.navigationItem.title isEqualToString:@"电影"]) {
        _tableView.rowHeight = 82;
    } else {
        _tableView.rowHeight = 100;
    }
}

- (void)loadData
{
    if (self.listUrl != nil) {
        NSArray *arr = [LISTURL componentsSeparatedByString:@"?"];
        NSString *first = [[arr[0] stringByAppendingString:self.listUrl] stringByAppendingString:@"?"];
        self.URL = [first stringByAppendingString:arr[1]];
    }
    self.dataArray = [NSMutableArray array];
    __weak typeof(self) aSelf = self;
    [Network receivedDataWithURLString:self.URL method:@"GET" body:nil block:^(id tempObj) {
        NSDictionary *dic = tempObj;
        NSArray *arr = [dic valueForKey:@"data"];
        for (NSDictionary *dataDic in arr) {
            if (self.listUrl != nil) {
                NSDictionary *poi = [dataDic valueForKey:@"poi"];
                
                ModelForList *model = [[ModelForList alloc] init];
                [model setValuesForKeysWithDictionary:poi];
                [aSelf.dataArray addObject:model];
            } else {
                ModelForList *model = [[ModelForList alloc] init];
                [model setValuesForKeysWithDictionary:dataDic];
                [aSelf.dataArray addObject:model];
            }
            
        }
        
        [aSelf.tableView reloadData];
    }];
}

- (void)chooseCategory:(UIButton *)btn
{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   if ([self.navigationItem.title isEqualToString:@"电影"]) {
        MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MOVIECELL"];
        ModelForList *model = self.dataArray[indexPath.row];
        cell.model = model;
        
        return cell;
    } else {
        CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
        ModelForList *model = self.dataArray[indexPath.row];
        cell.listModel = model;
        
        return cell;
    }
    
}


@end
