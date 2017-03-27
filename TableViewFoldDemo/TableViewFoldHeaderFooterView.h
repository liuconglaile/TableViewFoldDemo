//
//  FoldedTableViewHeaderFooterView.h
//  FoldedTableView
//
//  Created by ec on 2016/11/8.
//  Copyright © 2016年 Code Geass. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TableViewFoldHeaderFooterViewModel;

@interface TableViewFoldHeaderFooterView : UITableViewHeaderFooterView

@property (nonatomic, strong) UIImageView *arrowImageView;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *numberLabel;

@property (nonatomic, strong) UIView *topLineView;
@property (nonatomic, strong) UIView *bottomLineView;

- (void)setupWithModel:(TableViewFoldHeaderFooterViewModel *)model
               section:(NSInteger)section
        didSelectBlock:(dispatch_block_t)block;

@end
