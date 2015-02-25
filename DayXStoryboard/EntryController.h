//
//  EntryController.h
//  DayXStoryboard
//
//  Created by Jordan Nelson on 2/23/15.
//  Copyright (c) 2015 Jordan Nelson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface EntryController : NSObject

@property (nonatomic, strong, readonly) NSArray *entries;

+(EntryController *)sharedInstance;

-(void)addEntryWithTitle:(NSString *)title Text:(NSString *)text andDate:(NSDate *)date;
-(void)removeEntry:(Entry*)entry;

-(void)synchronize;


@end
