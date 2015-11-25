//
//  JokeNetManager.h
//  BaseProject
//
//  Created by heer on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "JokeModel.h"
#import "AmuseImageModel.h"

@interface JokeNetManager : BaseNetManager
//最新笑话： http: //japi.juhe.cn/joke/content/text.from?key=b316ca717a37707e9451dd07d58ba7ee&page=1&pagesize=10
+(id)getJokeWithPage:(NSInteger)page Completehandle:(void(^)(JokeModel *model,NSError *error))completehandle;

//最新趣图： http: //japi.juhe.cn/joke/img/text.from?key=b316ca717a37707e9451dd07d58ba7ee&page=1&pagesize=10
+(id)getAmuseImageWithPage:(NSInteger)page CompleteHandle:(void(^)(AmuseImageModel *model,NSError *error))completehandle;
@end
