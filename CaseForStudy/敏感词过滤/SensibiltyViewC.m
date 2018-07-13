//
//  SensibiltyViewC.m
//  CaseForStudy
//
//  Created by Apple on 2018/7/13.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "SensibiltyViewC.h"
#import "SensibilityTool.h"
@interface SensibiltyViewC ()<UITextFieldDelegate>

@end

@implementation SensibiltyViewC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    textField.text = [[SensibilityTool sharedInstance]filter:textField.text];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
     textField.text = [[SensibilityTool sharedInstance]filter:textField.text];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
