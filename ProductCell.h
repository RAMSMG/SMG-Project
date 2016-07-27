//
//  ProductCell.h
//  SendMyGift
//
//  Created by apple on 27/07/16.
//  Copyright © 2016 venkataramana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KTImageView.h"

@interface ProductCell : UITableViewCell
@property (weak, nonatomic) IBOutlet KTImageView *itemImage;
@property (weak, nonatomic) IBOutlet UILabel *itemName;
@property (weak, nonatomic) IBOutlet UILabel *actualPrice;
@property (weak, nonatomic) IBOutlet UILabel *specialPrice;
@property (weak, nonatomic) IBOutlet UIButton *btnWishList;

@end
