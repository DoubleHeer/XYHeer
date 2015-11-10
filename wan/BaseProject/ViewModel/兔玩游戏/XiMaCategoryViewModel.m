//
//  XiMaCategoryViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaCategoryViewModel.h"

@implementation XiMaCategoryViewModel

-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _pageId = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    //如果当前页数是最大页数，则不用再发生请求，这样会浪费用户流量
    if (_maxPageId <= _pageId) {
       // [self showErrorMsg:@"没有更多数据"];
        NSError *err = [NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"没有更多数据了"}];
       
        completionHandle(err);
        return;
    }
    _pageId += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [XiMaNetManager getMusicWithPageId:_pageId completeHandle:^(MusicModel *model, NSError *error) {
        if (!error) {
            if (_pageId == 1) {
                [self.dataArr removeAllObjects];
            }
            [self.dataArr addObjectsFromArray:model.list];
            _maxPageId = model.maxPageId;
        }
        completionHandle(error);
    }];
}

-(MusicListModel *)musicListForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

-(NSInteger)albumIdForRow:(NSInteger)row{
    return [self musicListForRow:row].albumId;
}

-(NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self musicListForRow:row].albumCoverUrl290];
}

-(NSString *)titleForRow:(NSInteger)row{
    return [self musicListForRow:row].title;
}

-(NSString *)descForRow:(NSInteger)row{
    return [self musicListForRow:row].intro;
}

-(NSString *)numberForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"%ld集",[self musicListForRow:row].tracks];
}
@end
