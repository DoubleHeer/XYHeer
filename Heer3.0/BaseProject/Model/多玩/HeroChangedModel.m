//
//  HeroChangedModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroChangedModel.h"

@implementation HeroChangedModel


+ (NSDictionary *)objectClassInArray{
    return @{@"changeLog" : [HeroChangeChangelogModel class]};
}

@end



@implementation HeroChangeChangelogModel

@end


