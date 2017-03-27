//
//  ContactsViewController.m
//  TableViewFoldDemo
//
//  Created by 菅思博 on 2017/3/27.
//  Copyright © 2017年 菅思博. All rights reserved.
//

#import "ContactsViewController.h"

#import "TableViewFoldCellModel.h"
#import "TableViewFoldHeaderFooterViewModel.h"

#import "TableViewFoldCell.h"
#import "TableViewFoldHeaderFooterView.h"

@interface ContactsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *contactsTableView;
@property (nonatomic, strong) NSMutableArray *contactsDataSource;

@end

@implementation ContactsViewController
#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _contactsDataSource = [self setupContactsDataSource];
    
    [self createNavigationBar];
    [self createContactsTableView];
}

#pragma mark Create NavigationBar
- (void)createNavigationBar {
    NSMutableAttributedString *multableAttributedString = [[NSMutableAttributedString alloc] initWithString:@"联系人界面"];
    
    [multableAttributedString addAttributes:@{
                                             NSFontAttributeName:[UIFont systemFontOfSize:17.0f
                                                                                   weight:3.0f],
                                             NSForegroundColorAttributeName:[UIColor js_colorWithHexString:@"#FFFFFF"]
                                             }
                                      range:NSMakeRange(0, multableAttributedString.length)];
    
    [self createNavigationBarWithTitle:multableAttributedString
                         withImageName:@"nav_image"];
}

#pragma mark Setup ContactsDataSource
- (NSMutableArray *)setupContactsDataSource {
    if (!_contactsDataSource) {
        _contactsDataSource = [[NSMutableArray alloc] init];
        
        NSArray *contactsSectionArray = @[@"特别关心",
                                          @"常用群聊",
                                          @"家人",
                                          @"亲人",
                                          @"朋友",
                                          @"工作",
                                          @"大学同学",
                                          @"高中同学",
                                          @"米线",
                                          @"初中同学",
                                          @"手机通讯录",
                                          @"我的设备"];
        
        NSArray *contactsNameArray = @[@"魏一",
                                       @"蜀二",
                                       @"张三",
                                       @"李四",
                                       @"王五",
                                       @"赵六",
                                       @"刘七",
                                       @"秦八",
                                       @"梁九",
                                       @"夏十"];
        
        NSArray *contactsOnlineArray = @[@"[4G在线]haha",
                                         @"[4G在线]哈哈",
                                         @"[WiFi在线]😝",
                                         @"[WiFi在线]hehe",
                                         @"[iPhone在线]呵呵",
                                         @"[iPhone在线]😑",
                                         @"[2G在线]I love you",
                                         @"[2G在线]我爱你",
                                         @"[3G在线]What fine weather it is!",
                                         @"[3G在线]今天天气真好",
                                         @"[手机在线]Do you like me ?",
                                         @"[手机在线]你喜欢我吗？",
                                         @"[4G在线]MacBook Pro",
                                         @"[手机在线]iPhone",
                                         @"[iPhone在线]iPad",
                                         @"[WiFi在线]Apple Watch"];
        
        NSArray *contactsOfflineArray = @[@"[离线请留言]haha",
                                          @"[离线请留言]哈哈",
                                          @"[离线请留言]😝",
                                          @"[离线请留言]hehe",
                                          @"[离线请留言]呵呵",
                                          @"[离线请留言]😑",
                                          @"[离线请留言]I love you",
                                          @"[离线请留言]我爱你",
                                          @"[离线请留言]What fine weather it is!",
                                          @"[离线请留言]今天天气真好",
                                          @"[离线请留言]Do you like me ?",
                                          @"[离线请留言]你喜欢我吗？",
                                          @"[离线请留言]MacBook Pro",
                                          @"[离线请留言]iPhone",
                                          @"[离线请留言]iPad",
                                          @"[离线请留言]Apple Watch"];
        
        for (int i = 0; i < contactsSectionArray.count; i++) {
            TableViewFoldHeaderFooterViewModel *viewModel = [[TableViewFoldHeaderFooterViewModel alloc] init];
            
            viewModel.title = contactsSectionArray [i];
            
            // 在线数据
            NSInteger onlineNumber = arc4random() % 50;
            
            NSMutableArray *array = [[NSMutableArray alloc] init];
            
            for (int j = 0; j < onlineNumber; j++) {
                TableViewFoldCellModel *cellModel = [[TableViewFoldCellModel alloc] init];

                cellModel.name = contactsNameArray[arc4random_uniform((u_int32_t)contactsNameArray.count)];
                
                cellModel.onLineContent = contactsOnlineArray[arc4random_uniform((u_int32_t)contactsOnlineArray.count)];
                
                cellModel.onLine = YES;
                
                [array addObject:cellModel];
            }
            
            // 离线数据
            NSInteger offlineNumber = arc4random() % 50;
            
            for (int j = 0; j < offlineNumber; j++) {
                TableViewFoldCellModel *cellModel = [[TableViewFoldCellModel alloc] init];
 
                cellModel.name =  contactsNameArray[arc4random_uniform((u_int32_t)contactsNameArray.count)];
                
                cellModel.onLineContent = contactsOfflineArray[arc4random_uniform((u_int32_t)contactsOfflineArray.count)];
                
                cellModel.onLine = NO;
                
                [array addObject:cellModel];
            }
            
            viewModel.cellModelArray = array;
            
            viewModel.number = [NSString stringWithFormat:@"%lu/%lu", onlineNumber, array.count];
            
            [_contactsDataSource addObject:viewModel];
        }
    }
    
    return _contactsDataSource;
}

