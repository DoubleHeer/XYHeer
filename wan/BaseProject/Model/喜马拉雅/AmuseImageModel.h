//
//  AmuseImageModel.h
//  BaseProject
//
//  Created by heer on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class AmuseResultModel,AmuseResultDataModel;
@interface AmuseImageModel : BaseModel

@property (nonatomic, assign) NSInteger error_code;

@property (nonatomic, strong) AmuseResultModel *result;

@property (nonatomic, copy) NSString *reason;

@end

@interface AmuseResultModel : NSObject

@property (nonatomic, strong) NSArray<AmuseResultDataModel *> *data;

@end

@interface AmuseResultDataModel : NSObject

@property (nonatomic, assign) NSInteger unixtime;

@property (nonatomic, copy) NSString *updatetime;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *hashId;

@end

