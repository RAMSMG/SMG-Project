
//Created by VENKATARAMANA on.
//  Copyright (c) 2013 VENKATARAMANA. All rights reserved.
//




#import "homeProductListViewController.h"
#define  url_fetch_product_id @"http://www.sendmygift.com/api/products.php?category_id";
@interface homeProductListViewController ()
{
    NSArray *arr,*imagesarray;
}
@end

@implementation homeProductListViewController
@synthesize tableview, produts,slideOutAnimationEnabled;
- (void)viewDidLoad
{
    
    [self fetchCategoryData];
    [super viewDidLoad];
    NSLog(@"Selected product list is : %@", self.selectedProductId);

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return YES;
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
                    
                    arr =[[jsonObject valueForKey:@"category_name"]valueForKey:@"product_name"];
                    imagesarray =[[jsonObject valueForKey:@"category_name"]valueForKey:@"product_image"];
                    
                    NSLog(@"arr %@,%lu",arr,(unsigned long)arr.count);
                    
                    
                    [tableview reloadData];
                    
                }
            }
        });
    }];
    [task resume];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    UITableViewCell* cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"table"];
    cell.textLabel.text =[arr objectAtIndex:indexPath.row];
    
    NSString *imageUrlString = [imagesarray objectAtIndex:indexPath.row];
    NSURL *url = [NSURL URLWithString:imageUrlString];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    cell.imageView.image = image;
    
    
    
    return  cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80; //You can set height of cell here.
}


@end
