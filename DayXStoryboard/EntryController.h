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

@property (nonatomic, readonly) NSArray *entries;

+(EntryController *)sharedInstance;

-(void)addEntry:(Entry*)entry;
-(void)removeEntry:(Entry*)entry;
-(void)replaceEntry:(NSDictionary *)oldEntry withEntry:(NSDictionary *)newEntry;

-(void)loadFromDefaults;

@end
