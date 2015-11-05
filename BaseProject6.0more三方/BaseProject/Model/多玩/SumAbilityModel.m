//
//  SumAbilityModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SumAbilityModel.h"

@implementation SumAbilityModel


+ (NSDictionary *)objectClassInArray{
    return @{@"ability" : [SumAbilityDetailModel class]};
}

@end

@implementation SumAbilityDetailModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end


