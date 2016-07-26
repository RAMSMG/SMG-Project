

//Created by VENKATARAMANA on.
//  Copyright (c) 2013 VENKATARAMANA. All rights reserved.
//




#import <Foundation/Foundation.h>
#import "SlideNavigationContorllerAnimator.h"

@interface SlideNavigationContorllerAnimatorScaleAndFade : NSObject <SlideNavigationContorllerAnimator>

- (id)initWithMaximumFadeAlpha:(CGFloat)maximumFadeAlpha fadeColor:(UIColor *)fadeColor andMinimumScale:(CGFloat)minimumScale;

@end
