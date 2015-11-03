//
//  WeekDataModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
//一周数据
@class WeekDataDataModel,WeekDataDataChartsModel,WeekDataDataChartsRatioDataModel;

@interface WeekDataModel : BaseModel

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) WeekDataDataModel *data;

@property (nonatomic, assign) NSInteger code;


@end


@interface WeekDataDataModel : NSObject

@property (nonatomic, strong) NSArray<WeekDataDataChartsModel *> *charts;

@property (nonatomic, assign) NSInteger average_win_ratio;

@property (nonatomic, assign) NSInteger average_k_num;

@property (nonatomic, assign) NSInteger champion_id;

@property (nonatomic, assign) NSInteger average_d_num;

@property (nonatomic, assign) NSInteger average_a_num;

@property (nonatomic, assign) NSInteger rank;

@end

@interface WeekDataDataChartsModel : NSObject

@property (nonatomic, copy) NSString *color;

@property (nonatomic, strong) NSArray<WeekDataDataChartsRatioDataModel *> *ratio_data;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *y_axis_title;

@end

@interface WeekDataDataChartsRatioDataModel : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger value;

@end

