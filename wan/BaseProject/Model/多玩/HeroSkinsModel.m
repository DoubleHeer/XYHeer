//
//  HeroSkinsModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroSkinsModel.h"

@implementation HeroSkinsModel

+ (NSDictionary *)objectClassInArray{
    return @{@"skins" : [HeroSkinDetailModel class]};
}

@end

@implementation HeroSkinDetailModel

@end


