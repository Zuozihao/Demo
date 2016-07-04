//
//  MainTableViewCell.h
//  Demo
//
//  Created by 左梓豪 on 16/7/2.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddButtonPressed <NSObject>

- (void)addButtonPressed;

@end

@interface MainTableViewCell : UITableViewCell

@property(nonatomic, strong)NSArray *data;
@property(nonatomic, weak)id<AddButtonPressed> delegate;

@end
