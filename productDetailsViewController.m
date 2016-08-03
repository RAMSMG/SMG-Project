//
//  productDetailsViewController.m
//  SendMyGift
//
//Created by VENKATARAMANA on .
//  Copyright (c) 2013 VENKATARAMANA. All rights reserved.
//

//

#import "productDetailsViewController.h"
#import "SlideNavigationController.h"
#define  url_fetch_product_id @"http://www.sendmygift.com/api/product_details.php?product_id";
@interface productDetailsViewController ()
{
    NSArray *itemTitlearr,*mainImagearray,*smallImagesarray,*priceLabelarray;
    
}
@end

@implementation productDetailsViewController
@synthesize slideOutAnimationEnabled,selectedProductId,produts,mainImage;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title = @"SendMyGift";
    [self fetchCategoryData];
    
       // Do any additional setup after loading the view.
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

- (void)fetchCategoryData
{
    produts = [NSMutableArray new];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.timeoutIntervalForRequest = 120;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSString *urlStr = [NSString stringWithFormat:@"http://www.sendmygift.com/api/product_details.php?product_id=%@",self.selectedProductId];
    
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
                    
                    itemTitlearr =[[jsonObject valueForKey:@"result"]valueForKey:@"name"];
                    mainImagearray =[[jsonObject valueForKey:@"result"]valueForKey:@"img"];
                    smallImagesarray=[[jsonObject valueForKey:@"result"]valueForKey:@"small_img"];
                    priceLabelarray=[[jsonObject valueForKey:@"result"]valueForKey:@"price"];
//                    titlearray=[[jsonObject valueForKey:@"result"]valueForKey:@"sub_cat_name"];
                    NSLog(@"itemTitlearr %@,%lu",itemTitlearr,(unsigned long)itemTitlearr.count);
                    NSLog(@"mainImagearray %@, %lu",mainImagearray,(unsigned long)mainImagearray.count);
                    NSLog(@"smallImagesarray %@,%lu",smallImagesarray,(unsigned long)smallImagesarray.count);
                    
                }
            }
        });
    }];
    [task resume];
}

@end
