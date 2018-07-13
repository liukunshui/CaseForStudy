//
//  SensibilityTool.h
//  CaseForStudy
//
//  Created by Apple on 2018/7/13.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SensibilityTool : NSObject
/*
 通过单例的方式创建对象
 */
+ (instancetype)sharedInstance;

/*
 * 加载本地的敏感词库
 *
 * @params filepath 敏感词文件的路径
 *
 */
- (void)initFilter:(NSString *)filepath;

/*
 * 将文本中含有的敏感词进行替换
 *
 * @params str 文本字符串
 *
 * @return 过滤完敏感词之后的文本
 *
 */
- (NSString *)filter:(NSString *)str;

/*
 * 判断文本中是否含有敏感词
 *
 * @params str 文本字符串
 *
 * @return 是否含有敏感词
 *
 */
- (BOOL)hasSensitiveWord:(NSString *)str;

@end
