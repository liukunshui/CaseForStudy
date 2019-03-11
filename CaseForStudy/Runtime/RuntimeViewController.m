//
//  RuntimeViewController.m
//  CaseForStudy
//
//  Created by lks on 2019/1/7.
//  Copyright © 2019年 Apple. All rights reserved.
//

#import "RuntimeViewController.h"
#import <objc/runtime.h>
#import <AVFoundation/AVFoundation.h>
@interface RuntimeViewController ()
@property (nonatomic,strong)AVPlayer *player;//播放器对象
@property (nonatomic,strong)AVPlayerItem *currentPlayerItem;
@property(strong,nonatomic)UIProgressView *progress;

@end

@implementation RuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Class class = [self class];
    SEL originalSelector = @selector(viewDidLoad);
    SEL newlasy =@selector(newlast);
    Method or =class_getInstanceMethod(class, originalSelector);
    Method and = class_getInstanceMethod(class, newlasy);
    BOOL didand = class_addMethod(class, originalSelector, method_getImplementation(and), method_getTypeEncoding(and));
    if (didand) {
        class_replaceMethod(class, newlasy, method_getImplementation(or), method_getTypeEncoding(or));
    }else{
         method_exchangeImplementations(or, and);
    }
    
//    串行队列
    dispatch_queue_t queue =  dispatch_queue_create("desbhf", DISPATCH_QUEUE_SERIAL);
    
    //并发队列
    dispatch_queue_t queue1 = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_queue_t queue3 =dispatch_get_main_queue();
    
    dispatch_queue_t queue4  = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_sync(queue4, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    dispatch_sync(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_sync(queue, ^{
        // 追加任务3
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    NSLog(@"syncConcurrent---end");
    
    
    dispatch_async(queue4, ^{
        
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
    });
    
    __weak __typeof__(self) weakSelf =self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [weakSelf newlast];
    });
}
-(void)newlast{
    
}
@end
