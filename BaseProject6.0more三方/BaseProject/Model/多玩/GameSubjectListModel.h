//
//  GameSubjectListModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
//游戏百科列表
@class GameSubjectListSubjectModel;

@interface GameSubjectListModel : BaseModel

@property (nonatomic, strong) NSArray<GameSubjectListSubjectModel *> *subjects;

@end

@interface GameSubjectListSubjectModel : NSObject

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *tag;

@end

