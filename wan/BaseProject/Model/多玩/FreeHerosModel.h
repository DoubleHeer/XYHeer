//
//  FreeHerosModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
//周免英雄
@class FreeHerosFreeModel;

@interface FreeHerosModel : BaseModel

@property (nonatomic, strong) NSArray *free;
@property (nonatomic, copy) NSString *desc;

@end

@interface FreeHerosFreeModel : NSObject

@property (nonatomic, copy) NSString *enName;
@property (nonatomic, copy) NSString *cnName;
@property (nonatomic, copy) NSString *rating;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *tags;

@end