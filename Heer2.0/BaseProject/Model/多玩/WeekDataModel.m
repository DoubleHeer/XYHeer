//
//  WeekDataModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WeekDataModel.h"

@implementation WeekDataModel


@end


@implementation WeekDataDataModel
+(NSDictionary *)objectClassInArray{
    return @{@"charts":[WeekDataDataChartsModel class]};
}
@end

@implementation WeekDataDataChartsModel

+(NSDictionary *)objectClassInArray{
    return @{@"ratio_data":[WeekDataDataChartsRatioDataModel class]};
}
@end

@implementation WeekDataDataChartsRatioDataModel

@end