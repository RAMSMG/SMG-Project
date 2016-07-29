//
//  termsAndConditionsViewController.m
//  SendMyGift
//
//  Created by sendmygift on 29/07/16.
//  Copyright © 2016 venkataramana. All rights reserved.
//

#import "termsAndConditionsViewController.h"
#import "SlideNavigationController.h"

@interface termsAndConditionsViewController ()

@end

@implementation termsAndConditionsViewController
@synthesize slideOutAnimationEnabled;
- (void)viewDidLoad
{
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title = @"Terms and Conditions";
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
