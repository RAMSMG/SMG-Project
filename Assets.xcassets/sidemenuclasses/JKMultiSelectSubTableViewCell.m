//
//  JKMultiSelectSubTableViewCell.m
//  ExpandTableView
//
//  Created by VENKATARAMANA on 06 /07/16.
//  Copyright (c) 2013 VENKATARAMANA. All rights reserved.
////

#import "JKMultiSelectSubTableViewCell.h"
#import "JKSubTableViewCellCell.h"

@implementation JKMultiSelectSubTableViewCell

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    JKSubTableViewCellCell *cell = (JKSubTableViewCellCell *)[tableView cellForRowAtIndexPath:indexPath];
    BOOL isSwitchedOn = YES;
    BOOL isRowSelected = !(cell.selectionIndicatorImg.hidden);
    
    if(isRowSelected){
        cell.selectionIndicatorImg.hidden = true;
        isSwitchedOn = NO;
    } else {
        cell.selectionIndicatorImg.hidden = false;
        isSwitchedOn = YES;
    }
    
    [self.delegate didSelectRowAtChildIndex:indexPath.row selected:isSwitchedOn underParentIndex:self.parentIndex];
}


@end
