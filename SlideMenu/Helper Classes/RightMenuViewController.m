
//Created by VENKATARAMANA on.
//  Copyright (c) 2013 VENKATARAMANA. All rights reserved.
//





#import "RightMenuViewController.h"
#import "privacyPolicyViewController.h"
#import "termsAndConditionsViewController.h"
#import "SlideNavigationController.h"
@implementation RightMenuViewController

#pragma mark - UIViewController Methods -

- (void)viewDidLoad
{
    
    
	[super viewDidLoad];
//   [self topview];
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    	self.tableView.separatorColor = [UIColor clearColor];
    
 downlist=@[@"My Order",@"My Wishlist",@"Log In",@"Privacy Policy",@"Terms & Conditions",@"Contact Us",@"Rate App"];
	
//	UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rightMenu.jpg"]];
//	self.tableView.backgroundView = imageView;
}


#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 7;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 20)];
	view.backgroundColor = [UIColor clearColor];
	return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    static NSString *reuseIdentifier = @"MyCell";
    cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    
    if (indexPath.section == 0)
    {
        cell.textLabel.text = [downlist objectAtIndex:indexPath.row];
       cell.textLabel.textAlignment = NSTextAlignmentRight;
        cell.textLabel.font=[UIFont fontWithName:@"OpenSans-Regular" size:16];
    }
    return cell;
   
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    UIViewController *pPvc = nil;
    switch (indexPath.row) {
        case 0:
            pPvc = [storyboard instantiateViewControllerWithIdentifier:@"My Order"];
            break;
        case 1:
            pPvc = [storyboard instantiateViewControllerWithIdentifier:@"My Wishlist"];
            break;
        case 2:
            pPvc = [storyboard instantiateViewControllerWithIdentifier:@"Log In"];
            break;
            
        case 3:
            pPvc = [storyboard instantiateViewControllerWithIdentifier:@"privacyPolicy"];
            break;
        case 4:
            pPvc = [storyboard instantiateViewControllerWithIdentifier:@"Terms & Conditions"];
            break;
        case 5:
            pPvc = [storyboard instantiateViewControllerWithIdentifier:@"Contact Us"];
            break;
            
        default:
            pPvc = [storyboard instantiateViewControllerWithIdentifier:@"Rate App"];
            break;

            
            
    }
//    [[self navigationController] pushViewController:viewController animated:YES];
    
        [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:pPvc
       
                                                                 withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                         andCompletion:nil];
//    -(void)topview
//    {
//        UIView *oneView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
//        oneView.backgroundColor=[UIColor colorWithRed:207.0/255.0f green:10.0/255.0f blue:139.0/255.0f alpha:1.0];
//        
//        
//        [self.view addSubview:oneView];
//        
//        
//        //leftbutton
//        UIButton *lefthome = [UIButton buttonWithType: UIButtonTypeRoundedRect];
//        lefthome.frame = CGRectMake(20, 29, 46, 30);
//        [lefthome setTitle:@"Home" forState:UIControlStateNormal];
//        
//        [lefthome setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        // [lefthome addTarget:self action:@selector(homebuttonpressed:) forControlEvents:UIControlEventTouchUpInside];
//        [oneView addSubview:lefthome];
//        //rightbutton
//        
//    }
//
//
}
@end
