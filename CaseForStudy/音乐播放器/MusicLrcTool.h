//
//  MusicLrcTool.h
//  MyMusicPlayer
//
//  Created by 王刚 on 2017/7/6.
//  Copyright © 2017年 王刚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicLrcTool : NSObject
//解析歌词
/**
 解析歌词,并返回一个解析好的歌词数组
 
 @param lrcName 全部歌词
 @return 解析好的歌词数组
 */
+(NSMutableArray *)lrcWithName:(NSString *)lrcName;

@end
