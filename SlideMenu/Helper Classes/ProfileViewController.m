//
//  ProfileViewController.m
//  SlideMenu
//
//  Created by  Venkataramana on 11/06/16.
//  Copyright © 2016 Venkataramana. All rights reserved.
//


#import "ProfileViewController.h"

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
	return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
	return YES;
}

@end
