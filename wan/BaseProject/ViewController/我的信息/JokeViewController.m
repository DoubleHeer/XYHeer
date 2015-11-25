//
//  JokeViewController.m
//  BaseProject
//
//  Created by heer on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "JokeViewController.h"
#import "JokeTableViewController.h"
#import "AmuseTableViewController.h"


@interface JokeViewController ()

@end

@implementation JokeViewController

+(UINavigationController *)standardInstance{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        JokeViewController *vc = [[JokeViewController alloc]initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemNames]];
        //例如设置第一个控制器的某个属性的值, KVC模式
      
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}

/**提供题目数组*/
+(NSArray *)itemNames{
    return @[@"段子",@"趣图"];
}
/**提供每个题目对应的控制器类型，题目和控制器数量必须一致*/
+(NSArray *)viewControllerClasses{
    return @[[JokeTableViewController class],[AmuseTableViewController class]];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = kNavTitleColor;
    self.title = @"趣图段子";
    
    //添加按钮
    [Factory addMenuItemToVC:self];
    
    
}


@end
