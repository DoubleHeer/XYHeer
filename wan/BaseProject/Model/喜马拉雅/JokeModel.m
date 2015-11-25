//
//  JokeModel.m
//  BaseProject
//
//  Created by heer on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "JokeModel.h"

@implementation JokeModel

@end

@implementation JokeResultModel

+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [JokeResultDataModel class]};
}

@end


@implementation JokeResultDataModel

@end


