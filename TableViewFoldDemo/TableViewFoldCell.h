//
//  FoldedTableViewCell.h
//  FoldedTableView
//
//  Created by ec on 2016/11/8.
//  Copyright © 2016年 Code Geass. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TableViewFoldCellModel;

@interface TableViewFoldCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *headImageView;

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *onLineContentLabel;

@property (nonatomic, weak) IBOutlet UIView *bottomLineView;

@property (nonatomic, strong) CALayer *imageViewMaskLayer; // 离线头像蒙版

- (void)setupWithModel:(TableViewFoldCellModel *)model;

@end
