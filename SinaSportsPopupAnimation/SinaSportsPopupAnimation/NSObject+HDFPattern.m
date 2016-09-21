//
//  NSObject+HDFPattern.m
//  SinaSportsPopupAnimation
//
//  Created by Faroe on 16/9/21.
//  Copyright © 2016年 HDF. All rights reserved.
//

#import "NSObject+HDFPattern.h"

@implementation NSObject (HDFPattern)
- (void)showAlertControllerWithMessage:(NSString *)message block:(actionBlock)block
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"- 🌹 -" message:message preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        block();
    }];
    [alert addAction:action];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}

@end
