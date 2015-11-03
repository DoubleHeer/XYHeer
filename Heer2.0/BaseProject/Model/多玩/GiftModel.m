//
//  GiftModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "GiftModel.h"

@implementation GiftModel

+(NSDictionary *)objectClassInArray{
    return @{@"a":[GiftDetailModel class],@"d":[GiftDetailModel class],@"g":[GiftDetailModel class]};
}
@end


@implementation GiftDetailModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end
