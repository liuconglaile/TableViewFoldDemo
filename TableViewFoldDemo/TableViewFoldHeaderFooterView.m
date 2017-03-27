//
//  FoldedTableViewHeaderFooterView.m
//  FoldedTableView
//
//  Created by ec on 2016/11/8.
//  Copyright © 2016年 Code Geass. All rights reserved.
//

#import "TableViewFoldHeaderFooterView.h"
#import "TableViewFoldHeaderFooterViewModel.h"

static CGFloat const JSHeight = 50.0f;
static CGFloat const JSMargin = 15.0f;
static CGFloat const JSArrowImageViewWidth = 12.0f;

@interface TableViewFoldHeaderFooterView ()

@property (nonatomic, strong) TableViewFoldHeaderFooterViewModel *model;
@property (nonatomic, copy) dispatch_block_t block;

@end

@implementation TableViewFoldHeaderFooterView
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        
        // 三角图标
        _arrowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15.0F, (50.0f - 12.0f) / 2 , 12.0f, 12.0f)];
        _arrowImageView.image = [UIImage imageNamed:@"right-arrow"];
        [self.contentView addSubview:_arrowImageView];
        
        // 标题
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_arrowImageView.frame) + 15.0f, 0.0f, width - (15.0f + 12.0f + 15.0f) - (15.0f + 40.0f + 15.0f), 50.0f)];
        _titleLabel.font = [UIFont systemFontOfSize:18.0f];
        [self.contentView addSubview:_titleLabel];
        
        // 人数
        _numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_titleLabel.frame) + 15.0f, 0.0f, 40.0f, 50.0f)];
        _numberLabel.font = [UIFont systemFontOfSize:12.0f];
        _numberLabel.textColor = [UIColor lightGrayColor];
        _numberLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_numberLabel];
        
        _topLineView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, width, 0.5f)];
        _topLineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.contentView addSubview:_topLineView];
        
        _bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 50.0f - 0.5f, width, 0.5f)];
        _bottomLineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.contentView addSubview:_bottomLineView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(tap)];
        [self.contentView addGestureRecognizer:tap];
    }
    
    return self;
}

- (void)tap {
    _model.expanded = ! _model.isExpanded;

    if (_block) {
        _block();
    }
}

- (void)setupWithModel:(TableViewFoldHeaderFooterViewModel *)model
               section:(NSInteger)section
        didSelectBlock:(dispatch_block_t)block {
    _model = model;
    _block = block;
    
    _titleLabel.text = model.title;
    _numberLabel.text = model.number;
    
    if (!model.isExpanded) {
        _arrowImageView.transform = CGAffineTransformIdentity;
        _bottomLineView.hidden = NO;
    }
    else {
        _arrowImageView.transform = CGAffineTransformMakeRotation(M_PI_2);
        _bottomLineView.hidden = YES;
    }
    
    if (section == 0) {
        _topLineView.hidden = NO;
    }
    else {
        _topLineView.hidden = YES;
    }
}

@end
