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

#import "CFSTabBarConfig.h"
#import "BUttonViewC.h"
#import "MusicViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UITabBarControllerDelegate>

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
    }else if (indexPath.row ==1){
       
        [self.navigationController pushViewController:self.tabBarController animated:YES];
       
    }else if (indexPath.row ==2){
        
        BUttonViewC *sen =[[BUttonViewC alloc]init];
        [self.navigationController pushViewController:sen animated:YES];
        
        
    }else if (indexPath.row ==3){
        
        MusicViewController *sen =[[MusicViewController alloc]init];
        [self.navigationController pushViewController:sen animated:YES];
        
    }else if (indexPath.row ==4){
        
       
        
    }
}
#pragma mark - //初始tabbar
- (CYLTabBarController *)tabBarController {
    if (!_tabBarController) {
        CFSTabBarConfig *tabBarControllerConfig = [[CFSTabBarConfig alloc] init];
        _tabBarController = tabBarControllerConfig.tabBarController;
        _tabBarController.delegate = self;
    }
    return _tabBarController;
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
    }else if (indexPath.row ==1) {
        cell.textLabel.text  = @"CLYTab";
    }else if (indexPath.row ==2){
         cell.textLabel.text = [NSString stringWithFormat:@"%i",indexPath.row];
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
