//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLTableViewController.m
//  SimpleProject
//
//  Created by Cain Luo on 28/11/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "CLTableViewController.h"
#import "MJRefresh.h"
#import "CLTableViewDelegate.h"
#import "CLTableViewBaseModel.h"

@interface CLTableViewController ()

@property (nonatomic, strong, readwrite) UITableView *cl_tableView;

@property (nonatomic, strong) CLTableViewDelegate *cl_tableViewDelegate;
@property (nonatomic, strong) CLTableViewBaseModel *cl_ableViewBaseModel;

@end

@implementation CLTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addRefresh];
}

#pragma mark - Table View
- (UITableView *)cl_tableView {
    
    if (!_cl_tableView) {
        
        _cl_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                                      0,
                                                                      [UIScreen mainScreen].bounds.size.width,
                                                                      [UIScreen mainScreen].bounds.size.height)];
        
        _cl_tableView.backgroundColor = [UIColor whiteColor];
    }
    
    return _cl_tableView;
}

- (void)cl_setTableViewDelegate:(id<UITableViewDelegate>)delegate
                     dataSource:(id<UITableViewDataSource>)dataSource {
    
    self.cl_tableView.delegate = delegate;
    self.cl_tableView.dataSource = dataSource;
}

#pragma mark - Table View Delegate
- (CLTableViewDelegate *)cl_tableViewDelegate {
    
    if (!_cl_tableViewDelegate) {
        
        _cl_tableViewDelegate = [[CLTableViewDelegate alloc] initTableViewDelegateWithViewModel:self.cl_ableViewBaseModel];
    }
    
    return _cl_tableViewDelegate;
}

#pragma mark - Table View Base Model
- (CLTableViewBaseModel *)cl_ableViewBaseModel {
    
    if (!_cl_ableViewBaseModel) {
        _cl_ableViewBaseModel = [[CLTableViewBaseModel alloc] initTableViewBaseModelWithController:self];
    }
    
    return _cl_ableViewBaseModel;
}

#pragma mark - Refresh
- (void)addRefresh {
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self cl_dropDownRefresh];
    }];
    
    self.cl_tableView.mj_header = header;
    
    MJRefreshBackNormalFooter *refreshFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self cl_pullUpEndRefresh];
    }];
    
    self.cl_tableView.mj_footer = refreshFooter;
    
    [self.view addSubview:self.cl_tableView];
}

- (void)cl_dropDownRefresh {}

- (void)cl_pullUpRefresh {}

- (void)cl_dropDownBeginRefresh {
    [self.cl_tableView.mj_header beginRefreshing];
}

- (void)cl_dropDownEndRefresh {
    [self.cl_tableView.mj_header endRefreshing];
}

- (void)cl_pullUpBeginRefresh {
    [self.cl_tableView.mj_footer beginRefreshing];
}

- (void)cl_pullUpEndRefresh {
    [self.cl_tableView.mj_footer endRefreshing];
}

- (void)cl_removeRefresh {
    
    self.cl_tableView.mj_header = nil;
    self.cl_tableView.mj_footer = nil;
}

- (void)cl_removeHeaderRefresh {
    self.cl_tableView.mj_header = nil;
}

- (void)cl_removeFooterRefresh {
    self.cl_tableView.mj_footer = nil;
}

@end