//
//  FoldedTableViewCell.m
//  FoldedTableView
//
//  Created by ec on 2016/11/8.
//  Copyright © 2016年 Code Geass. All rights reserved.
//

#import "TableViewFoldCell.h"

#import "TableViewFoldCellModel.h"

@implementation TableViewFoldCell
#pragma mark 生命周期
- (void)awakeFromNib {
    [super awakeFromNib];
    
    _imageViewMaskLayer = [CALayer layer];
    
    _imageViewMaskLayer.frame = CGRectMake(0.0f, 0.0f, 40.0f, 40.0f);
    
    _imageViewMaskLayer.backgroundColor = [UIColor colorWithWhite:1.0f
                                                            alpha:0.7f].CGColor;
    
    _imageViewMaskLayer.masksToBounds = YES;
    
    _imageViewMaskLayer.cornerRadius = 20.0f;
    
    _imageViewMaskLayer.hidden = YES;
    
    [_headImageView.layer addSublayer:_imageViewMaskLayer];
}

- (void)setupWithModel:(TableViewFoldCellModel *)model {
    _headImageView.image = [UIImage imageNamed:@"接收者"];
    
    _nameLabel.text = model.name;
    
    _onLineContentLabel.text = model.onLineContent;
    
    if (model.isOnline) {
        _imageViewMaskLayer.hidden = YES;
    }
    else {
        _imageViewMaskLayer.hidden = NO;
    }
}

@end
