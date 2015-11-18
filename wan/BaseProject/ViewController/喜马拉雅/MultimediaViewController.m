//
//  MultimediaViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MultimediaViewController.h"
#import "RankListViewController.h"
#import "VideoViewController.h"

@interface MultimediaViewController ()

@end

@implementation MultimediaViewController

//单例
+(MultimediaViewController *)standardMVInstance{
    static MultimediaViewController *mdVC = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mdVC = [MultimediaViewController new];
    });
    return mdVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //取消工具栏的透明状态
    self.tabBar.translucent = NO;
    //    self.tabBar.hidden = YES;
    //初始化三个子视图，放到tabBar中
    RankListViewController *rVC = [RankListViewController new];
    VideoViewController *vVC = [VideoViewController new];
    //SearchViewController *sVC = [SearchViewController new];
    UINavigationController *rNavi = [[UINavigationController alloc]initWithRootViewController:rVC];
    UINavigationController *vNavi = [[UINavigationController alloc]initWithRootViewController:vVC];
   // UINavigationController *sNavi = [[UINavigationController alloc]initWithRootViewController:sVC];
    self.viewControllers = @[rNavi,vNavi];
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
