//
//  privacyPolicyViewController.m
//  SendMyGift
//
//  Created by  Venkataramana on 20/06/16.
//  Copyright © 2016 Venkataramana. All rights reserved.
//

#import "privacyPolicyViewController.h"
#import "SlideNavigationController.h"
@interface privacyPolicyViewController ()

@end

@implementation privacyPolicyViewController
@synthesize slideOutAnimationEnabled;
- (void)viewDidLoad

{
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title = @"PRIVACY POLICY";
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
