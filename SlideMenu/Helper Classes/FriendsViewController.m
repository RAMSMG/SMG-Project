//
//  FriendsViewController.m
//  SlideMenu
//
//  Created by  Venkataramana on 11/06/16.
//  Copyright © 2016 Venkataramana. All rights reserved.
//


#import "FriendsViewController.h"

@implementation FriendsViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
}

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
	return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"friendCell"];
	cell.textLabel.text = [NSString stringWithFormat:@"Friend %ld", (long)indexPath.row];
	return cell;
}

@end
