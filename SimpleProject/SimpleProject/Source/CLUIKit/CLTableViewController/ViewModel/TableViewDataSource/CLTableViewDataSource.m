//
//  CLTableViewDataSource.m
//  SimpleProject
//
//  Created by Cain on 2017/7/12.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "CLTableViewDataSource.h"

@interface CLTableViewDataSource ()

@property (nonatomic, strong, readwrite) CLTableViewBaseModel *cl_viewModel;

@end

@implementation CLTableViewDataSource

- (instancetype)initTableViewDataSourceWithViewModel:(CLTableViewBaseModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        
        self.cl_viewModel = viewModel;
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    
    return self.cl_viewModel.cl_dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"UITableViewCell"];
    }
    
    return cell;
}

@end
