//
//  JKAppDelegate.h
//  ExpandTableView
//
//  Created by VENKATARAMANA on 02 /07/16.
//  Copyright (c) 2013 VENKATARAMANA. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface JKAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

void uncaughtExceptionHandler(NSException *exception);

@end
