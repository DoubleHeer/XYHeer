//
//  EquiqCategoryModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
//装备分类
@class EquiqCategoryCategoryModel;

@interface EquiqCategoryModel : BaseModel

@property (nonatomic, strong) NSArray<EquiqCategoryCategoryModel *> *category;

@end

@interface EquiqCategoryCategoryModel : NSObject

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *text;

@end

