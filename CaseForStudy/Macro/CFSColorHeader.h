//
//  CFSColorHeader.h
//  CaseForStudy
//
//  Created by lks on 2018/12/11.
//  Copyright © 2018年 Apple. All rights reserved.
//

#ifndef CFSColorHeader_h
#define CFSColorHeader_h
#define CFSGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

#define CFSGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define CFSHEXCOLOR(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0f]

// 控制器view背景色
#define CFSBackGroundColor KRGBCOLOR(247, 246, 249)

#endif /* CFSColorHeader_h */
