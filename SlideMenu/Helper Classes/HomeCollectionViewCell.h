//
//  HomeCollectionViewCell.h
//  APITEST
//
//  Created by  Venkataramana on 09/06/16.
//  Copyright © 2016 Venkataramana. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "KTImageView.h"
@interface HomeCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet KTImageView *img_thumb;
@property (weak, nonatomic) IBOutlet UILabel *lbl_name;

@end
