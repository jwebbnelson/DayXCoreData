//
//  ListViewDataSource.h
//  DayXStoryboard
//
//  Created by Jordan Nelson on 2/23/15.
//  Copyright (c) 2015 Jordan Nelson. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

static NSString * const cellIdentifer = @"cell";

@interface ListViewDataSource : NSObject <UITableViewDataSource>

- (void)registerTableView:(UITableView *)tableView;

@end
