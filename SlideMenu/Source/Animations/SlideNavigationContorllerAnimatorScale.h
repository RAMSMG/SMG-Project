

//Created by VENKATARAMANA on.
//  Copyright (c) 2013 VENKATARAMANA. All rights reserved.
//




#import <Foundation/Foundation.h>
#import "SlideNavigationContorllerAnimator.h"

@interface SlideNavigationContorllerAnimatorScale : NSObject <SlideNavigationContorllerAnimator>

@property (nonatomic, assign) CGFloat minimumScale;

- (id)initWithMinimumScale:(CGFloat)minimumScale;

@end
