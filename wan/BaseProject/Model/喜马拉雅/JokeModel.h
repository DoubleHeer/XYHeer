//
//  JokeModel.h
//  BaseProject
//
//  Created by heer on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class JokeResultModel,JokeResultDataModel;

@interface JokeModel : BaseModel

@property (nonatomic, assign) NSInteger error_code;

@property (nonatomic, strong) JokeResultModel *result;

@property (nonatomic, copy) NSString *reason;

@end

@interface JokeResultModel : NSObject

@property (nonatomic, strong) NSArray<JokeResultDataModel *> *data;

@end

@interface JokeResultDataModel : NSObject

@property (nonatomic, assign) NSInteger unixtime;

@property (nonatomic, copy) NSString *updatetime;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *hashId;

@end

