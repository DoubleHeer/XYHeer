//
//  TuWanViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanViewController.h"
#import "TuWanViewModel.h"
#import "TuWanListViewController.h"

@implementation TuWanViewController


//内容页的首页应该是单例的，每次进程都只初始化一次
+(UINavigationController *)standardTuWanNavi{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        TuWanViewController *vc = [[TuWanViewController alloc]initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemNames]];
        //例如设置第一个控制器的某个属性的值, KVC模式
        //vc setValue:[value[0]] forKey:[keys[0]]
        vc.keys = [self vcKeys];
        vc.values = [self vcValues];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
   
    return navi;
    
}
/**提供每个vc对应的values值数组*/
+(NSArray *)vcValues{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i=0; i< [self itemNames].count; i++) {
        //数值上每个vc的infoType的枚举值恰好和i值相同
        [arr addObject:@(i)];
    }
    return [arr copy];
}

/** 提供每个vc对应的key值数组*/
+(NSArray *)vcKeys{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i=0; i< [self itemNames].count; i++) {
        [arr addObject:@"infoType"];
    }
    return [arr copy];
}

/**提供题目数组*/
+(NSArray *)itemNames{
    return @[@"头条",@"独家",@"暗黑3",@"魔兽",@"风暴",@"炉石",@"星际",@"守望",@"图片",@"视频",@"攻略",@"幻化",@"趣闻",@"COS",@"美女"];
}
/**提供每个题目对应的控制器类型，题目和控制器数量必须一致*/
+(NSArray *)viewControllerClasses{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i=0; i< [self itemNames].count; i++) {
        
        [arr addObject:[TuWanListViewController class]];
    }
    return [arr copy];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = kNavTitleColor;
    self.title = @"游戏资讯";
    
    //添加按钮
    [Factory addMenuItemToVC:self];
    

}
@end
