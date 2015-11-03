//
//  HeroMaterialModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroMaterialModel.h"

@implementation HeroMaterialModel


+ (NSDictionary *)objectClassInArray{
    return @{@"like" : [HeroMaterialLikeModel class], @"hate" : [HeroMaterialHateModel class]};
}
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id",@"desc":@"description"};
}
@end


@implementation HeroMaterialBraumModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id",@"desc":@"description"};
}

@end


@implementation HeroMaterialLikeModel


@end


@implementation HeroMaterialHateModel

@end


