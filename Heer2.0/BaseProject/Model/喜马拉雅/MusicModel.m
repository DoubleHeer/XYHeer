//
//  MusicModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MusicModel.h"

@implementation MusicModel


+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [MusicListModel class]};
}

@end

@implementation MusicListModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end


