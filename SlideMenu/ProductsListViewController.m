//
//  ProductsListViewController.m
//  SendMyGift
//
//  Created by apple on 14/07/16.
//  Copyright © 2016 Aryan Ghassemi. All rights reserved.
//

#import "ProductsListViewController.h"
#define  url_fetch_product_id @"http://www.sendmygift.com/api/products.php?category_id";
@interface ProductsListViewController ()
{
    NSArray *arr,*imagesarray,*productpricearray,*specialpricearray;
}

@end

@implementation ProductsListViewController
@synthesize tableview, produts,slideOutAnimationEnabled;
- (void)viewDidLoad {
    
    
    [super viewDidLoad];

    NSLog(@"Selected product list is : %@", self.selectedProductId);
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title = @"SendMyGift";
}
-(void)viewWillAppear:(BOOL)animated
{
    [self fetchCategoryData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark fetching data



- (void)fetchCategoryData
{  produts = [NSMutableArray new];
    
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
                    
                   arr =[[jsonObject valueForKey:@"products"]valueForKey:@"product_name"];
                    imagesarray =[[jsonObject valueForKey:@"products"]valueForKey:@"product_image"];
                    productpricearray=[[jsonObject valueForKey:@"products"]valueForKey:@"product_price"];
                    specialpricearray=[[jsonObject valueForKey:@"products"]valueForKey:@"special_price"];

                    NSLog(@"arr %@,%lu",arr,(unsigned long)arr.count);
                    NSLog(@"productpricearray %@,%lu",productpricearray,(unsigned long)productpricearray.count);
                    NSLog(@"specialpricearray %@,%lu",specialpricearray,(unsigned long)specialpricearray.count);


                    [tableview reloadData];
            
                }
            }
        });
    }];
    [task resume];
}




#pragma mark - Table view data source




- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    UITableViewCell* cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"table"];
    cell.textLabel.text =[arr objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"OpenSans" size:15.0];
    cell.textLabel.text=[productpricearray objectAtIndex:indexPath.row];
    
    

    NSString *imageUrlString = [imagesarray objectAtIndex:indexPath.row];
    NSURL *url = [NSURL URLWithString:imageUrlString];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    cell.imageView.image = image;
    
    
    
    return  cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100; //You can set height of cell here.
}

@end
