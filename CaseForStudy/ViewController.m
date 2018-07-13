//
//  ViewController.m
//  CaseForStudy
//
//  Created by Apple on 2018/7/13.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "BaseTableViewCell.h"

#define InstantiateVCFromBundleStoryboard(storyboardName, VCID, bundleObj)          [[UIStoryboard storyboardWithName:storyboardName bundle:bundleObj] instantiateViewControllerWithIdentifier:VCID]
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
    
         UIViewController *vc = InstantiateVCFromBundleStoryboard(@"Main", @"SensibiltyViewC", nil);
//        SensibiltyViewC *sen =[[SensibiltyViewC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([BaseTableViewCell class])];
    if (indexPath.row ==0) {
        cell.textLabel.text  = @"敏感词汇";
    }else{
         cell.textLabel.text = [NSString stringWithFormat:@"%i",indexPath.row];
    }
   
    
    
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
         return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
