//
//  MeViewController.m
//  WaveViewDemo
//
//  Created by 纪宇伟 on 2017/6/22.
//  Copyright © 2017年 jyw. All rights reserved.
//

#import "MeViewController.h"
#import "HeaderView.h"

@interface MeViewController () <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)HeaderView *headerView;

@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    self.navigationItem.title = @"我";
    
    [self prepareData];
    [self createTableView];
}

- (void)prepareData
{
    _dataArray = [NSMutableArray array];
    
    NSArray *array1 = @[@"标题 1",@"标题 2"];
    NSArray *array2 = @[@"标题 3",@"标题 4",@"标题 5"];
    
    [_dataArray addObject:array1];
    [_dataArray addObject:array2];
}

- (void)createTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -20, SCREENWIDTH, SCREENHEIGHT + 20 - 49) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    [self.view addSubview:_tableView];
    
    _headerView = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 240)];
    _tableView.tableHeaderView = _headerView;
}


#pragma mark - UITableViewDataSource & Delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray[section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = _dataArray[indexPath.section][indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end