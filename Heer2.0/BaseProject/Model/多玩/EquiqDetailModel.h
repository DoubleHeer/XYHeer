//
//  EquiqDetailModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
//装备详情
@class EquiqDetailExtattrsModel;
@interface EquiqDetailModel : BaseModel

@property (nonatomic, strong) EquiqDetailExtattrsModel *extAttrs;

@property (nonatomic, copy) NSString *need;

@property (nonatomic, copy) NSString *ID;//

@property (nonatomic, assign) NSInteger price;

@property (nonatomic, assign) NSInteger allPrice;

@property (nonatomic, assign) NSInteger sellPrice;

@property (nonatomic, copy) NSString *compose;

@property (nonatomic, copy) NSString *extDesc;

@property (nonatomic, copy) NSString *desc;//description

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *tags;

@end

@interface EquiqDetailExtattrsModel : NSObject

@property (nonatomic, assign) NSInteger FlatMPPoolMod;

@property (nonatomic, assign) NSInteger FlatPhysicalDamageMod;

@property (nonatomic, assign) CGFloat PercentBaseMPRegenMod;

@end

