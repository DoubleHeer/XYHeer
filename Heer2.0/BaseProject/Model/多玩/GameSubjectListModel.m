//
//  GameSubjectListModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "GameSubjectListModel.h"

@implementation GameSubjectListModel


+ (NSDictionary *)objectClassInArray{
    return @{@"subjects" : [GameSubjectListSubjectModel class]};
}
@end

@implementation GameSubjectListSubjectModel

@end


