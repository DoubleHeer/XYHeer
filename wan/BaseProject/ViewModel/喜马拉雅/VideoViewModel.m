//
//  VideoViewModel.m
//  BaseProject
//
//  Created by tarena on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoViewModel.h"

@implementation VideoViewModel

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

-(VideoVideoListModel *)videoListModelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(NSString *)titleForRow:(NSInteger)row{
    return [self videoListModelForRow:row].title;
}

-(NSString *)descForRow:(NSInteger)row{
    return [self videoListModelForRow:row].desc;
}

-(NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self videoListModelForRow:row].cover];
}

-(NSURL *)videoURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self videoListModelForRow:row].mp4Url];
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [VideoNetManager getVideoWithIndex:_index completionHandle:^(VideoModel *model, NSError *error) {
        if (_index == 0) {
            [self.dataArr removeAllObjects];
        }
        //隐式转换：//VideoModel *m = (VideoModel *)model;
        [self.dataArr addObjectsFromArray:model.videoList];
        completionHandle(error);
    }];
}
//刷新
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _index = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
    
}
//获取更多
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _index += 10;
    [self getDataFromNetCompleteHandle:completionHandle];
}

@end

