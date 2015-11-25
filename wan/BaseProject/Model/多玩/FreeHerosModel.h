//
//  FreeHerosModel.h
//  BaseProject
//
//  Created by heer on 15/11/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
#import "HeroListModel.h"

@interface FreeHerosModel : BaseModel

@property (nonatomic, strong) NSArray<HeroListModel *> *free;

@property (nonatomic, copy) NSString *desc;

@end


