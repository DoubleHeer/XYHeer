//
//  DuoWanNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWanNetManager.h"
//很多具有共同点的东西，可以使用宏定义；比如：
//凡是自己写的宏定义，都需要用k开头，（编码习惯）
#define kOSType @"OSType":@"iOS9.1"//9.1是当前手机系统版本，需要到info文件中去取

//把path写到文件头部，使用宏定义形式，方便后期维护
#define kHeroPath @"http://lolbox.duowan.com/phone/apiHeroes.php"//免费、全部英雄
#define kHeroSkinPath @"http://box.dwstatic.com/apiHeroSkin.php"//英雄皮肤
@implementation DuoWanNetManager

@end
