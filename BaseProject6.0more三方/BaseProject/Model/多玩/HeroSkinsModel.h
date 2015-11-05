//
//  HeroSkinsModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
//英雄皮肤
@class HeroSkinDetailModel;

@interface HeroSkinsModel : BaseModel

@property (nonatomic, strong) NSArray<HeroSkinDetailModel *> *skins;

@end

@interface HeroSkinDetailModel : NSObject

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *bigImg;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *smallImg;

@end

