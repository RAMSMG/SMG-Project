//
//  ViewController.h
//  APITEST
//
//  Created by  Venkataramana on 09/06/16.
//  Copyright © 2016 Venkataramana. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"
#import "homeProductListViewController.h"


@interface ViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>
{
	__weak IBOutlet UICollectionView *collectionview;
	
}
@property (nonatomic, strong) NSMutableArray *categories;
@property (nonatomic, assign) BOOL slideOutAnimationEnabled;
@end

