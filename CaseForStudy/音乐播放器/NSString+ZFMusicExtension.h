//
//  NSString+ZFMusicExtension.h
//  MyMusicPlayer
//
//  Created by 王刚 on 2017/7/5.
//  Copyright © 2017年 王刚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZFMusicExtension)

/**
 把时间戳转化为固定格式的时间

 @param time 总时长(时间戳)
 @return 固定格式的时间
 */
+(NSString *)stringFromNSTimeInteval:(NSTimeInterval)time;

@end
