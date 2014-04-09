//
//  UIViewController+LITAddition.m
//  LITToolbox
//
//  Created by Lee on 14-4-9.
//  Copyright (c) 2014年 Zhuocheng Lee. All rights reserved.
//

#import "UIViewController+LITAddition.h"

@implementation UIViewController (LITAddition)

- (void)disappear:(BOOL)animated
{
    NSArray *viewControllers = [self.navigationController viewControllers];
    if (1 < [viewControllers count] && self == [viewControllers lastObject]) {
        [self.navigationController popViewControllerAnimated:animated];
    } else {
        [self.navigationController dismissViewControllerAnimated:animated completion:nil];
    }
}

@end