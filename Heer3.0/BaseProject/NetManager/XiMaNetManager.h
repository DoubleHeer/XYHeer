//
//  XiMaNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "MusicModel.h"
#import "MusicCategoryModel.h"

@interface XiMaNetManager : BaseNetManager


+(id)getMusicWithPageId:(NSInteger)pageId completeHandle:(void(^)(MusicModel *model,NSError *error))completeHandle;


+(id)getMusicCategoryPage:(NSInteger)page completeHandle:(void(^)(MusicCategoryModel *model,NSError *error))completeHandle;

@end
