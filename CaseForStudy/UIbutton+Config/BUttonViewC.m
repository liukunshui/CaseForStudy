//
//  BUttonViewC.m
//  CaseForStudy
//
//  Created by lks on 2018/12/11.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BUttonViewC.h"
#import "UIButton+Config.h"
@interface BUttonViewC ()

@end

@implementation BUttonViewC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 0; i< 6; i++)
    {
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        button1.frame = CGRectMake(60, 80+i*60, XSCREEN_WIDTH-60*2, 45);
        button1.tag = i;
        button1.backgroundColor = [UIColor yellowColor];
        button1.titleLabel.font = [UIFont systemFontOfSize:15];
        [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button1 setImage:[UIImage imageNamed:@"img_up"] forState:UIControlStateNormal];
        [button1 setTitle:@"测试文本" forState:UIControlStateNormal];
        [button1 addTarget:self action:@selector(testAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button1];
        
        switch (i)
        {
            case 0:
            {
                //系统默认图片在左，文字在右，间隔为0
            }
                break;
                
            case 1:
            {
                //上下居中，图片在上，文字在下
                [button1 verticalCenterImageAndTitle:10.0f];
            }
                break;
                
            case 2:
            {
                //左右居中，文字在左，图片在右
                [button1 horizontalCenterTitleAndImage:50.0f];
            }
                break;
                
            case 3:
            {
                //左右居中，图片在左，文字在右
                [button1 horizontalCenterImageAndTitle:50.0f];
            }
                break;
                
            case 4:
            {
                //文字居中，图片在左边
                [button1 horizontalCenterTitleAndImageLeft:50.0f];
            }
                break;
                
            case 5:
            {
                //文字居中，图片在右边
                [button1 horizontalCenterTitleAndImageRight:50.0f];
            }
                break;
                
            default:
                break;
        }
    }
}

- (void)testAction:(UIButton *)sender
{
    NSLog(@"testAction:%ld", (long)sender.tag);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
