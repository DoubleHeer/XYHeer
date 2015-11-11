//
//  SumAbilityModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
//召唤师技能列表

@interface SumAbilityModel : BaseModel


@property (nonatomic, copy) NSString *strong;

@property (nonatomic, copy) NSString *ID;//

@property (nonatomic, copy) NSString *cooldown;

@property (nonatomic, copy) NSString *level;

@property (nonatomic, copy) NSString *tips;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *des;

@end

