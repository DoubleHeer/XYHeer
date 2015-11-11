//
//  BestGroupViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupViewModel.h"

@implementation BestGroupViewModel

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [DuoWanNetManager getBestRanksWithCompleteHandle:^(NSMutableArray *arr, NSError *error) {
        [self.dataArr removeAllObjects];
        [self.dataArr addObjectsFromArray:arr];
        completionHandle(error);
    }];
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

-(BestRanksModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(NSString *)desForRow:(NSInteger)row{
    return [self modelForRow:row].des;
}
-(NSString *)des1ForRow:(NSInteger)row{
    return [self modelForRow:row].des1;
}
-(NSString *)des2ForRow:(NSInteger)row{
    return [self modelForRow:row].des2;
}
-(NSString *)des3ForRow:(NSInteger)row{
    return [self modelForRow:row].des3;
}
-(NSString *)des4ForRow:(NSInteger)row{
    return [self modelForRow:row].des4;
}
-(NSString *)des5ForRow:(NSInteger)row{
    return [self modelForRow:row].des5;
}

-(NSURL *)iconHero1ForRow:(NSInteger)row{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",[self modelForRow:row].hero1]];
}
-(NSURL *)iconHero2ForRow:(NSInteger)row{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",[self modelForRow:row].hero2]];
}
-(NSURL *)iconHero3ForRow:(NSInteger)row{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",[self modelForRow:row].hero3]];
}
-(NSURL *)iconHero4ForRow:(NSInteger)row{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",[self modelForRow:row].hero4]];
}
-(NSURL *)iconHero5ForRow:(NSInteger)row{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",[self modelForRow:row].hero5]];
}

-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}

@end
