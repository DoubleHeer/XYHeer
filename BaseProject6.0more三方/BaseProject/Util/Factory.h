//
//  Factory.h
//  BaseProject
//
//  Created by tarena on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
//工厂类：用于放置自定义方法
@interface Factory : NSObject

/** 向某个控制器上，添加菜单按钮 */
+(void)addMenuItemToVC:(UIViewController *)vc;

@end
