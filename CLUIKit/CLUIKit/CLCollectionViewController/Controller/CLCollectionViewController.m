//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLCollectionViewController.m
//  SimpleProject
//
//  Created by Cain on 2016/11/30.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "CLCollectionViewController.h"
#import "MJRefresh.h"
#import "CLCollectionViewBaseModel.h"
#import "CLCollectionViewDelegate.h"

@interface CLCollectionViewController ()

@property (nonatomic, strong, readwrite) UICollectionView *cl_collectionView;
@property (nonatomic, strong, readwrite) UICollectionViewFlowLayout *cl_collectionViewFlowLayout;

@property (nonatomic, strong) CLCollectionViewBaseModel *cl_collectionViewBaseModel;
@property (nonatomic, strong) CLCollectionViewDelegate *cl_collectionViewDelegate;

@end

@implementation CLCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.cl_collectionView];
    
    [self cl_addRefresh];
}

- (void)cl_setCollectionViewDelegate:(id<UICollectionViewDelegate>)delegate
                          dataSource:(id<UICollectionViewDataSource>)dataSource {
    
    self.cl_collectionView.delegate = delegate;
    self.cl_collectionView.dataSource = dataSource;
}

#pragma mark - Collection View
- (UICollectionView *)cl_collectionView {
    
    if (!_cl_collectionView) {
        
        _cl_collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame
                                                collectionViewLayout:self.cl_collectionViewFlowLayout];
        
        _cl_collectionView.backgroundColor = [UIColor whiteColor];
        
        [_cl_collectionView registerClass:[UICollectionViewCell class]
               forCellWithReuseIdentifier:@"UICollectionViewCell"];
    }
    
    return _cl_collectionView;
}

- (void)cl_registerClass:(nullable Class)cellClass
              identifier:(NSString *)identifier {
    
    [self.cl_collectionView registerClass:cellClass
               forCellWithReuseIdentifier:identifier];
}

- (CLCollectionViewBaseModel *)cl_collectionViewBaseModel {
    
    if (!_cl_collectionViewBaseModel) {
        
        _cl_collectionViewBaseModel = [[CLCollectionViewBaseModel alloc] initCollectionViewBaseModelWithController:self];
    }
    
    return _cl_collectionViewBaseModel;
}

- (CLCollectionViewDelegate *)cl_collectionViewDelegate {
    
    if (!_cl_collectionViewDelegate) {
        
        _cl_collectionViewDelegate = [[CLCollectionViewDelegate alloc] initCollectionViewDelegateWithViewModel:self.cl_collectionViewBaseModel];
    }
    
    return _cl_collectionViewDelegate;
}

#pragma mark - Collection View Flow Layout
- (UICollectionViewFlowLayout *)cl_collectionViewFlowLayout {
    
    if (!_cl_collectionViewFlowLayout) {
        
        _cl_collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    }
    
    return _cl_collectionViewFlowLayout;
}

- (void)cl_setTableViewDelegate:(id<UICollectionViewDelegate>)delegate
                     dataSource:(id<UICollectionViewDataSource>)dataSource {
    
    self.cl_collectionView.delegate = delegate;
    self.cl_collectionView.dataSource = dataSource;
}

#pragma mark - Refresh
- (void)cl_addRefresh {
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self cl_dropDownRefresh];
    }];
    
    self.cl_collectionView.mj_header = header;
    
    MJRefreshBackNormalFooter *refreshFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self cl_pullUpEndRefresh];
    }];
    
    self.cl_collectionView.mj_footer = refreshFooter;
}

- (void)cl_dropDownRefresh {}

- (void)cl_pullUpRefresh {}

- (void)cl_dropDownBeginRefresh {
    [self.cl_collectionView.mj_header beginRefreshing];
}

- (void)cl_dropDownEndRefresh {
    [self.cl_collectionView.mj_header endRefreshing];
}

- (void)cl_pullUpBeginRefresh {
    [self.cl_collectionView.mj_footer beginRefreshing];
}

- (void)cl_pullUpEndRefresh {
    [self.cl_collectionView.mj_footer endRefreshing];
}

- (void)cl_removeRefresh {
    
    self.cl_collectionView.mj_header = nil;
    self.cl_collectionView.mj_footer = nil;
}

- (void)cl_removeHeaderRefresh {
    self.cl_collectionView.mj_header = nil;
}

- (void)cl_removeFooterRefresh {
    self.cl_collectionView.mj_footer = nil;
}

@end
