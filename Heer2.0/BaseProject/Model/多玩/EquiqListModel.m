//
//  EquiqListModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "EquiqListModel.h"

@implementation EquiqListModel


+ (NSDictionary *)objectClassInArray{
    return @{@"lists" : [EquiaListDetailModel class]};
}

@end

@implementation EquiaListDetailModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end


