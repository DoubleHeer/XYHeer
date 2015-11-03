//
//  DuoWanNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "DuoWanModel.h"

@interface DuoWanNetManager : BaseNetManager
//免费英雄
//全部英雄
+(id)getFreeHeroListWithCompleteHandle:(void(^)(FreeHerosModel *model,NSError *error))completeHandle;
+(id)getAllHeroListWithCompleteHandle:(void(^)(AllHerosModel *model,NSError *error))completeHandle;
//英雄视频
+(id)getHeroVideoWithTag:(NSString *)tag completeHandle:(void(^)(HeroVideoModel *model,NSError *error))completeHandle;

//英雄出装
+(id)getHeroEquipWithChampionName:(NSString *)championName completeHandle:(void(^)(HeroEquipModel *model,NSError *error))completeHandle;
//英雄皮肤
+(id)getHeroSkinsWithHero:(NSString *)hero completeHandle:(void(^)(HeroSkinsModel *model,NSError *error))completeHandle;
//英雄资料
+(id)getHeroMaterialWithHeroName:(NSString *)heroName completeHandle:(void(^)(HeroMaterialModel *model,NSError *error))completeHandle;

//天赋符文
+(id)getHeroGiftWithHero:(NSString *)hero completeHandle:(void(^)(HeroGiftModel *model,NSError *error))completeHandle;
//英雄改动
+(id)getHeroChangeedWithName:(NSString *)name completeHandle:(void(^)(HeroChangedModel *model,NSError *error))completeHandle;
//一周数据
+(id)getWeekDataWithHeroId:(NSString *)heroId completeHandle:(void(^)(WeekDataModel *model,NSError *error))completeHandle;

//==========游戏百科==========
//游戏百科列表
+(id)getGameSubjectListWithCompleteHandle:(void(^)(GameSubjectListModel *model,NSError *error))completeHandle;
//装备分类
+(id)getEquiqCategoryWithCompleteHandle:(void(^)(EquiqCategoryModel *model,NSError *error))completeHandle;
//某分类装备列表
+(id)getEquiqListWithTag:(NSString *)tag completeHandle:(void(^)(EquiqListModel *model,NSError *error))completeHandle;
//装备详情
+(id)getEquiqDetailWithId:(NSInteger)Id completeHandle:(void(^)(EquiqDetailModel *model,NSError *error))completeHandle;

//天赋
+(id)getGiftWithCompleteHandle:(void(^)(GiftModel *model,NSError *error))completeHandle;
//符文列表
+(id)getRunesWithCompleteHandle:(void(^)(RunesModel *model,NSError *error))completeHandle;
//召唤师技能列表
+(id)getSumAbilityWithCompleteHandle:(void(^)(SumAbilityModel *model,NSError *error))completeHandle;
//最强阵容
+(id)getBestRanksWithCompleteHandle:(void(^)(BestRanksModel *model,NSError *error))completeHandle;
@end
