//
//  SimpleExampleViewController.m
//  ExpandTableView
//
//  Created by Jack Kwok on 7/6/13.
//  Copyright (c) 2013 Jack Kwok. All rights reserved.
//

#import "SimpleExampleViewController.h"
#define  url_fetch_category @"http://106.51.250.180/smgdemo/api/allcategory.php";

@interface SimpleExampleViewController ()

@end

@implementation SimpleExampleViewController
@synthesize expandTableView, dataModelArray, categories;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self initializeSampleDataModel];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    categories = [[NSMutableArray alloc] init];
    [self fetchCategoryData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initializeSampleDataModel {
    self.dataModelArray = [[NSMutableArray alloc] initWithCapacity:3];
    
    NSMutableArray *parent0 = [NSMutableArray arrayWithObjects:
                               [NSNumber numberWithBool:YES],
                               [NSNumber numberWithBool:NO],
                               [NSNumber numberWithBool:NO],
                               nil];
    NSMutableArray *parent1 = [NSMutableArray arrayWithObjects:
                               [NSNumber numberWithBool:NO],
                               [NSNumber numberWithBool:NO],
                               [NSNumber numberWithBool:NO],
                               nil];
    NSMutableArray *parent2 = [NSMutableArray arrayWithObjects:
                               [NSNumber numberWithBool:NO],
                               [NSNumber numberWithBool:YES],
                               nil];
    NSMutableArray *parent3 = [NSMutableArray arrayWithObjects:
                               [NSNumber numberWithBool:NO],
                               [NSNumber numberWithBool:YES],
                               [NSNumber numberWithBool:NO],
                               nil];
    //    [self.dataModelArray addObject:parent0];
    //    [self.dataModelArray addObject:parent1];
    //    [self.dataModelArray addObject:parent2];
    //    [self.dataModelArray addObject:parent3];
}

#pragma mark - JKExpandTableViewDelegate
// return YES if more than one child under this parent can be selected at the same time.  Otherwise, return NO.
// it is permissible to have a mix of multi-selectables and non-multi-selectables.
- (BOOL) shouldSupportMultipleSelectableChildrenAtParentIndex:(NSInteger) parentIndex {
    if ((parentIndex % 2) == 0) {
        return NO;
    } else {
        return YES;
    }
}

- (void) tableView:(UITableView *)tableView didSelectCellAtChildIndex:(NSInteger) childIndex withInParentCellIndex:(NSInteger) parentIndex {
    [[self.dataModelArray objectAtIndex:parentIndex] setObject:[NSNumber numberWithBool:YES] atIndex:childIndex];
    NSLog(@"data array: %@", self.dataModelArray);
}

- (void) tableView:(UITableView *)tableView didDeselectCellAtChildIndex:(NSInteger) childIndex withInParentCellIndex:(NSInteger) parentIndex {
    [[self.dataModelArray objectAtIndex:parentIndex] setObject:[NSNumber numberWithBool:NO] atIndex:childIndex];
    NSLog(@"data array: %@", self.dataModelArray);
}
/*
 - (UIColor *) foregroundColor {
 return [UIColor darkTextColor];
 }
 
 - (UIColor *) backgroundColor {
 return [UIColor grayColor];
 }
 */
- (UIFont *) fontForParents {
    return [UIFont fontWithName:@"American Typewriter" size:18];
}

- (UIFont *) fontForChildren {
    return [UIFont fontWithName:@"American Typewriter" size:18];
}

/*
 - (UIImage *) selectionIndicatorIcon {
 return [UIImage imageNamed:@"green_checkmark"];
 }
 */
#pragma mark - JKExpandTableViewDataSource
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
    NSLog(@"Childs: %lu", (unsigned long)[[[categories objectAtIndex:0] objectAtIndex:parentIndex] count]);
    return [[[categories objectAtIndex:0] objectAtIndex:parentIndex] count];
}

- (NSString *) labelForParentCellAtIndex:(NSInteger) parentIndex {
    return [NSString stringWithFormat:@"parent %ld", (long)parentIndex];
}

- (NSString *) labelForCellAtChildIndex:(NSInteger) childIndex withinParentCellIndex:(NSInteger) parentIndex {
    return [NSString stringWithFormat:@"child %ld of parent %ld", (long)childIndex, (long)parentIndex];
}

- (BOOL) shouldDisplaySelectedStateForCellAtChildIndex:(NSInteger) childIndex withinParentCellIndex:(NSInteger) parentIndex {
    NSMutableArray *childArray = [[self.categories objectAtIndex:0] objectAtIndex:parentIndex];
    NSLog(@"Child array: %@", childArray);
//    return [[childArray objectAtIndex:childIndex] boolValue];
    return 0;
}

- (UIImage *) iconForParentCellAtIndex:(NSInteger) parentIndex
{
    return [UIImage imageNamed:@"arrow-icon"];
}

- (UIImage *) iconForCellAtChildIndex:(NSInteger) childIndex withinParentCellIndex:(NSInteger) parentIndex {
    if (((childIndex + parentIndex) % 3) == 0) {
        return [UIImage imageNamed:@"heart"];
    } else if ((childIndex % 2) == 0) {
        return [UIImage imageNamed:@"cat"];
    } else {
        return [UIImage imageNamed:@"dog"];
    }
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

@end