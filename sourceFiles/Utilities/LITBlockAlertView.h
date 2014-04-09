//
//  LITBlockAlertView.h
//  LITToolbox
//
//  Created by Lee on 14-4-9.
//  Copyright (c) 2014年 Zhuocheng Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ LITAlertViewButtonBlock)(void);

@interface LITBlockAlertView : NSObject

+ (instancetype)alertWithTitle:(NSString *)title
                       message:(NSString *)message
                   buttonTitle:(NSString *)buttonTitle
                   buttonBlock:(LITAlertViewButtonBlock)buttonBlock;

+ (instancetype)alertWithTitle:(NSString *)title
                       message:(NSString *)message
                  buttonTitle1:(NSString *)buttonTitle1
                  buttonBlock1:(LITAlertViewButtonBlock)buttonBlock1
                  buttonTitle2:(NSString *)buttonTitle2
                  buttonBlock2:(LITAlertViewButtonBlock)buttonBlock2;

+ (instancetype)alertWithTitle:(NSString *)title
                       message:(NSString *)message
                  buttonBlocks:(NSArray *)buttonBlocks
             cancelButtonTitle:(NSString *)cancelButtonTitle
             otherButtonTitles:(NSString *)otherButtonTitles, ...;

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                  buttonTitle:(NSString *)buttonTitle
                  buttonBlock:(LITAlertViewButtonBlock)buttonBlock;

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                 buttonTitle1:(NSString *)buttonTitle1
                 buttonBlock1:(LITAlertViewButtonBlock)buttonBlock1
                 buttonTitle2:(NSString *)buttonTitle2
                 buttonBlock2:(LITAlertViewButtonBlock)buttonBlock2;

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                 buttonBlocks:(NSArray *)buttonBlocks
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSString *)otherButtonTitles, ...;

- (void)show;

@end