//
//  DetailViewController.h
//  DayXStoryboard
//
//  Created by Jordan Nelson on 2/23/15.
//  Copyright (c) 2015 Jordan Nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Entry;

@interface DetailViewController : UIViewController

@property (nonatomic, strong) NSDictionary *dictionary;

@property (nonatomic, assign) NSInteger index;

-(void)updateWithDictionary:(NSDictionary *)dictionary;
-(void)updateWithEntry:(Entry*)entry;



@end
