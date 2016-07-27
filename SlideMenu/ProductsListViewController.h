//
//  ProductsListViewController.h
//  SendMyGift
//
//Created by VENKATARAMANA on .
//  Copyright (c) 2013 VENKATARAMANA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductsListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong) NSMutableArray *produts;
@property (nonatomic, strong) NSString* selectedProductId;
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, assign) BOOL slideOutAnimationEnabled;

- (void)fetchCategoryData;
@end
