//
//  ProductsListViewController.h
//  SendMyGift
//
//  Created by apple on 14/07/16.
//  Copyright © 2016 Aryan Ghassemi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductsListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong) NSMutableArray *produts;
@property (nonatomic, strong) NSString* selectedProductId;
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, assign) BOOL slideOutAnimationEnabled;
- (void)fetchCategoryData;
@end
