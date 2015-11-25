//
//  DuoWanNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWanNetManager.h"
//很多具有共同点的东西，可以使用宏定义；比如：
//凡是自己写的宏定义，都需要用k开头，（编码习惯）

#define kOSType [@"iOS" stringByAppendingString:[UIDevice currentDevice].systemVersion] //获取当前系统版本号//9.1是当前手机系统版本，需要到info文件中去取

//把path写到文件头部，使用宏定义形式，方便后期维护
#define kHeroPath @"http://lolbox.duowan.com/phone/apiHeroes.php"//免费、全部英雄
#define kHeroSkinPath @"http://box.dwstatic.com/apiHeroSkin.php"//英雄皮肤
#define kHeroVideoPath @"http://box.dwstatic.com/apiVideoesNormalDuowan.php"//英雄视频
#define kHeroEquipPath @"http://db.duowan.com/lolcz/img/ku11/api/lolcz.php"//英雄出装
#define kHeroMaterialPath @"http://lolbox.duowan.com/phone/apiHeroDetail.php"//英雄资料
#define kHeroGiftPath @"http://box.dwstatic.com/apiHeroSuggestedGiftAndRun.php"//符文天赋
#define kHeroChangedPath @"http://db.duowan.com/boxnews/heroinfo.php"//英雄改动
#define kWeekDataPath @"http://183.61.12.108/apiHeroWeekData.php"//一周数据
#define kGameSubjectPath @"http://box.dwstatic.com/apiToolMenu.php"//游戏百科列表
#define kEquiqCategoryPath @"http://lolbox.duowan.com/phone/apiZBCategory.php"//装备分类
#define kEquiqListPath @"http://lolbox.duowan.com/phone/apiZBItemList.php"//某装备列表
#define kEquiqDetailPath @"http://lolbox.duowan.com/phone/apiItemDetail.php"//装备详情
#define kGiftPath @"http://lolbox.duowan.com/phone/apiGift.php"//天赋
#define kRunesPath @"http://lolbox.duowan.com/phone/apiRunes.php"//符文
#define kSumAbilityPath @"http://lolbox.duowan.com/phone/apiSumAbility.php"//召唤师技能列表
#define kBestRanksPath @"http://box.dwstatic.com/apiHeroBestGroup.php"//最佳阵容
#define kHeroDubPath @"http://box.dwstatic.com/apiHeroSound.php"//英雄配音

@implementation DuoWanNetManager
//免费英雄http://lolbox.duowan.com/phone/apiHeroes.php?type=free&v=140&OSType=iOS9.1
//全部英雄http://lolbox.duowan.com/phone/apiHeroes.php?type=all&v=140&OSType=iOS9.1
+(id)getAllHeroListWithType:(NSString *)type CompleteHandle:(void(^)(AllHerosModel *model,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"%@?type=%@&v=140&OSType=%@",kHeroPath,type,kOSType];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([AllHerosModel objectWithKeyValues:responseObj],error);
    }];
}

+(id)getFreeHeroListWithType:(NSString *)type CompleteHandle:(void(^)(FreeHerosModel *model,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"%@?type=%@&v=140&OSType=%@",kHeroPath,type,kOSType];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([FreeHerosModel objectWithKeyValues:responseObj],error);
    }];
}

