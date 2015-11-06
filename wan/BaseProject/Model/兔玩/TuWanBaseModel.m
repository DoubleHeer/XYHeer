//
//  TuWanBaseModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanBaseModel.h"

@implementation TuWanBaseModel

@end

//第一层
@implementation TuWanDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"list":[TuWanDataIndexPicModel class],@"indexpic":[TuWanDataIndexPicModel class]};
}
@end
//第二层
@implementation TuWanDataIndexPicModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"typeName":@"typename",@"desc":@"description"};
}

+ (NSDictionary *)objectClassInArray{
    return @{@"showitem":[TuWanDataIndexPicShowitemModel class]};
}

@end

//第三层
@implementation TuWanDataIndexPicShowitemModel



@end

@implementation TuWanDataIndexPicInfochildModel

@end

//第四层
@implementation TuWanDataIndexPicShowitemInfoModel


@end