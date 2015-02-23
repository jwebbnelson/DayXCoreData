//
//  ListViewDataSource.m
//  DayXStoryboard
//
//  Created by Jordan Nelson on 2/23/15.
//  Copyright (c) 2015 Jordan Nelson. All rights reserved.
//

#import "ListViewDataSource.h"
#import "EntryController.h"

@implementation ListViewDataSource

#pragma registerTableView Method
//- (void)registerTableView:(UITableView *)tableView {
//    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
//}

#pragma numberOfRowsInSection Method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [EntryController sharedInstance].entries.count;
}

#pragma cellForRowAtIndexPath Method
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Entry *entry = [EntryController sharedInstance].entries[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = entry.title;
    
    return cell;
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (editingStyle == UITableViewCellEditingStyleDelete){
//        [[EntryController sharedInstance] removeEntry:[[EntryController sharedInstance].entries objectAtIndex:indexPath.row]];
//        // Animation Selection
//        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    }
//    
//}


@end
