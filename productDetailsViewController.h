//
//  productDetailsViewController.h
//  SendMyGift
//
///Created by VENKATARAMANA on .
//  Copyright (c) 2013 VENKATARAMANA. All rights reserved.
//

//

#import <UIKit/UIKit.h>
#import "KTImageView.h"
@interface productDetailsViewController : UIViewController
@property (nonatomic, assign) BOOL slideOutAnimationEnabled;
@property (strong, nonatomic) IBOutlet UILabel *itemTitle;
@property (strong, nonatomic) IBOutlet KTImageView *mainImage;
@end
