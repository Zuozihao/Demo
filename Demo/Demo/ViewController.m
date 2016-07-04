//
//  ViewController.m
//  Demo
//
//  Created by 左梓豪 on 16/7/1.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import "ViewController.h"
#import <UIViewController+MMDrawerController.h>
#import <MMDrawerBarButtonItem.h>
#import "MainTableViewCell.h"
#import "CellData.h"

#define widths ([UIScreen mainScreen].bounds.size.width - 90)/3

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,AddButtonPressed>
{
    NSArray *groupTitle;
    BOOL unshow[10];//判断是否展开的数组
}

@property(nonatomic, strong)UITableView *tableView;

@property(nonatomic, strong)NSArray *virtualData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.title = @"主页";
    groupTitle = @[@"正在服务股票",@"历史服务股票",@"新增板块"];
    [self initView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)initView {
    UIButton *left = [UIButton buttonWithType:UIButtonTypeCustom];
    left.frame = CGRectMake(0, 0, 20, 20);
    [left setBackgroundImage:[UIImage imageNamed:@"nav_personal"] forState:UIControlStateNormal];
    [left addTarget:self action:@selector(goLeft) forControlEvents:UIControlEventTouchUpInside];
    MMDrawerBarButtonItem *leftItem = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(goLeft)];
    leftItem.customView = left;
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton *right1 = [UIButton buttonWithType:UIButtonTypeCustom];
    right1.frame = CGRectMake(0, 0, 20, 20);
    [right1 setBackgroundImage:[UIImage imageNamed:@"nav_search"] forState:UIControlStateNormal];
    [right1 addTarget:self action:@selector(goSearch) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *right2 = [UIButton buttonWithType:UIButtonTypeCustom];
    right2.frame = CGRectMake(0, 0, 20, 20);
    [right2 setBackgroundImage:[UIImage imageNamed:@"nav_edit"] forState:UIControlStateNormal];
    [right2 addTarget:self action:@selector(goEdit) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightNav1 = [[UIBarButtonItem alloc] initWithCustomView:right1];
    UIBarButtonItem *rightNav2 = [[UIBarButtonItem alloc] initWithCustomView:right2];
    self.navigationItem.rightBarButtonItems = @[rightNav2,rightNav1];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor blackColor];
    UIView *footer = [[UIView alloc] initWithFrame:CGRectZero];
    footer.backgroundColor = RGB(13, 13, 13);
    _tableView.tableFooterView = footer;
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[MainTableViewCell class] forCellReuseIdentifier:@"Cell"];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

- (void)goLeft {
    NSLog(@"去左边");
    [self.mm_drawerController openDrawerSide:MMDrawerSideLeft animated:YES completion:^(BOOL finished) {

    }];
}

- (void)goSearch {
    NSLog(@"去搜索");
}

- (void)goEdit {
    NSLog(@"去编辑");
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (!unshow[section]) {
        return 0;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return widths*(self.virtualData.count/3 + 1) + 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainTableViewCell *cell = [[MainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.delegate = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.data = self.virtualData;
    cell.backgroundColor = RGB(13, 13, 13);
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:groupTitle[section] forState:UIControlStateNormal];
    [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    button.backgroundColor = RGB(33, 33, 33);
    button.tag = section + 100;
    [button addTarget:self action:@selector(expand:) forControlEvents:UIControlEventTouchUpInside];
    return  button;
}

- (void)expand:(UIButton *)sender {
    NSInteger section = sender.tag - 100;
    unshow[sender.tag - 100] = !unshow[sender.tag - 100];
    
    //重新加载
    NSIndexSet *indexset = [NSIndexSet  indexSetWithIndex:section];
    [_tableView reloadSections:indexset withRowAnimation:UITableViewRowAnimationFade];

}

- (void)addButtonPressed {
    NSLog(@"点击按钮");
    UIAlertView *aler = [[UIAlertView alloc] initWithTitle:@"点击添加按钮" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [aler show];
}

/**
 *  数据准备
 *
 *  @return 虚拟的数据
 */
- (NSArray *)virtualData {
    if (_virtualData == nil) {
        CellData *data1 = [[CellData alloc] init];
        data1.title = @"上证宗指";
        data1.all = @"2737.60";
        data1.raise = @"+81.94▲";
        data1.percent =@"+3.09";
        
        _virtualData = @[data1,data1,data1,data1,data1];
    }
    return _virtualData;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
