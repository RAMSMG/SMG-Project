//
//  MenuViewController.m
//  SlideMenu
//
//  Created by VENKATARAMANA on 24/06/16.
//  Copyright (c) 2013 VENKATARAMANA. All rights reserved.
//
#import "ProductsListViewController.h"
#import "LeftMenuViewController.h"
#import "SlideNavigationController.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"
#define  url_fetch_category @"http://www.sendmygift.com/api/allcategory.php";

@implementation LeftMenuViewController
@synthesize expandTableView, categories,slideOutAnimationEnabled;
#pragma mark - UIViewController Methods -

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self.slideOutAnimationEnabled = YES;
    
	return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad
{
    [self.navigationController.navigationBar setHidden:NO];
    [super viewDidLoad];
    
       [self topview];
    
      id aObj = @[@"One", @"Two"];
    
    if ([aObj isKindOfClass:[NSString class]])
    {
        NSLog(@"Number of characters : %lu", (unsigned long)((NSString*)aObj).length);
    }
    else
    {
        NSLog(@"Number of Objects : %lu", (unsigned long)((NSArray*)aObj).count);
    }
    
    categories = [[NSMutableArray alloc] init];
    [self fetchCategoryData];
}

#pragma mark - JKExpandTableViewDelegate



- (BOOL) shouldSupportMultipleSelectableChildrenAtParentIndex:(NSInteger) parentIndex {
    if ((parentIndex % 2) == 0) {
        return NO;
    } else {
        return YES;
    }
}


- (void) tableView:(UITableView *)tableView didSelectCellAtChildIndex:(NSInteger) childIndex withInParentCellIndex:(NSInteger) parentIndex
{
    NSLog(@"%@", [[[[[categories objectAtIndex:0] objectAtIndex:parentIndex] valueForKey:@"sub_cat_deatils"] objectAtIndex:childIndex] valueForKey:@"sub_cat_id"]);
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    ProductsListViewController *plvc = [mainStoryboard instantiateViewControllerWithIdentifier:@"ProductsListView"];
    plvc.selectedProductId = [[[[[categories objectAtIndex:0] objectAtIndex:parentIndex] valueForKey:@"sub_cat_deatils"] objectAtIndex:childIndex] valueForKey:@"sub_cat_id"];
    
    [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:plvc
                                                             withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                     andCompletion:nil];
    
}

- (void) tableView:(UITableView *)tableView didDeselectCellAtChildIndex:(NSInteger) childIndex withInParentCellIndex:(NSInteger) parentIndex
{
    
}

- (UIFont *) fontForParents {
    return [UIFont fontWithName:@"OpenSans-Regular" size:18];
}

- (UIFont *) fontForChildren {
    return [UIFont fontWithName:@"OpenSans-Regular" size:13];
}


- (NSInteger) numberOfParentCells {
    if (categories.count)
    {
        NSLog(@"Blah Blah %lu",(unsigned long)[[self.categories objectAtIndex:0] count]);
        return [[self.categories objectAtIndex:0] count];
    }
    return 0;
}

- (NSInteger) numberOfChildCellsUnderParentIndex:(NSInteger) parentIndex
{
    NSLog(@"A++++++++++++++%@ +++++++++++++++", [categories objectAtIndex:0]);
    NSLog(@"B-------------%@ ------------", [[categories objectAtIndex:0] objectAtIndex:parentIndex]);
    NSLog(@"Childs: %lu", [[[[categories objectAtIndex:0] objectAtIndex:parentIndex] valueForKey:@"sub_cat_deatils"] count]);
    return [[[[categories objectAtIndex:0] objectAtIndex:parentIndex] valueForKey:@"sub_cat_deatils"] count];
}

- (NSString *) labelForParentCellAtIndex:(NSInteger) parentIndex {
    NSLog(@"%@",categories);
    return [[[categories objectAtIndex:0] objectAtIndex:parentIndex] valueForKey:@"main_cat_name"];
    }

- (NSString *) labelForCellAtChildIndex:(NSInteger) childIndex withinParentCellIndex:(NSInteger) parentIndex {
    
    return [[[[[categories objectAtIndex:0] objectAtIndex:parentIndex] valueForKey:@"sub_cat_deatils"] objectAtIndex:childIndex] valueForKey:@"sub_cat_name"];
}

- (BOOL) shouldDisplaySelectedStateForCellAtChildIndex:(NSInteger) childIndex withinParentCellIndex:(NSInteger) parentIndex
{
       return 0;
}

- (UIImage *) iconForParentCellAtIndex:(NSInteger) parentIndex
{


    return [UIImage imageNamed:@"arrow-icon"];
    
}


- (BOOL) shouldRotateIconForParentOnToggle {
    return YES;
}

- (void)fetchCategoryData
{
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.timeoutIntervalForRequest = 120;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    NSString *urlStr = url_fetch_category;
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
                NSMutableDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&err];
                if (error) {
                    NSLog(@"%@",error.description);
                    
                }else{
                    NSLog(@"%@",jsonObject);
                    if ([[jsonObject valueForKey:@"isSuccess"] isEqualToString:@"Success!"])
                    {
                        [categories removeAllObjects];
                        [categories addObject:[jsonObject valueForKey:@"category"]];
                        NSLog(@"All Categories: %@", categories);
                        NSLog(@"All Categories: %lu", (unsigned long)categories.count);
                        [self.expandTableView setDataSourceDelegate:self];
                        [self.expandTableView setTableViewDelegate:self];
                        [expandTableView reloadData];
                    }
                }
            }
        });
    }];
    [task resume];
}




-(BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

-(BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return YES;
}

#pragma mark uiview

-(void)topview
{
UIView *oneView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
    oneView.backgroundColor=[UIColor colorWithRed:207.0/255.0f green:10.0/255.0f blue:139.0/255.0f alpha:1.0];


[self.view addSubview:oneView];
    
    
    //leftbutton
    UIButton *lefthome = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    lefthome.frame = CGRectMake(20, 29, 46, 30);
    [lefthome setTitle:@"Home" forState:UIControlStateNormal];
   
    [lefthome setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
 [lefthome addTarget:self action:@selector(homebuttonpressed:) forControlEvents:UIControlEventTouchUpInside];
    [oneView addSubview:lefthome];
    //rightbutton
    
    }
-(void)homebuttonpressed
{
   
}
    @end
