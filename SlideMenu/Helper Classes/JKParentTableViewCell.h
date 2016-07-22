//
//  JKParentTableViewCell.h
//  ExpandTableView
//
//  Created by VENKATARAMANA on 06 /07/16.
//  Copyright (c) 2013 VENKATARAMANA. All rights reserved.
///

#import <UIKit/UIKit.h>

@interface JKParentTableViewCell : UITableViewCell {
    UIImageView *iconImage;
    UILabel *label;
    UIImageView *selectionIndicatorImgView;
    NSInteger parentIndex;
}

@property (nonatomic,strong) UIImageView *iconImage;
@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UIImage *selectionIndicatorImg;
@property (nonatomic,strong) UIImageView *selectionIndicatorImgView;
@property (nonatomic) NSInteger parentIndex;

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier;
- (void)setupDisplay;
- (void)rotateIconToExpanded;
- (void)rotateIconToCollapsed;
- (void)selectionIndicatorState:(BOOL) visible;
- (void)setCellForegroundColor:(UIColor *) foregroundColor;
- (void)setCellBackgroundColor:(UIColor *) backgroundColor;

@end
