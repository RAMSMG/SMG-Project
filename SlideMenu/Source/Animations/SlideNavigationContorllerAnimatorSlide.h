//Created by VENKATARAMANA on.
//  Copyright (c) 2013 VENKATARAMANA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SlideNavigationContorllerAnimator.h"

@interface SlideNavigationContorllerAnimatorSlide : NSObject <SlideNavigationContorllerAnimator>

@property (nonatomic, assign) CGFloat slideMovement;

- (id)initWithSlideMovement:(CGFloat)slideMovement;

@end
