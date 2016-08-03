//
//  loginViewController.m
//  SendMyGift
//
//  Created by sendmygift on 29/07/16.
//  Copyright © 2016 venkataramana. All rights reserved.
//

#import "loginViewController.h"
#import "SlideNavigationController.h"
@interface loginViewController ()

@end

@implementation loginViewController
@synthesize slideOutAnimationEnabled,firstNameTextField,lastNameTextField,emailIdTextField,mobileTextField,passwordTextField,confirmPasswordTextField;

- (void)viewDidLoad
{
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title = @"Register";
    [super viewDidLoad];
  }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return YES;
}


- (IBAction)registerButton:(id)sender
{
//    NSString *str_login_name= firstNameTextField.text;
//    NSString *str_login_pwd= passwordTextField.text;
//    
//    
//    
//    NSURL *theURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.sendmygift.com/api/login.php?email=%22+str_login_name+%22&&hash=%22+str_login_pwd"]]; 
//    
//    NSURLRequest *req = [NSURLRequest requestWithURL:theURL];
//    NSURLConnection *connection = [NSURLConnection connectionWithRequest:req delegate:self];
//    if (connection) {
//        NSLog(@"connection successful");
//    }
//    else {
//        NSLog(@"Failed");
//    }
//}
    
    receiveData = [NSMutableData new];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.timeoutIntervalForRequest = 120;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSString *urlStr = [NSString stringWithFormat:@"https://www.sendmygift.com/api/login.php?email=%%22+str_login_name+%22%&hash=%%22+str_login_pwd"];
    
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (error)
            {
                NSLog(@"%@",error.localizedDescription);
            }
            else
            {
                NSError *err = nil;
                
                NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&err];
                if (error) {
                    NSLog(@"%@",error.description);
                    
                }else{
                    NSLog(@"%@",jsonObject);
                    
                  
                    
                                    
                }
            }
        });
    }];
    [task resume];
}


@end
