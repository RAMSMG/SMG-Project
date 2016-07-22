//
//  RightMenuViewController.h
//  SlideMenu
//
//  Created by  Venkataramana on 20/06/16.
//  Copyright © 2016 Venkataramana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationContorllerAnimator.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"

@interface RightMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
     
    NSArray* downlist;
}
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, assign) BOOL slideOutAnimationEnabled;
@end