//英雄视频http://box.dwstatic.com/apiVideoesNormalDuowan.php?action=l&p=1&v=140&OSType=iOS9.1&tag=Braum&src=letv
+(id)getHeroVideoWithTag:(NSString *)tag completeHandle:(void(^)(NSMutableArray *arr,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"%@?action=l&p=1&v=140&OSType=i%@&tag=%@&src=letv",kHeroVideoPath,kOSType,tag];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([HeroVideoModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}
//英雄出装http://db.duowan.com/lolcz/img/ku11/api/lolcz.php?v=140&OSType=iOS9.1&championName=Braum&limit=7
//英雄皮肤http://box.dwstatic.com/apiHeroSkin.php?hero=Braum&v=140&OSType=iOS9.1&versionName=2.4.0
//英雄资料http://lolbox.duowan.com/phone/apiHeroDetail.php?OSType=iOS9.1&heroName=Braum&v=140

//英雄出装
+(id)getHeroEquipWithChampionName:(NSString *)championName completeHandle:(void(^)(NSMutableArray *arr,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"%@?v=140&OSType=%@&championName=%@&limit=7",kHeroEquipPath,kOSType,championName];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([HeroEquipModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}
//英雄皮肤
+(id)getHeroSkinsWithHero:(NSString *)hero completeHandle:(void(^)(NSMutableArray *arr,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"%@?hero=%@&v=140&OSType=%@&versionName=2.4.0",kHeroSkinPath,hero,kOSType];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([HeroSkinsModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}
//英雄资料
+(id)getHeroMaterialWithHeroName:(NSString *)heroName completeHandle:(void(^)(HeroMaterialModel *model,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"%@?OSType=%@&heroName=%@&v=140",kHeroMaterialPath,kOSType,heroName];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([HeroMaterialModel objectWithKeyValues:responseObj],error);
    }];
}

//天赋符文 http://box.dwstatic.com/apiHeroSuggestedGiftAndRun.php?hero=Braum&v=140&OSType=iOS9.1
//英雄改动 http://db.duowan.com/boxnews/heroinfo.php?name=Skarner&v=140&OSType=iOS9.1
//一周数据 http://183.61.12.108/apiHeroWeekData.php?heroId=72

//天赋符文
+(id)getHeroGiftWithHero:(NSString *)hero completeHandle:(void(^)(NSMutableArray *arr,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"%@?hero=%@&v=140&OSType=%@",kHeroGiftPath,hero,kOSType];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([HeroGiftModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}
//英雄改动
+(id)getHeroChangeedWithName:(NSString *)name completeHandle:(void(^)(HeroChangedModel *model,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"%@?name=%@&v=140&OSType=%@",kHeroChangedPath,name,kOSType];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([HeroChangedModel objectWithKeyValues:responseObj],error);
    }];
}
//一周数据
+(id)getWeekDataWithHeroId:(NSString *)heroId completeHandle:(void(^)(WeekDataModel *model,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"%@?heroId=%@",kWeekDataPath,heroId];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([WeekDataModel objectWithKeyValues:responseObj],error);
    }];
}

//==========游戏百科==========
//游戏百科列表 http://box.dwstatic.com/apiToolMenu.php?category=database&v=140&OSType=iOS9.1&versionName=2.4.0
//装备分类 http://lolbox.duowan.com/phone/apiZBCategory.php?v=140&OSType=iOS9.1&versionName=2.4.0
//某分类装备列表 http://lolbox.duowan.com/phone/apiZBItemList.php?tag=consumable&v=140&OSType=iOS9.1&versionName=2.4.0
//装备详情 http://lolbox.duowan.com/phone/apiItemDetail.php?id=3004&v=140&OSType=iOS9.1

//游戏百科列表
+(id)getGameSubjectListWithCompleteHandle:(void(^)(NSMutableArray *arr,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"%@?category=database&v=140&OSType=%@&versionName=2.4.0",kGameSubjectPath,kOSType];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([GameSubjectListModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}
//装备分类
+(id)getEquiqCategoryWithCompleteHandle:(void(^)(NSMutableArray *arr,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"%@?v=140&OSType=%@&versionName=2.4.0",kEquiqCategoryPath,kOSType];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([EquiqCategoryModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}
//某分类装备列表
+(id)getEquiqListWithTag:(NSString *)tag completeHandle:(void(^)(NSMutableArray *arr,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"%@?tag=%@&v=140&OSType=%@&versionName=2.4.0",kEquiqListPath,tag,kOSType];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([EquiqListModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}
//装备详情
+(id)getEquiqDetailWithId:(NSInteger)Id completeHandle:(void(^)(EquiqDetailModel *model,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"%@?id=%ld&v=140&OSType=%@",kEquiqDetailPath,Id,kOSType];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([EquiqDetailModel objectWithKeyValues:responseObj],error);
    }];
}

//天赋 http://lolbox.duowan.com/phone/apiGift.php?v=140&OSType=iOS9.1
//符文列表 http://lolbox.duowan.com/phone/apiRunes.php?v=140&OSType=iOS9.1
//召唤师技能列表 http://lolbox.duowan.com/phone/apiSumAbility.php?v=140&OSType=iOS9.1
//最佳阵容 http://box.dwstatic.com/apiHeroBestGroup.php?v=140&OSType=iOS9.1

//天赋
+(id)getGiftWithCompleteHandle:(void(^)(GiftModel *model,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"%@?v=140&OSType=%@",kGiftPath,kOSType];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([GiftModel objectWithKeyValues:responseObj],error);
    }];
}
//符文列表
+(id)getRunesWithCompleteHandle:(void(^)(RunesModel *model,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"%@?v=140&OSType=%@",kRunesPath,kOSType];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([RunesModel objectWithKeyValues:responseObj],error);
    }];
}
//召唤师技能列表
+(id)getSumAbilityWithCompleteHandle:(void(^)(NSMutableArray *arr,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"%@?v=140&OSType=%@",kSumAbilityPath,kOSType];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([SumAbilityModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}
//最强阵容
+(id)getBestRanksWithCompleteHandle:(void(^)(NSMutableArray *arr,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"%@?v=140&OSType=%@",kBestRanksPath,kOSType];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([BestRanksModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

//英雄配音 http://box.dwstatic.com/apiHeroSound.php?hero=Braum&v=140&OSType=iOS9.1&versionName=2.4.0

//英雄配音
+(id)getHeroDubWithHero:(NSString *)hero completeHandel:(void(^)(HeroDubModel *model,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"%@?hero=%@&v=140&OSType=%@&versionName=2.4.0",kHeroDubPath,hero,kOSType];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([HeroDubModel objectWithKeyValues:responseObj],error);
    }];
}


@end


