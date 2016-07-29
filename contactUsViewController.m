//
//  contactUsViewController.m
//  SendMyGift
//
//  Created by sendmygift on 29/07/16.
//  Copyright © 2016 venkataramana. All rights reserved.
//

#import "contactUsViewController.h"
#import "SlideNavigationController.h"
@interface contactUsViewController ()

@end

@implementation contactUsViewController

- (void)viewDidLoad
{
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title = @"Contact Us";
 
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

 - (BOOL)slideNavigationControllerShouldDisplayLeftMenu
 {
 return YES;
 }
 
 - (BOOL)slideNavigationControllerShouldDisplayRightMenu
 {
 return YES;
 }

@end
