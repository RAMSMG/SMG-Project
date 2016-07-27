//
//  MenuViewController.h
//  SlideMenu
//
//Created by VENKATARAMANA on 24/06/16.
//  Copyright (c) 2013 VENKATARAMANA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKExpandTableView.h"
#import "SlideNavigationController.h"
#import "ProductsListViewController.h"

@interface LeftMenuViewController : UIViewController <JKExpandTableViewDelegate, JKExpandTableViewDataSource>

{
    UIButton *navButton;
}
@property (nonatomic, strong) ProductsListViewController *plvc;
@property (weak, nonatomic) IBOutlet JKExpandTableView *expandTableView;
@property (nonatomic, strong) NSMutableArray *categories;
//@property (nonatomic, strong) NSMutableArray *catArray;
@property (nonatomic, assign) BOOL slideOutAnimationEnabled;
@end
/*
 (
 {
 "isSuccess": "Success!",
 "category": [{
 "main_cat_id": "341",
 "main_cat_name": "Flowers",
 "sub_cat_deatils": [{
 "sub_cat_id": "351",
 "sub_cat_name": "Flowers By Occasion "
 }, {
 "sub_cat_id": "342",
 "sub_cat_name": "Flowers By Design"
 }, {
 "sub_cat_id": "349",
 "sub_cat_name": "Flower Combos"
 }, {
 "sub_cat_id": "414",
 "sub_cat_name": "Flowers By Type"
 }, {
 "sub_cat_id": "345",
 "sub_cat_name": "Flowers By Price"
 }, {
 "sub_cat_id": "347",
 "sub_cat_name": "Flowers By Color"
 }]
 }, {
 "main_cat_id": "7",
 "main_cat_name": "Gifts",
 "sub_cat_deatils": [{
 "sub_cat_id": "39",
 "sub_cat_name": "Gifts By Relation"
 }, {
 "sub_cat_id": "36",
 "sub_cat_name": "Gifts For Her"
 }, {
 "sub_cat_id": "62",
 "sub_cat_name": "Gifts For Him"
 }, {
 "sub_cat_id": "35",
 "sub_cat_name": "Gifts For Kids"
 }, {
 "sub_cat_id": "37",
 "sub_cat_name": "Gifts By Price "
 }, {
 "sub_cat_id": "38",
 "sub_cat_name": "Gifts By Type"
 }]
 }, {
 "main_cat_id": "8",
 "main_cat_name": "Cakes",
 "sub_cat_deatils": [{
 "sub_cat_id": "240",
 "sub_cat_name": "Cakes By Flavour"
 }, {
 "sub_cat_id": "22",
 "sub_cat_name": "Cakes By Type"
 }, {
 "sub_cat_id": "23",
 "sub_cat_name": "Cakes By Occasions"
 }, {
 "sub_cat_id": "25",
 "sub_cat_name": "Designer Cakes"
 }, {
 "sub_cat_id": "24",
 "sub_cat_name": "Cakes By City"
 }, {
 "sub_cat_id": "257",
 "sub_cat_name": "Cakes By Price"
 }]
 }, {
 "main_cat_id": "9",
 "main_cat_name": "Occasions",
 "sub_cat_deatils": [{
 "sub_cat_id": "103",
 "sub_cat_name": "Daily Occasions"
 }, {
 "sub_cat_id": "28",
 "sub_cat_name": "Special Occasions"
 }, {
 "sub_cat_id": "27",
 "sub_cat_name": "Birthday"
 }]
 }, {
 "main_cat_id": "10",
 "main_cat_name": "City Specials",
 "sub_cat_deatils": [{
 "sub_cat_id": "29",
 "sub_cat_name": "Mumbai Special"
 }, {
 "sub_cat_id": "30",
 "sub_cat_name": "Bangalore Special"
 }, {
 "sub_cat_id": "31",
 "sub_cat_name": "Delhi Special"
 }]
 }, {
 "main_cat_id": "130",
 "main_cat_name": "Combos",
 "sub_cat_deatils": [{
 "sub_cat_id": "327",
 "sub_cat_name": "Flowers Combos"
 }, {
 "sub_cat_id": "131",
 "sub_cat_name": "Double Delight"
 }, {
 "sub_cat_id": "328",
 "sub_cat_name": "Cake Combos"
 }, {
 "sub_cat_id": "132",
 "sub_cat_name": "Triple Delight"
 }, {
 "sub_cat_id": "901",
 "sub_cat_name": "EID Special"
 }]
 }, {
 "main_cat_id": "150",
 "main_cat_name": "Personalized Gifts",
 "sub_cat_deatils": [{
 "sub_cat_id": "291",
 "sub_cat_name": "Personal Items"
 }, {
 "sub_cat_id": "296",
 "sub_cat_name": "Desktop & Tabletop"
 }, {
 "sub_cat_id": "293",
 "sub_cat_name": "Wall Hangings"
 }, {
 "sub_cat_id": "295",
 "sub_cat_name": "Photo Frames"
 }]
 }]
 }
 )
 */
