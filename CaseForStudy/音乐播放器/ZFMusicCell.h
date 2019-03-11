//
//  ZFMusicCell.h
//  MyMusicPlayer
//
//  Created by 王刚 on 2017/7/6.
//  Copyright © 2017年 王刚. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZFLabel;

@interface ZFMusicCell : UITableViewCell

/**显示歌词的Label*/
@property(nonatomic,strong) ZFLabel *lrcLabel;

@end
