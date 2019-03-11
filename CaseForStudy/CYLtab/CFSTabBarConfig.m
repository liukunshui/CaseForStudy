//
//  CFSTabBarConfig.m
//  CaseForStudy
//
//  Created by lks on 2018/12/11.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "CFSTabBarConfig.h"
#import <UIKit/UIKit.h>

static CGFloat const CYLTabBarControllerHeight = 40.f;

@interface CYLBaseNavigationController : UINavigationController
@end

@implementation CYLBaseNavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
#import "ViewController.h"
@interface CFSTabBarConfig ()<UITabBarControllerDelegate>
@property (nonatomic, readwrite, strong) CYLTabBarController *tabBarController;

@end
@implementation CFSTabBarConfig

/**
 *  初始 tabBarController
 *
 *  @return CYLTabBarController
 */
- (CYLTabBarController *)tabBarController {
    if (_tabBarController == nil) {
        /**
         * 以下两行代码目的在于手动设置让TabBarItem只显示图标，不显示文字，并让图标垂直居中。
         * 等效于在 `-tabBarItemsAttributesForController` 方法中不传 `CYLTabBarItemTitle` 字段。
         * 更推荐后一种做法。
         */
        UIEdgeInsets imageInsets = UIEdgeInsetsZero;//UIEdgeInsetsMake(4.5, 0, -4.5, 0);
        UIOffset titlePositionAdjustment = UIOffsetZero;//UIOffsetMake(0, MAXFLOAT);
        
        CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers
                                                                                   tabBarItemsAttributes:self.tabBarItemsAttributesForController
                                                                                             imageInsets:imageInsets
                                                                                 titlePositionAdjustment:titlePositionAdjustment
                                                                                                 context:self.context
                                                 ];
        [self customizeTabBarAppearance:tabBarController];
        _tabBarController = tabBarController;
    }
    return _tabBarController;
}

- (NSArray *)viewControllers {
    ViewController *numV1 = [[ViewController alloc] init];
    UIViewController *numV1Nav = [[CYLBaseNavigationController alloc]
                                                      initWithRootViewController:numV1];
    
    ViewController *numV2 = [[ViewController alloc] init];
    UIViewController *numV2Nav = [[CYLBaseNavigationController alloc]
                                                    initWithRootViewController:numV2];
    
    ViewController *numV3 = [[ViewController alloc] init];
    UIViewController *numV3Nav = [[CYLBaseNavigationController alloc]
                                                  initWithRootViewController:numV3];
    
    
    NSArray *viewControllers = @[
                                 numV1Nav,
                                 numV2Nav,
                                 numV3Nav
                                 ];
    return viewControllers;
}

- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *homeTabBarItemsAttributes = @{
                                                CYLTabBarItemTitle : @"学习",
                                                CYLTabBarItemImage : @"ic_task_normal",
                                                CYLTabBarItemSelectedImage : @"ic_tabbar_task_pre"
                                                };
    NSDictionary *foodBoxTabBarItemsAttributes = @{
                                                   CYLTabBarItemTitle : @"学习",
                                                   CYLTabBarItemImage : @"ic_tabbar_mytask_normal",
                                                   CYLTabBarItemSelectedImage : @"ic_tabbar_mytask_pre"
                                                   };
    NSDictionary *mineTabBarItemsAttributes = @{
                                                CYLTabBarItemTitle : @"学习",
                                                CYLTabBarItemImage : @"ic_tabbar_profile_normal",
                                                CYLTabBarItemSelectedImage : @"ic_tabbar_profile_pre"
                                                };
    NSArray *tabBarItemsAttributes = @[
                                       homeTabBarItemsAttributes,
                                       foodBoxTabBarItemsAttributes,
                                       mineTabBarItemsAttributes
                                       ];
    return tabBarItemsAttributes;
}

/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性等等
 */
- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    // Customize UITabBar height
    // 自定义 TabBar 高度
    //tabBarController.tabBarHeight = CYLTabBarControllerHeight;
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = CFSGBACOLOR(210, 211, 219, 1);
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = CFSGBACOLOR(232, 77, 97, 1);
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
    //[self customizeTabBarSelectionIndicatorImage];
    
    // update TabBar when TabBarItem width did update
    // If your app need support UIDeviceOrientationLandscapeLeft or UIDeviceOrientationLandscapeRight，
    // remove the comment '//'
    // 如果你的App需要支持横竖屏，请使用该方法移除注释 '//'
    // [self updateTabBarCustomizationWhenTabBarItemWidthDidUpdate];
    
    // set the bar shadow image
    // This shadow image attribute is ignored if the tab bar does not also have a custom background image.So at least set somthing.
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"tapbar_top_line"]];
    
    // 设置背景图片
    /*UITabBar *tabBarAppearance = [UITabBar appearance];
     
     //FIXED: #196
     UIImage *tabBarBackgroundImage = [UIImage imageNamed:@"tab_bar"];
     UIImage *scanedTabBarBackgroundImage = [[self class] scaleImage:tabBarBackgroundImage toScale:1.0];
     [tabBarAppearance setBackgroundImage:scanedTabBarBackgroundImage];*/
    
    // 去除 TabBar 自带的顶部阴影
    // iOS10 后 需要使用 `-[CYLTabBarController hideTabBadgeBackgroundSeparator]` 见 AppDelegate 类中的演示;
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}

- (void)customizeTabBarSelectionIndicatorImage {
    ///Get initialized TabBar Height if exists, otherwise get Default TabBar Height.
    CGFloat tabBarHeight = CYLTabBarControllerHeight;
    CGSize selectionIndicatorImageSize = CGSizeMake(CYLTabBarItemWidth, tabBarHeight);
    //Get initialized TabBar if exists.
    UITabBar *tabBar = [self cyl_tabBarController].tabBar ?: [UITabBar appearance];
    [tabBar setSelectionIndicatorImage:
     [[self class] imageWithColor:[UIColor yellowColor]
                             size:selectionIndicatorImageSize]];
}

+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize {
    UIGraphicsBeginImageContext(CGSizeMake([UIScreen mainScreen].bounds.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width + 1, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end
