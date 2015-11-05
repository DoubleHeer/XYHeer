//
//  XiMaNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaNetManager.h"

@implementation XiMaNetManager
//音乐分类列表  http://mobile.ximalaya.com/mobile/discovery/v1/rankingList/album?device=iPhone&key=ranking:album:played:1:2&pageId=1&pageSize=20&position=0&title=排行榜
            //http://mobile.ximalaya.com/mobile/discovery/v1/rankingList/album?device=iPhone&key=ranking:album:played:1:2&pageId=2&pageSize=20&position=0&title=排行榜

//某音乐分类内容http://mobile.ximalaya.com/mobile/others/ca/album/track/3092772/true/1/20?device=iPhone

+(id)getMusicWithPageId:(NSInteger)pageId completeHandle:(void(^)(MusicModel *model,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/discovery/v1/rankingList/album?device=iPhone&key=ranking:album:played:1:2&pageId=%ld&pageSize=20&position=0&title=排行榜",pageId];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([MusicModel objectWithKeyValues:responseObj],error);
    }];
    
}


+(id)getMusicCategoryPage:(NSInteger)page completeHandle:(void(^)(MusicCategoryModel *model,NSError *error))completeHandle{
    
    NSString *path = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/others/ca/album/track/3092772/true/%ld/20?device=iPhone",page];
    //path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([MusicCategoryModel objectWithKeyValues:responseObj],error);
    }];
}
@end
