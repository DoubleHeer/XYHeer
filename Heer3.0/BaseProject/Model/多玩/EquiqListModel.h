//
//  EquiqListModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
//某分类装备列表
@class EquiaListDetailModel;

@interface EquiqListModel : BaseModel

@property (nonatomic, strong) NSArray<EquiaListDetailModel *> *lists;

@end

@interface EquiaListDetailModel : NSObject

@property (nonatomic, assign) NSInteger ID;//

@property (nonatomic, copy) NSString *text;

@end

