//
//  homeProductListViewController.h
//  SendMyGift
//
//  Created by sendmygift on 21/07/16.
//  Copyright © 2016 Aryan Ghassemi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface homeProductListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>



@property (nonatomic, strong) NSMutableArray *produts;
@property (nonatomic, strong) NSString* selectedProductId;
@property (strong, nonatomic) IBOutlet UITableView *tableview;

//@property (strong, nonatomic) IBOutlet UITableView *tableview;

@property (nonatomic, assign) BOOL slideOutAnimationEnabled;

@end
