

//Created by VENKATARAMANA on.
//  Copyright (c) 2013 VENKATARAMANA. All rights reserved.
//




#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@protocol SlideNavigationControllerDelegate <NSObject>
@optional
- (BOOL)slideNavigationControllerShouldDisplayRightMenu;
- (BOOL)slideNavigationControllerShouldDisplayLeftMenu;
@end

typedef  enum{
	MenuLeft = 1,
	MenuRight = 2
}Menu;

@protocol SlideNavigationContorllerAnimator;
@interface SlideNavigationController : UINavigationController <UINavigationControllerDelegate>

extern NSString * const SlideNavigationControllerDidOpen;
extern NSString  *const SlideNavigationControllerDidClose;
extern NSString  *const SlideNavigationControllerDidReveal;

@property (nonatomic, assign) BOOL avoidSwitchingToSameClassViewController;
@property (nonatomic, assign) BOOL enableSwipeGesture;
@property (nonatomic, assign) BOOL enableShadow;
@property (nonatomic, strong) UIViewController *rightMenu;
@property (nonatomic, strong) UIViewController *leftMenu;
@property (nonatomic, strong) UIBarButtonItem *leftBarButtonItem;
@property (nonatomic, strong) UIBarButtonItem *rightBarButtonItem;
@property (nonatomic, assign) CGFloat portraitSlideOffset;
@property (nonatomic, assign) CGFloat landscapeSlideOffset;
@property (nonatomic, assign) CGFloat panGestureSideOffset;
@property (nonatomic, assign) CGFloat menuRevealAnimationDuration;
@property (nonatomic, assign) UIViewAnimationOptions menuRevealAnimationOption;
@property (nonatomic, strong) id <SlideNavigationContorllerAnimator> menuRevealAnimator;

+ (SlideNavigationController *)sharedInstance;
- (void)switchToViewController:(UIViewController *)viewController withCompletion:(void (^)())completion __deprecated;
- (void)popToRootAndSwitchToViewController:(UIViewController *)viewController withSlideOutAnimation:(BOOL)slideOutAnimation andCompletion:(void (^)())completion;
- (void)popToRootAndSwitchToViewController:(UIViewController *)viewController withCompletion:(void (^)())completion;
- (void)popAllAndSwitchToViewController:(UIViewController *)viewController withSlideOutAnimation:(BOOL)slideOutAnimation andCompletion:(void (^)())completion;
- (void)popAllAndSwitchToViewController:(UIViewController *)viewController withCompletion:(void (^)())completion;
- (void)bounceMenu:(Menu)menu withCompletion:(void (^)())completion;
- (void)openMenu:(Menu)menu withCompletion:(void (^)())completion;
- (void)closeMenuWithCompletion:(void (^)())completion;
- (void)toggleLeftMenu;
- (void)toggleRightMenu;
- (BOOL)isMenuOpen;
- (void)leftMenuSelected:(id)sender;

@end
