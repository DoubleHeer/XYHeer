//
//  TuWanViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanViewController.h"
#import "TuWanViewModel.h"

@implementation TuWanViewController


//内容页的首页应该是单例的，每次进程都只初始化一次
+(UINavigationController *)standardTuWanNavi{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        TuWanViewController *vc = [TuWanViewController new];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
   
    return navi;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = kNavTitleColor;
    self.title = @"一号兔玩";
    
    //添加按钮
    [Factory addMenuItemToVC:self];
    

}
@end
