//
//  homeProductCell.h
//  SendMyGift
//
//  Created by sendmygift on 27/07/16.
//  Copyright © 2016 venkataramana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KTImageView.h"
@interface homeProductCell : UITableViewCell
@property (strong, nonatomic) IBOutlet KTImageView *itemImage;
@property (strong, nonatomic) IBOutlet UILabel *itemName;
@property (strong, nonatomic) IBOutlet UILabel *actualPrice;
@property (strong, nonatomic) IBOutlet UILabel *specialPrice;

@end
