//
//  ViewController.h
//  DayXStoryboard
//
//  Created by Jordan Nelson on 2/23/15.
//  Copyright (c) 2015 Jordan Nelson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListViewDataSource.h"

@interface ListViewController : UITableViewController

@property (strong,nonatomic) IBOutlet ListViewDataSource *dataSource;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

