//
//  LeftViewController.m
//  Demo
//
//  Created by 左梓豪 on 16/7/1.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import "LeftViewController.h"
#import <UIViewController+MMDrawerController.h>
#import "ViewController.h"

@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *picArray;
    NSArray *titleArray;
}

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    picArray = @[@"left_01.png",@"left_02",@"left_03",@"left_04",@"left_05",@"left_06",@"left_07"];
    titleArray = @[@"富饶钱包",@"充值",@"优惠兑换",@"邀请有礼",@"订单管理",@"消息中心",@"更多"];
    [self initView];
    // Do any additional setup after loading the view.
}

- (void)initView {
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kAppScreenWidth/4*3, 140)];
    header.backgroundColor = [UIColor blackColor];
    [self.view addSubview:header];
    UIImageView *avatar = [[UIImageView alloc] initWithFrame:CGRectMake(20, 40, 60, 60)];
    avatar.image = [UIImage imageNamed:@"avatar.jpeg"];
    avatar.contentMode = UIViewContentModeScaleToFill;
    avatar.layer.cornerRadius = avatar.frame.size.width/2;
    [header addSubview:avatar];
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(avatar.frame)+20, CGRectGetMinY(avatar.frame) - 10, 100, 25)];
    name.text = @"Mr.杨";
    name.textColor = [UIColor whiteColor];
    name.font = [UIFont systemFontOfSize:18];
    name.textAlignment = NSTextAlignmentLeft;
    [header addSubview:name];
    UILabel *phone = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(name.frame), CGRectGetMaxY(name.frame)+10, 150, 15)];
    phone.textAlignment = NSTextAlignmentLeft;
    phone.textColor = [UIColor whiteColor];
    phone.text = @"手机号:13113133131";
    phone.font = [UIFont systemFontOfSize:12];
    [header addSubview:phone];
    UILabel *level = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(name.frame), CGRectGetMaxY(phone.frame)+5, 100, 15)];
    level.font = [UIFont systemFontOfSize:12];
    level.textColor = RGB(217, 177, 144);
    level.text = @"金卡用户";
    [header addSubview:level];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(header.frame), kAppScreenWidth/4*3, kAppScreenHeight - header.frame.size.height)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = RGB(33, 33, 33);
    [self.view addSubview:_tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (indexPath.row == 0) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    } else {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = RGB(33, 33, 33);
    if (indexPath.row == 5) {
        cell.backgroundColor = RGB(13, 13, 13);
    }
    UIImage *icon;
    NSString *imageName;
    if (indexPath.row == 7) {
        imageName = picArray.lastObject;
        cell.textLabel.text = titleArray.lastObject;
    } else if (indexPath.row == 5) {
        imageName = nil;
        
        for (int i = 0; i < 3; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.font = [UIFont systemFontOfSize:11];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor whiteColor];
            if (i == 0) {
                imageView.frame = CGRectMake(30, 10, 20, 20);
                imageView.image = [UIImage imageNamed:@"left_0501"];
                label.frame = CGRectMake(CGRectGetMinX(imageView.frame) - 10, CGRectGetMaxY(imageView.frame)+5, 40, 15);
                label.text = @"进行中";
            } else if (i == 1) {
                imageView.frame = CGRectMake(kAppScreenWidth/8*3 - 10, 10, 20, 20);
                imageView.image = [UIImage imageNamed:@"left_0502"];
                label.frame = CGRectMake(CGRectGetMinX(imageView.frame) - 10, CGRectGetMaxY(imageView.frame)+5, 40, 15);
                label.text = @"待支付";
            } else if (i == 2) {
                imageView.frame = CGRectMake(kAppScreenWidth/4*3 - 50, 10, 20, 20);
                imageView.image = [UIImage imageNamed:@"left_0503"];
                label.frame = CGRectMake(CGRectGetMinX(imageView.frame) - 10, CGRectGetMaxY(imageView.frame)+5, 40, 15);
                label.text = @"已完成";
            }
            [cell.contentView addSubview:imageView];
            [cell.contentView addSubview:label];
        }
        
    } else if (indexPath.row == 6) {
        imageName = picArray[5];
        cell.textLabel.text = titleArray[5];
    }
    else {
        imageName = picArray[indexPath.row];
        cell.textLabel.text = titleArray[indexPath.row];
    }
    

    if (indexPath.row == 1) {
        cell.detailTextLabel.text = @"充值100送20,多充多送";
        cell.detailTextLabel.textColor = RGB(217, 177, 144);
    } else if (indexPath.row == 3) {
        cell.detailTextLabel.text = @"邀请新人,TA得200元,你得50元";
        cell.detailTextLabel.textColor = RGB(217, 177, 144);
    } else if (indexPath.row == 0) {
        cell.detailTextLabel.text = @"300元";
        cell.detailTextLabel.textColor = [UIColor whiteColor];
    }
    icon = [UIImage imageNamed:imageName];
    CGSize itemSize = CGSizeMake(25, 25);
    UIGraphicsBeginImageContextWithOptions(itemSize, NO, 0.0);
    CGRect imageRect = CGRectMake(0, 0, itemSize.width, itemSize.height);
    [icon drawInRect:imageRect];
    
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55;
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
