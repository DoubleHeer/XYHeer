//
//  DuoWabTabBarController.m
//  BaseProject
//
//  Created by tarena on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWabTabBarController.h"
#import "HeroViewController.h"
#import "BaiKeViewController.h"
#import "SearchViewController.h"

@interface DuoWabTabBarController()

@end
@implementation DuoWabTabBarController
//单例
+(DuoWabTabBarController *)standardInstance{
    static DuoWabTabBarController *dwVC = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dwVC = [DuoWabTabBarController new];
    });
    return dwVC;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    //取消工具栏的透明状态
    self.tabBar.translucent = NO;
//    self.tabBar.hidden = YES;
    
    //初始化三个子视图，放到tabBar中
    HeroViewController *hVC = [HeroViewController new];
    BaiKeViewController *bVC = [BaiKeViewController new];
    SearchViewController *sVC = [SearchViewController new];
    UINavigationController *hNavi = [[UINavigationController alloc]initWithRootViewController:hVC];
    UINavigationController *bNavi = [[UINavigationController alloc]initWithRootViewController:bVC];
    UINavigationController *sNavi = [[UINavigationController alloc]initWithRootViewController:sVC];
    self.viewControllers = @[hNavi,bNavi,sNavi];
    
}
@end
