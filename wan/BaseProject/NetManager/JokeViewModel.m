//
//  JokeViewModel.m
//  BaseProject
//
//  Created by heer on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "JokeViewModel.h"

@implementation JokeViewModel
-(NSInteger)page{
    if (!_page) {
        _page = 1;
    }
    return _page;
}
//获取数据
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [JokeNetManager getJokeWithPage:_page Completehandle:^(JokeModel *model, NSError *error) {
        if (_page == 1) {
            [self.dataArr removeAllObjects];
            [self.dataArr addObjectsFromArray:model.result.data];
        }else{
            [self.dataArr addObjectsFromArray:model.result.data];
        }
        completionHandle(error);
    }];
}

//刷新
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _page = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

//加载更多
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _page ++;
    [self getDataFromNetCompleteHandle:completionHandle];
    
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

-(JokeResultDataModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(NSString *)updatetimeForRow:(NSInteger)row{
    return [self modelForRow:row].updatetime;
}

-(NSString *)contentForRow:(NSInteger)row{
    return [self modelForRow:row].content;
}

@end
