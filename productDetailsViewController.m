//
//  productDetailsViewController.m
//  SendMyGift
//
//  Created by sendmygift on 26/07/16.
//  Copyright © 2016 Aryan Ghassemi. All rights reserved.
//

#import "productDetailsViewController.h"
#import "SlideNavigationController.h"
@interface productDetailsViewController ()

@end

@implementation productDetailsViewController
@synthesize slideOutAnimationEnabled;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

-(BOOL)slideNavigationControllerShouldDisplayRightMenu
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
