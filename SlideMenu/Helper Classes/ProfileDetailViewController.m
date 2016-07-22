//
//  ProfileDetailViewController.m
//  SlideMenu
//
//  Created by  Venkataramana on 11/06/16.
//  Copyright © 2016 Venkataramana. All rights reserved.
//

#import "ProfileDetailViewController.h"

@implementation ProfileDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
	return NO;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
	return NO;
}

@end
