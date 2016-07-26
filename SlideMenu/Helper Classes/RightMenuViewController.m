
//Created by VENKATARAMANA on.
//  Copyright (c) 2013 VENKATARAMANA. All rights reserved.
//





#import "RightMenuViewController.h"
#import "privacyPolicyViewController.h"
@implementation RightMenuViewController

#pragma mark - UIViewController Methods -

- (void)viewDidLoad
{
    
    
	[super viewDidLoad];
    [self topview];
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    	self.tableView.separatorColor = [UIColor clearColor];
    
 downlist=@[@"My Order",@"My Wishlist",@"Log Out",@"Privacy Policy",@"Terms & Conditions",@"Contact Us",@"Rate App"];
	
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

//        cell.detailTextLabel.text = @"Section 0";
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
   
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UIViewController * vc = [[UIViewController alloc] init];
    
   
    
    NSString * storyboardName = @"MainStoryboard_iPhone";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"PrivacyPolicy"];
    [self presentViewController:vc animated:YES completion:nil];
   }
-(void)topview
{
    UIView *oneView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 414, 60)];
    oneView.backgroundColor=[UIColor colorWithRed:207.0/255.0f green:10.0/255.0f blue:139.0/255.0f alpha:1.0];
    
    
    [self.view addSubview:oneView];
    
//    UIButton *addProject = [UIButton buttonWithType: UIButtonTypeRoundedRect];
//    addProject.frame = CGRectMake(20, 29, 46, 30);
//    [addProject setTitle:@"Home" forState:UIControlStateNormal];
//    [addProject setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [addProject addTarget:self action:@selector(homebuttonpressed:) forControlEvents:UIControlEventTouchUpInside];
//    [oneView addSubview:addProject];
}

@end
