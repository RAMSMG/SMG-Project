//
//  loginViewController.h
//  SendMyGift
//
//  Created by sendmygift on 29/07/16.
//  Copyright © 2016 venkataramana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loginViewController : UIViewController
{
     NSMutableData *receiveData;
}
@property (nonatomic, assign) BOOL slideOutAnimationEnabled;

@property (strong, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *emailIdTextField;
@property (strong, nonatomic) IBOutlet UITextField *mobileTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordTextField;
- (IBAction)registerButton:(id)sender;

@end
