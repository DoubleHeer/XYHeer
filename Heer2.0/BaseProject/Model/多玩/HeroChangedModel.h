//
//  HeroChangedModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
//英雄改动
@class HeroChangeChangelogModel;

@interface HeroChangedModel : BaseModel

@property (nonatomic, copy) NSString *gold;

@property (nonatomic, copy) NSString *coupon;

@property (nonatomic, strong) NSArray<HeroChangeChangelogModel *> *changeLog;

@property (nonatomic, copy) NSString *eName;

@property (nonatomic, copy) NSString *cName;

@property (nonatomic, copy) NSString *location;

@end


@interface HeroChangeChangelogModel : NSObject

@property (nonatomic, copy) NSString *version;

@property (nonatomic, copy) NSString *time;

@property (nonatomic, copy) NSString *info;

@end

