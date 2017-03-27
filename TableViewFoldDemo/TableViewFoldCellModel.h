//
//  TableViewFoldCellModel.h
//  TableViewFoldDemo
//
//  Created by 菅思博 on 2017/3/27.
//  Copyright © 2017年 菅思博. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableViewFoldCellModel : NSObject

@property (nonatomic, assign, getter = isOnline) BOOL onLine; // 是否在线

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *onLineContent;

@end
