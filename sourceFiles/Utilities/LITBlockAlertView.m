//
//  LITBlockAlertView.m
//  LITToolbox
//
//  Created by Lee on 14-4-9.
//  Copyright (c) 2014年 Zhuocheng Lee. All rights reserved.
//

#import "LITBlockAlertView.h"

NSUInteger const maxAlertQueueCount = 18;

@interface LITBlockAlertView ()

@property (nonatomic, strong) UIAlertView    *alertView;
@property (nonatomic, strong) NSMutableArray *buttonBlocks;

@end

@implementation LITBlockAlertView

static NSMutableOrderedSet *currentAlertQueue;

+ (instancetype)alertWithTitle:(NSString *)title
                       message:(NSString *)message
                   buttonTitle:(NSString *)buttonTitle
                   buttonBlock:(LITAlertViewButtonBlock)buttonBlock
{
    id alertView = [[self alloc] initWithTitle:title message:message buttonTitle:buttonTitle buttonBlock:buttonBlock];

    return alertView;
}

+ (instancetype)alertWithTitle:(NSString *)title
                       message:(NSString *)message
                  buttonTitle1:(NSString *)buttonTitle1
                  buttonBlock1:(LITAlertViewButtonBlock)buttonBlock1
                  buttonTitle2:(NSString *)buttonTitle2
                  buttonBlock2:(LITAlertViewButtonBlock)buttonBlock2
{
    id alertView = [[self alloc] initWithTitle:title message:message buttonTitle1:buttonTitle1 buttonBlock1:buttonBlock1 buttonTitle2:buttonTitle2 buttonBlock2:buttonBlock2];

    return alertView;
}

+ (instancetype)alertWithTitle:(NSString *)title
                       message:(NSString *)message
                  buttonBlocks:(NSArray *)buttonBlocks
             cancelButtonTitle:(NSString *)cancelButtonTitle
             otherButtonTitles:(NSString *)otherButtonTitles, ...
    {
    id alertView = [[self alloc] initWithTitle:title message:message buttonBlocks:buttonBlocks cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles];

    return alertView;
}

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                  buttonTitle:(NSString *)buttonTitle
                  buttonBlock:(LITAlertViewButtonBlock)buttonBlock
{
    self.buttonBlocks = [NSMutableArray array];

    if (buttonBlock) {
        [self.buttonBlocks addObject:[buttonBlock copy]];
    } else {
        LITAlertViewButtonBlock block = ^{ };
        [self.buttonBlocks addObject:[block copy]];
    }

    self.alertView = [[UIAlertView alloc] initWithTitle:title
                                                message:message
                                               delegate:self
                                      cancelButtonTitle:buttonTitle
                                      otherButtonTitles:nil];

    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                 buttonTitle1:(NSString *)buttonTitle1
                 buttonBlock1:(LITAlertViewButtonBlock)buttonBlock1
                 buttonTitle2:(NSString *)buttonTitle2
                 buttonBlock2:(LITAlertViewButtonBlock)buttonBlock2
{
    self.buttonBlocks = [NSMutableArray array];

    if (buttonBlock1) {
        [self.buttonBlocks addObject:[buttonBlock1 copy]];
    } else {
        LITAlertViewButtonBlock block = ^{ };
        [self.buttonBlocks addObject:[block copy]];
    }

    if (buttonBlock2) {
        [self.buttonBlocks addObject:[buttonBlock2 copy]];
    } else {
        LITAlertViewButtonBlock block = ^{ };
        [self.buttonBlocks addObject:[block copy]];
    }

    self.alertView = [[UIAlertView alloc] initWithTitle:title
                                                message:message
                                               delegate:self
                                      cancelButtonTitle:buttonTitle1
                                      otherButtonTitles:buttonTitle2, nil];

    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                 buttonBlocks:(NSArray *)buttonBlocks
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSString *)otherButtonTitles, ...
    {
    self.buttonBlocks = [NSMutableArray array];

    for (LITAlertViewButtonBlock block in buttonBlocks) {
        [self.buttonBlocks addObject:[block copy]];
    }

    self.alertView = [[UIAlertView alloc] initWithTitle:title
                                                message:message
                                               delegate:self
                                      cancelButtonTitle:cancelButtonTitle
                                      otherButtonTitles:otherButtonTitles, nil];

    return self;
}

- (void)show
{
    [LITBlockAlertView addAlertViewToQueue:self];
    [self.alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    LITAlertViewButtonBlock block = nil;

    if (buttonIndex < self.buttonBlocks.count) {
        block = self.buttonBlocks[buttonIndex];
    }

    if (block) {
        block();
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [LITBlockAlertView removeAlertViewFromQueue:self];
}

#pragma mark - MAAlertView的生命周期控制，防止自己被释放，造成野指针
+ (BOOL)addAlertViewToQueue:(LITBlockAlertView *)alertView
{
    if (!alertView) {
        return NO;
    }

    if (!currentAlertQueue) {
        currentAlertQueue = [NSMutableOrderedSet orderedSetWithCapacity:maxAlertQueueCount];
    }

    if (maxAlertQueueCount <= currentAlertQueue.count) {
        [currentAlertQueue removeObjectAtIndex:0];
        [currentAlertQueue addObject:alertView];
        return NO;
    }

    [currentAlertQueue addObject:alertView];
    return YES;
}

+ (BOOL)removeAlertViewFromQueue:(LITBlockAlertView *)alertView
{
    if ([currentAlertQueue containsObject:alertView]) {
        [currentAlertQueue removeObject:alertView];
        return YES;
    }

    return NO;
}

@end