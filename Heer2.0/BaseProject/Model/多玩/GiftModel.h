//
//  GiftModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
//天赋
@class GiftDetailModel;

@interface GiftModel : BaseModel

@property (nonatomic, strong) NSArray<GiftDetailModel *> *a;

@property (nonatomic, strong) NSArray<GiftDetailModel *> *d;

@property (nonatomic, strong) NSArray<GiftDetailModel *> *g;

@end


@interface GiftDetailModel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSArray<NSString *> *level;

@end



