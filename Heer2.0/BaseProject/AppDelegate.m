//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "TUWanNetManager.h"
#import "TuWanBaseModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];

    //测试代码
   // NSString *path = @"http://cache.tuwan.com/app/?appid=1&class=heronews&mod=八卦&appid=1&appver=2.1&start=11";
//    [BaseNetManager GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
//        TuWanBaseModel *model = [TuWanBaseModel objectWithKeyValues:responseObj];
//        DDLogVerbose(@"......");
//    }];
//    
    [TUWanNetManager getTuWanListType:TuWanListTypeCOS start:1 completionHandle:^(TuWanBaseModel *model, NSError *error) {
      DDLogVerbose(@"......");
        
    }];
    return YES;
}

@end
