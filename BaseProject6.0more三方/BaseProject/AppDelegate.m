//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "LeftViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
   
    RESideMenu *sideMenu = [[RESideMenu alloc]initWithContentViewController:[TuWanViewController new] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
    _window.rootViewController = sideMenu;
     [_window makeKeyAndVisible];
    return YES;
}

//生成放有兔玩游戏的导航控制器

@end
