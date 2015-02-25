//
//  Entry.h
//  DayXStoryboard
//
//  Created by Jordan Nelson on 2/25/15.
//  Copyright (c) 2015 Jordan Nelson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Entry : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSDate * timestamp;

@end
