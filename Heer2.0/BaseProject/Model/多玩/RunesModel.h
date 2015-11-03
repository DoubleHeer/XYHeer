//
//  RunesModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
//符文列表
@class RunesPurpleModel;
@interface RunesModel : BaseModel

@property (nonatomic, strong) NSArray<RunesPurpleModel *> *Purple;

@property (nonatomic, strong) NSArray<RunesPurpleModel *> *Blue;

@property (nonatomic, strong) NSArray<RunesPurpleModel *> *Yellow;

@property (nonatomic, strong) NSArray<RunesPurpleModel *> *Red;

@end
@interface RunesPurpleModel : NSObject

@property (nonatomic, copy) NSString *Img;

@property (nonatomic, copy) NSString *Name;

@property (nonatomic, copy) NSString *lev3;

@property (nonatomic, assign) NSInteger Recom;

@property (nonatomic, copy) NSString *lev2;

@property (nonatomic, assign) NSInteger iplev3;

@property (nonatomic, copy) NSString *Units;

@property (nonatomic, assign) NSInteger Type;

@property (nonatomic, copy) NSString *Standby;

@property (nonatomic, copy) NSString *lev1;

@property (nonatomic, assign) NSInteger iplev2;

@property (nonatomic, copy) NSString *Alias;

@property (nonatomic, copy) NSString *Prop;

@property (nonatomic, assign) NSInteger iplev1;

@end


