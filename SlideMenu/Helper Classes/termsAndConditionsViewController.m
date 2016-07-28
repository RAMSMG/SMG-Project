//
//  termsAndConditionsViewController.m
//  SendMyGift
//
//  Created by sendmygift on 12/07/16.
//  Copyright © 2016 Aryan Ghassemi. All rights reserved.
//

#import "termsAndConditionsViewController.h"
#import "SlideNavigationController.h"
@interface termsAndConditionsViewController ()

@end

@implementation termsAndConditionsViewController

- (void)viewDidLoad
{
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title = @"TERMS AND CONDITIONS";
    
    [super viewDidLoad];
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return YES;
}
@end
