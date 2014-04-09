//
//  UIView+LITAddition.h
//  LITToolbox
//
//  Created by Lee on 14-4-9.
//  Copyright (c) 2014年 Zhuocheng Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LITAddition)

- (CGFloat)x;
- (CGFloat)y;
- (CGFloat)width;
- (CGFloat)height;
- (CGFloat)bottom;

- (void)setX:(CGFloat)x;
- (void)setY:(CGFloat)y;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;

@end