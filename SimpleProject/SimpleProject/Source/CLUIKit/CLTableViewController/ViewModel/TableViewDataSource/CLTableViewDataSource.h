//
//  CLTableViewDataSource.h
//  SimpleProject
//
//  Created by Cain on 2017/7/12.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLTableViewBaseModel.h"

@interface CLTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong, readonly) CLTableViewBaseModel *cl_viewModel;

- (instancetype)initTableViewDataSourceWithViewModel:(CLTableViewBaseModel *)viewModel;

@end
