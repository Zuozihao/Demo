//
//  CellView.m
//  Demo
//
//  Created by 左梓豪 on 16/7/2.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import "CellView.h"

@interface CellView ()

@property(nonatomic, strong)UILabel *titleLabel;
@property(nonatomic, strong)UILabel *allLabel;
@property(nonatomic, strong)UILabel *raiseLabel;
@property(nonatomic, strong)UILabel *percentLabel;

@end

@implementation CellView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGB(33, 33, 33);
        [self addSubview:self.titleLabel];
        [self addSubview:self.allLabel];
        [self addSubview:self.raiseLabel];
        [self addSubview:self.percentLabel];
    }
    return self;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, self.frame.size.width - 10, 25)];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:17];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _titleLabel;
}

- (UILabel *)allLabel {
    if (_allLabel == nil) {
        _allLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 30, self.frame.size.width - 10, 18)];
        _allLabel.textColor = [UIColor redColor];
        _allLabel.font = [UIFont systemFontOfSize:14];
        _allLabel.textAlignment = NSTextAlignmentRight;
    }
    return _allLabel;
}

- (UILabel *)raiseLabel {
    if (_raiseLabel == nil) {
        _raiseLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 50, self.frame.size.width - 10, 15)];
        _raiseLabel.textColor = [UIColor redColor];
        _raiseLabel.font = [UIFont systemFontOfSize:12];
        _raiseLabel.textAlignment = NSTextAlignmentRight;
    }
    
    return _raiseLabel;
}

- (UILabel *)percentLabel {
    if (_percentLabel == nil) {
        _percentLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 65, self.frame.size.width - 10, 15)];
        _percentLabel.textColor = [UIColor redColor];
        _percentLabel.font = [UIFont systemFontOfSize:12];
        _percentLabel.textAlignment = NSTextAlignmentRight;
    }
    return _percentLabel;
}

- (void)setData:(CellData *)data {
    _titleLabel.text = data.title;
    _raiseLabel.text = data.raise;
    _percentLabel.text = data.percent;
    _allLabel.text = data.all;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
