//
//  NSDate+LITAddition.h
//  LITToolbox
//
//  Created by Lee on 14-4-9.
//  Copyright (c) 2014年 Zhuocheng Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSTimeInterval const oneDaySeconds;

@interface NSDate (LITAddition)

// format example: @"yyyy-MM-dd"
- (NSString *)dateToString:(NSString *)format;

+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format;

- (NSDateComponents *)dateComponents;

@end