//
//  TableViewFoldHeaderFooterViewModel.h
//  TableViewFoldDemo
//
//  Created by 菅思博 on 2017/3/27.
//  Copyright © 2017年 菅思博. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TableViewFoldCellModel;

@interface TableViewFoldHeaderFooterViewModel : NSObject

@property (nonatomic, assign, getter = isExpanded) BOOL expanded; // 是否展开

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *number;

@property (nonatomic, strong) NSArray <TableViewFoldCellModel *> *cellModelArray;

@end
