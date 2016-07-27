//
//  homeProductListViewController.h
//  SendMyGift
//
//  Created by sendmygift on 27/07/16.
//  Copyright © 2016 venkataramana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface homeProductListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *produts;
@property (nonatomic, strong) NSString* selectedProductId;
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, assign) BOOL slideOutAnimationEnabled;
- (void)fetchCategoryData;
@end
