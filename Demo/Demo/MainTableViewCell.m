//
//  MainTableViewCell.m
//  Demo
//
//  Created by 左梓豪 on 16/7/2.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import "MainTableViewCell.h"
#import "CellView.h"

#define width ([UIScreen mainScreen].bounds.size.width - 90)/3

@interface MainTableViewCell ()

@property(nonatomic, strong)UIButton *addButton;

@end

@implementation MainTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.addButton];
    }
    return self;
}

- (void)setData:(NSArray *)data {
    for (int i = 0; i < data.count; i++) {
        CellView *cellView = [[CellView alloc] initWithFrame:CGRectMake(15*(2*(i%3)+1)+(i%3)*width ,((i/3)+1)*15+(i/3)*width, width, width)];
        CellData *oneData = data[i];
        cellView.data = oneData;
        [self addSubview:cellView];
    }
    
    NSInteger i = data.count;
    self.addButton.frame = CGRectMake(15*(2*(i%3)+1)+(i%3)*width ,((i/3)+1)*15+(i/3)*width, width, width);
}

- (UIButton *)addButton {
    if (_addButton == nil) {
        _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _addButton.frame = CGRectMake(0, 0, width, width);
        [_addButton setTitle:@"添加" forState:UIControlStateNormal];
        _addButton.backgroundColor = RGB(33, 33, 33);
        [_addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_addButton addTarget:self action:@selector(tapAdd) forControlEvents:UIControlEventTouchUpInside];
    }
    return  _addButton;
}

- (void)tapAdd {
    [self.delegate addButtonPressed];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
