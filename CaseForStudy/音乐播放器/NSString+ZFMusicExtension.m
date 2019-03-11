//
//  NSString+ZFMusicExtension.m
//  MyMusicPlayer
//
//  Created by 王刚 on 2017/7/5.
//  Copyright © 2017年 王刚. All rights reserved.
//

#import "NSString+ZFMusicExtension.h"

@implementation NSString (ZFMusicExtension)

+(NSString *)stringFromNSTimeInteval:(NSTimeInterval)time
{
    NSInteger minute = time / 60;
    NSInteger second = (NSInteger)time % 60;
    return [NSString stringWithFormat:@"%02ld:%02ld",minute,second];
}

@end
