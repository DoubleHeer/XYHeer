//
//  HeroGiftModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
//符文天赋
@class HeroGiftDetailModel;

@interface HeroGiftModel : BaseModel

@property (nonatomic, strong) NSArray<HeroGiftDetailModel *> *gift;

@end

@interface HeroGiftDetailModel : NSObject

@property (nonatomic, copy) NSString *tianDes;

@property (nonatomic, copy) NSString *des;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *fuDes;

@property (nonatomic, copy) NSString *fuPic;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *tianPic;

@end