#pragma mark Create ContactsTableView
- (void)createContactsTableView {
    _contactsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 64.0f, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64.0f)
                                                      style:UITableViewStylePlain];
    
    _contactsTableView.backgroundColor = [UIColor js_colorWithHexString:@"#FFFFFF"];
    
    _contactsTableView.dataSource = self;
    _contactsTableView.delegate = self;
    
    _contactsTableView.rowHeight = 60.0f;
    _contactsTableView.sectionHeaderHeight = 50.0f;
    
    _contactsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [_contactsTableView registerNib:[UINib nibWithNibName:@"TableViewFoldCell"
                                                   bundle:nil]
             forCellReuseIdentifier:@"TableViewFoldCell"];
    [_contactsTableView registerClass:[TableViewFoldHeaderFooterView class]
   forHeaderFooterViewReuseIdentifier:@"TableViewFoldHeaderFooterView"];

    [self.view addSubview:_contactsTableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    TableViewFoldHeaderFooterViewModel *viewModel = _contactsDataSource[section];
    
    return viewModel.isExpanded ? viewModel.cellModelArray.count : 0.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewFoldCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewFoldCell"
                                                              forIndexPath:indexPath];
    
    TableViewFoldHeaderFooterViewModel *viewModel = _contactsDataSource[indexPath.section];
    
    TableViewFoldCellModel *cellModel = viewModel.cellModelArray[indexPath.row];
    
    [cell setupWithModel:cellModel];
    
    if (indexPath.row == viewModel.cellModelArray.count - 1) {
        cell.bottomLineView.hidden = YES;
    }
    else {
        cell.bottomLineView.hidden = NO;
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _contactsDataSource.count;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    TableViewFoldHeaderFooterViewModel *viewModel = _contactsDataSource[section];
    
    if ([viewModel.title isEqualToString:@"常用群聊"] || [viewModel.title isEqualToString:@"初中同学"]) {
        return 20.0f;
    }
    
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    TableViewFoldHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"TableViewFoldHeaderFooterView"];
    
    TableViewFoldHeaderFooterViewModel *viewModel = _contactsDataSource[section];
    
    [view setupWithModel:viewModel
                 section:section
          didSelectBlock:^{
              [tableView reloadData];
          }];
    
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    TableViewFoldHeaderFooterViewModel *viewModel = _contactsDataSource[section];
    
    if ([viewModel.title isEqualToString:@"常用群聊"] || [viewModel.title isEqualToString:@"初中同学"]) {
        UIView *view = [[UIView alloc] init];
        
        view.backgroundColor = [UIColor colorWithWhite:0.8f
                                                 alpha:0.2f];
        
        return view;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
}

@end
