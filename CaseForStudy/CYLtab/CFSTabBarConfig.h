//
//  CFSTabBarConfig.h
//  CaseForStudy
//
//  Created by lks on 2018/12/11.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CFSTabBarConfig : NSObject
@property (nonatomic, readonly, strong) CYLTabBarController *tabBarController;
@property (nonatomic, copy) NSString *context;
@end

NS_ASSUME_NONNULL_END
