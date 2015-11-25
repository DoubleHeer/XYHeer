//
//  AmuseViewModel.m
//  BaseProject
//
//  Created by heer on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AmuseViewModel.h"

@implementation AmuseViewModel
-(NSInteger)page{
    if (!_page) {
        _page = 1;
    }
    return _page;
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [JokeNetManager getAmuseImageWithPage:_page CompleteHandle:^(AmuseImageModel *model, NSError *error) {
        if (_page == 1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.result.data];
        completionHandle(error);
    }];
}

-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _page = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _page ++;
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

-(AmuseResultDataModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(NSString *)contentForRow:(NSInteger)row{
    return [self modelForRow:row].content;
}
-(NSString *)updateTimeForRow:(NSInteger)row{
    return [self modelForRow:row].updatetime;
}

-(NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].url];
}

@end
