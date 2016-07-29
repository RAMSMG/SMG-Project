//
//  rateAppViewController.m
//  SendMyGift
//
//  Created by sendmygift on 29/07/16.
//  Copyright © 2016 venkataramana. All rights reserved.
//

#import "rateAppViewController.h"
#import "SlideNavigationController.h"
@interface rateAppViewController ()

@end

@implementation rateAppViewController

- (void)viewDidLoad
{
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title = @"Rate App";
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
