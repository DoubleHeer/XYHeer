//
//  BestRanksModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
//最佳阵容
@class BestRanksDetailModel;

@interface BestRanksModel : BaseModel

@property (nonatomic, strong) NSArray<BestRanksDetailModel *> *ranks;

@end

@interface BestRanksDetailModel : NSObject

@property (nonatomic, copy) NSString *hero5;

@property (nonatomic, copy) NSString *hero3;

@property (nonatomic, copy) NSString *hero1;

@property (nonatomic, copy) NSString *des2;

@property (nonatomic, copy) NSString *des;

@property (nonatomic, copy) NSString *des5;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *des1;

@property (nonatomic, copy) NSString *hero4;

@property (nonatomic, copy) NSString *hero2;

@property (nonatomic, copy) NSString *des4;

@property (nonatomic, copy) NSString *des3;

@end

