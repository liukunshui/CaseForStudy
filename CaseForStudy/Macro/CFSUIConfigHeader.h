//
//  CFSUIConfigHeader.h
//  CaseForStudy
//
//  Created by lks on 2018/12/11.
//  Copyright © 2018年 Apple. All rights reserved.
//

#ifndef CFSUIConfigHeader_h
#define CFSUIConfigHeader_h
#define XShowAlert(aTitle,amessage,cancel,otherButton)    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:aTitle message:amessage delegate:self cancelButtonTitle:cancel otherButtonTitles:otherButton];[alert show];

//Block retains
#define XWEAKIFY __weak typeof(self)weakSelf = self

#define NULLABLE(value) (value != nil ? value : [NSNull null])
#define TEXT_EFFECTIVE(value) ((value == nil || [value isEqualToString:@""] || [value isEqualToString:@"(null)"] || [value isEqualToString:@"<null>"] || [value isEqualToString:@"null"])?NO:YES)

#define XAPPDELEGATE      ((AppDelegate*)[[UIApplication sharedApplication] delegate])
#define XWINDOW      [[UIApplication sharedApplication].windows objectAtIndex:0]

#define ALERTCONTROLLER_TITLE_Color @"_titleTextColor"

#define XFRFONT(f)        ([UIFont fontWithName:@"PingFangSC-Regular" size:FITFONTSIZE(f)] ? : [UIFont systemFontOfSize:FITFONTSIZE(f)])

#define XFRIMG(name)      [UIImage imageNamed:name]
#define XIOS11 @available(iOS 11.0, *)

#define  adjustsScrollViewInsets(scrollView)\
do {\
_Pragma("clang diagnostic push")\
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")\
if ([scrollView respondsToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
NSMethodSignature *signature = [UIScrollView instanceMethodSignatureForSelector:@selector(setContentInsetAdjustmentBehavior:)];\
NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];\
NSInteger argument = 2;\
invocation.target = scrollView;\
invocation.selector = @selector(setContentInsetAdjustmentBehavior:);\
[invocation setArgument:&argument atIndex:2];\
[invocation retainArguments];\
[invocation invoke];\
}\
_Pragma("clang diagnostic pop")\
} while (0)



/**
 *  the saving objects      存储对象
 *
 *  @param __VALUE__ V
 *  @param __KEY__   K
 *
 *  @return
 */
#define X_UserDefaultSetObjectForKey(__VALUE__,__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] setObject:__VALUE__ forKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}

/**
 *  get the saved objects       获得存储的对象
 */
#define X_UserDefaultObjectForKey(__KEY__)  [[NSUserDefaults standardUserDefaults] objectForKey:__KEY__]

/**
 *  delete objects      删除对象
 */
#define X_UserDefaultRemoveObjectForKey(__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] removeObjectForKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}


#endif /* CFSUIConfigHeader_h */
