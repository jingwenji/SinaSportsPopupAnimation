//
//  NSObject+HDFPattern.h
//  SinaSportsPopupAnimation
//
//  Created by Faroe on 16/9/21.
//  Copyright © 2016年 HDF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void(^actionBlock)();
@interface NSObject (HDFPattern)
- (void)showAlertControllerWithMessage:(NSString *)message block:(actionBlock)block;

@end
