//
//  AppearanceController.m
//  DayXStoryboard
//
//  Created by Jordan Nelson on 2/23/15.
//  Copyright (c) 2015 Jordan Nelson. All rights reserved.
//

#import "AppearanceController.h"
#import <UIKit/UIKit.h>


@implementation AppearanceController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[UINavigationBar appearance]setTintColor:[UIColor colorWithRed:0.17 green:0.76 blue:0.98 alpha:1]];
    }
    return self;
}

@end
