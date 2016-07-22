//
//  KTImageView.h
//  UniversalImageView
//
//  Created by  Venkataramana on 09/06/16.
//  Copyright © 2016 Venkataramana. All rights reserved.
//

/**
 *  Subclass of UIImageView
 */
#import <UIKit/UIKit.h>
@interface KTImageView : UIImageView

/**
 *  Call this methods to show image from bundle or file path
 *
 *  @param imagePath image file path
 */
- (void) showImageWithBundleFilePath:(NSString*) imagePath;

/**
 *  Call this method to load image from a URL, image can be gif also
 *
 *  @param url  URL from image
 *  @param show true if need to show indicator while loading
 */
- (void) setImageWithURL:(NSURL*) url showIndicator:(BOOL) show;

@end
