//Created by VENKATARAMANA on.
//  Copyright (c) 2013 VENKATARAMANA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SlideNavigationContorllerAnimator.h"

@interface SlideNavigationContorllerAnimatorFade : NSObject <SlideNavigationContorllerAnimator>

@property (nonatomic, assign) CGFloat maximumFadeAlpha;
@property (nonatomic, strong) UIColor *fadeColor;

- (id)initWithMaximumFadeAlpha:(CGFloat)maximumFadeAlpha andFadeColor:(UIColor *)fadeColor;

@end
