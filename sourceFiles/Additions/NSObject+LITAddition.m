//
//  NSObject+LITAddition.m
//  LITToolbox
//
//  Created by Lee on 14-4-9.
//  Copyright (c) 2014年 Zhuocheng Lee. All rights reserved.
//

#import "NSObject+LITAddition.h"

#import <objc/runtime.h>

@implementation NSObject (LITAddition)

+ (NSString *)className
{
	return [NSString stringWithUTF8String:class_getName(self)];
}

- (NSString *)className
{
	return [NSString stringWithUTF8String:class_getName([self class])];
}

@end