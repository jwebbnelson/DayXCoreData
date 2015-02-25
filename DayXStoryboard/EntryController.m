//
//  EntryController.m
//  DayXStoryboard
//
//  Created by Jordan Nelson on 2/23/15.
//  Copyright (c) 2015 Jordan Nelson. All rights reserved.
//

#import "EntryController.h"
#import "Stack.h"

static NSString *const entryListKey = @"entryListKey";

@interface EntryController()

// Allows assignment of entries property
@property (nonatomic, strong) NSArray *entries;

@end

@implementation EntryController

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EntryController alloc] init];
        
    });
    return sharedInstance;
}

// Method attached to entries property
-(NSArray *)entries {

    // Array created from executed fetch request (returns array of all Entities with name "Entry")
   return [[Stack sharedInstance].managedObjectContext executeFetchRequest:[NSFetchRequest fetchRequestWithEntityName:@"Entry"] error:NULL];
}


#pragma mark - addEntryWithTitle
-(void)addEntryWithTitle:(NSString *)title Text:(NSString *)text andDate:(NSDate *)date {
    
    // Adding object to Core Data
    Entry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    // Set *entry attributes/properties to parameters
    entry.title = title;
    entry.text = text;
    entry.timestamp = date;
    
    // Save *entry via synchronize method
    [self synchronize];
    
}

#pragma mark - removeEntry
-(void)removeEntry:(Entry*)entry{
   
    [[Stack sharedInstance].managedObjectContext deleteObject:entry];
    // OR - [entry.managedObjectContext deleteObject:entry];
    
    [self synchronize];
}

//#pragma mark - loadFromDefaults
//-(void)loadFromDefaults{
//    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:entryListKey];
//    
//    NSMutableArray *entries = [NSMutableArray new];
//    for (NSDictionary *entry in entryDictionaries) {
//        [entries addObject:[[Entry alloc] initWithDictionary:entry]];
//    }
//    
//    self.entries = entries;
//}

#pragma mark - synchronize
-(void)synchronize{
    
    // Save method to Core Data
    [[Stack sharedInstance].managedObjectContext save:NULL];
}

@end
