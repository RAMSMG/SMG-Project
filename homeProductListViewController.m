//
//  homeProductListViewController.m
//  SendMyGift
//
//  Created by sendmygift on 27/07/16.
//  Copyright © 2016 venkataramana. All rights reserved.
//

#import "homeProductListViewController.h"
#import "homeProductCell.h"
#import "SlideNavigationController.h"
@interface homeProductListViewController ()
{
    NSArray *itemarr,*imagesarray,*actualPricearray,*SpecialPricearray;
    
}
@end

@implementation homeProductListViewController
@synthesize tableview, produts,slideOutAnimationEnabled;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)fetchCategoryData
{
    produts = [NSMutableArray new];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.timeoutIntervalForRequest = 120;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSString *urlStr = [NSString stringWithFormat:@"http://www.sendmygift.com/api/products.php?category_id=%@",self.selectedProductId];
    
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
                    
                    itemarr =[[jsonObject valueForKey:@"products"]valueForKey:@"product_name"];
                    imagesarray =[[jsonObject valueForKey:@"products"]valueForKey:@"product_image"];
                    actualPricearray=[[jsonObject valueForKey:@"products"]valueForKey:@"product_price"];
                    SpecialPricearray=[[jsonObject valueForKey:@"products"]valueForKey:@"special_price"];
//                    titlearray=[[jsonObject valueForKey:@"products"]valueForKey:@"sub_cat_name"];
                    
                    NSLog(@"itemarr %@,%lu",itemarr,(unsigned long)itemarr.count);
                    NSLog(@"actualPricearray %@, %lu",actualPricearray,(unsigned long)actualPricearray.count);
                    NSLog(@"specialpricearray %@,%lu",SpecialPricearray,(unsigned long)SpecialPricearray.count);
                    
                    
                    [tableview reloadData];
                    
                }
            }
        });
    }];
    [task resume];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return itemarr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    homeProductCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
//    [cell.btnWishList addTarget:self action:@selector(addToWishList:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.itemName.text =[itemarr objectAtIndex:indexPath.row];
    cell.itemName.font = [UIFont fontWithName:@"OpenSans" size:16.0];
    cell.actualPrice.text = [actualPricearray objectAtIndex:indexPath.row];
    cell.actualPrice.font = [UIFont fontWithName:@"OpenSans" size:9.0];
    cell.specialPrice.text = [SpecialPricearray objectAtIndex:indexPath.row];
    cell.specialPrice.font = [UIFont fontWithName:@"OpenSans" size:12.0];
    //    cell.textLabel.text=[productpricearray objectAtIndex:indexPath.row];
    
    
    
    NSString *imageUrlString = [imagesarray objectAtIndex:indexPath.row];
    
    NSURL *url = [NSURL URLWithString:imageUrlString];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    cell.itemImage.image = image;
    
    
    
    return  cell;
    
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    homeProductListViewController *pdvc = [mainStoryboard instantiateViewControllerWithIdentifier:@"homeProductList"];
    //    hplvc.selectedProductId = [[[[[categories objectAtIndex:0] objectAtIndex:parentIndex] valueForKey:@"sub_cat_deatils"] objectAtIndex:childIndex] valueForKey:@"sub_cat_id"];
    
    [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:pdvc
                                                             withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                     andCompletion:nil];
    
    
}

- (void)addToWishList: (UIButton*)clickedButton
{
    NSLog(@"Button clicked to add to wishlist");
}

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return YES;
}


@end
