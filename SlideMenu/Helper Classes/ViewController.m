//
//  ViewController.m
//  APITEST
//
//  Created by  Venkataramana on 09/06/16.
//  Copyright © 2016 Venkataramana. All rights reserved.
//

#import "ViewController.h"
#import "HomeCollectionViewCell.h"
#import "SlideNavigationController.h"
#import "homeProductListViewController.h"
#define  url_fetch_thumbnails @"https://www.sendmygift.com/api/thumbnails.php";

@interface ViewController ()
{
	NSArray *arr;
}
@end

@implementation ViewController
@synthesize categories,slideOutAnimationEnabled;
- (void)viewDidLoad
{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"OFFERS" message:@"Currently You Don't Have Any Offers" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    
     alertController.view.tintColor = [UIColor colorWithRed:207.0/255.0f green:10.0/255.0f blue:139.0/255.0f alpha:1.0];
  
    [self presentViewController:alertController animated:YES completion:nil];
    
   
//  font style
    
    for (NSString* family in [UIFont familyNames])
    {
        NSLog(@"%@", family);
        
        for (NSString* name in [UIFont fontNamesForFamilyName: family])
        {
            NSLog(@"  %@", name);
        }
    }
    
	[super viewDidLoad];
    //collection view
	collectionview.dataSource = self;
	collectionview.delegate = self;
    
    /*navigationbar title n color*/
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title = @"SendMyGift";
   
    /*navigation bar hiding purpose*/
 [[self navigationController] setNavigationBarHidden:NO animated:YES];
    [self fetchPrimaryData];
}

- (void)fetchPrimaryData
{
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.timeoutIntervalForRequest = 120;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    NSString *urlStr = url_fetch_thumbnails;
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                NSLog(@"%@",error.localizedDescription);
            }else{
                NSError *err = nil;
                id responseStr = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&err];
                if (error) {
                    NSLog(@"%@",error.description);
                    
                }else{
                    NSLog(@"%@",responseStr);
                    if ([[responseStr valueForKey:@"isSuccess"] isEqualToString:@"Success!"]) {
                        arr = [responseStr valueForKey:@"thumbnail"];
                        [collectionview reloadData];
                    }
                }
            }
        });        
    }];
    [task resume];
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
	return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
	return arr.count;
	
}

- (BOOL) shouldSupportMultipleSelectableChildrenAtParentIndex:(NSInteger) parentIndex {
    if ((parentIndex % 2) == 0) {
        return NO;
    } else {
        return YES;
    }
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
	HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCollectionViewCell" forIndexPath:indexPath];
	NSString *str = [[arr objectAtIndex:indexPath.row] valueForKey:@"cat_image"];
	NSURL *url = [NSURL URLWithString:str];
	[cell.img_thumb setImageWithURL:url showIndicator:YES];
	cell.layer.cornerRadius = 5;

	cell.layer.borderWidth = 1;
//	cell.layer.borderColor = [UIColor purpleColor].CGColor;
   cell.layer.borderColor=[UIColor colorWithRed:207.0/255.0f green:10.0/255.0f blue:139.0/255.0f alpha:1.0].CGColor;
	cell.layer.masksToBounds = YES;
	cell.lbl_name.text = [arr[indexPath.row] valueForKey:@"cat_name"];
    
	return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    homeProductListViewController *hplvc = [mainStoryboard instantiateViewControllerWithIdentifier:@"homeProductList"];
//    hplvc.selectedProductId = [[[[[categories objectAtIndex:0] objectAtIndex:parentIndex] valueForKey:@"sub_cat_deatils"] objectAtIndex:childIndex] valueForKey:@"sub_cat_id"];
    
    [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:hplvc
                                                             withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                     andCompletion:nil];
    

  
}
#pragma mark collection view cell paddings


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
	return 2.0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
				  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
	CGFloat width = self.view.frame.size.width/4.0f;
	return CGSizeMake(width-2, 90);
     
}
- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}
-(BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

-(BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return YES;
}
@end
