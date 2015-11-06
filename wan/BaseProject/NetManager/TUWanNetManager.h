//
//  TUWanNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "TuWanBaseModel.h"

//只要公用一个解析类就可以合起来写，只需要使用枚举量
typedef NS_ENUM(NSInteger,TuWanListType){
    TuWanListTypeTouTiao,//头条
    TuWanListTypeDuJia,//独家
    TuWanListTypeAnHei3,//暗黑3
    
    TuWanListTypeMoShou,//魔兽
    TuWanListTypeFengBao,//风暴
    TuWanListTypeLuShi,//炉石
    
    TuWanListTypeXingJi,//星际
    TuWanListTypeShouWang,//守望
    TuWanListTypeTuPian,//图片
    
    TuWanListTypeShiPin,//视频
    TuWanListTypeGonglue,//攻略
    TuWanListTypeHuanHua,//幻化
    
    TuWanListTypeQuWen,//趣闻
    TuWanListTypeCOS,//COS
    TuWanListTypeMeiNv//美女
    
};
@interface TUWanNetManager : BaseNetManager

//通过type来区分 请求的地址
+(id)getTuWanListType:(TuWanListType)type
                start:(NSInteger)start
    completionHandle:(void(^)(TuWanBaseModel *model,NSError *error))completionHandle;
@end
