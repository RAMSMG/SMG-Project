
//Created by VENKATARAMANA on.
//  Copyright (c) 2013 VENKATARAMANA. All rights reserved.
//




#import <UIKit/UIKit.h>
@interface RightMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
     
    NSArray* downlist;
}
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, assign) BOOL slideOutAnimationEnabled;
@end
