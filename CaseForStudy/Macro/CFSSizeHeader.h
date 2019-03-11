//
//  CFSSizeHeader.h
//  CaseForStudy
//
//  Created by lks on 2018/12/11.
//  Copyright © 2018年 Apple. All rights reserved.
//

#ifndef CFSSizeHeader_h
#define CFSSizeHeader_h

// 判断是否是iPhoneX+
#define XFR_IPHONEX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define XFR_IPHONEXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
#define XFR_IPHONEXS_MAX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)
// tabBar高度
#define XTAB_BAR_HEIGHT          ((XFR_IPHONEX || XFR_IPHONEXR || XFR_IPHONEXS_MAX) ? (49.f+34.f) : 49.f)
// 状态栏高度
#define XSTATUS_BAR_HEIGHT       ((XFR_IPHONEX || XFR_IPHONEXR || XFR_IPHONEXS_MAX) ? 44.f : 20.f)
// 导航栏高度
#define XNAVIGATION_BAR_HEIGHT   ((XFR_IPHONEX || XFR_IPHONEXR || XFR_IPHONEXS_MAX) ? 88.f : 64.f)
// home indicator
#define HOME_INDICATOR_HEIGHT ((XFR_IPHONEX || XFR_IPHONEXR || XFR_IPHONEXS_MAX) ? 34.f : 0.f)

#define XSCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define XSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


#define ratioW                    kScreenWidth/375  /**<屏幕的宽比  基准375*/
#define ratioH             kScreenHeight/667  /**<屏幕的高比  基准667*/
#endif /* CFSSizeHeader_h */
