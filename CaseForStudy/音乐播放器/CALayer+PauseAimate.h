//
//  CALayer+PauseAimate.h
//  Music
//
//  Created by 王刚 on 16/7/21.
//  Copyright © 2016年 王刚. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (PauseAimate)

/** 暂停动画*/
- (void)pauseAnimate;

/** 恢复动画*/
- (void)resumeAnimate;

@end
