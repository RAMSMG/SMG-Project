//
//  privacyPolicyViewController.m
//  SendMyGift
//
//  Created by  Venkataramana on 20/06/16.
//  Copyright © 2016 Venkataramana. All rights reserved.
//

#import "privacyPolicyViewController.h"

@interface privacyPolicyViewController ()

@end

@implementation privacyPolicyViewController

- (void)viewDidLoad

{
    //*** viewcontroller creating**//
    UIViewController * vc = [[UIViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
    
     //**navigation bar**//
   
    //do something like background color, title, etc you self
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
