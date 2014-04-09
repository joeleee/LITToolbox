//
//  NSDate+LITAddition.m
//  LITToolbox
//
//  Created by Lee on 14-4-9.
//  Copyright (c) 2014年 Zhuocheng Lee. All rights reserved.
//

#import "NSDate+LITAddition.h"

NSTimeInterval const oneDaySeconds = 24 * 60 * 60;

@implementation NSDate (LITAddition)

- (NSString *)dateToString:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *dateString = [formatter stringFromDate:self];

    return dateString;
}

+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSDate *date = [formatter dateFromString:dateString];

    return date;
}

- (NSDateComponents *)dateComponents
{
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;

    NSDateComponents *dateComponent = [[NSCalendar currentCalendar] components:unitFlags fromDate:self];

    return dateComponent;
}

@end