//
//  AllHerosModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
#import "HeroListModel.h"

//所有英雄
@class HerosListModel;
@interface AllHerosModel : BaseModel


@property (nonatomic, strong) NSArray<HerosListModel *> *all;

@end




