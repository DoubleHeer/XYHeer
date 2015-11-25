//
//  HeroViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroViewModel.h"

@implementation HeroViewModel

-(instancetype)initWithType:(NSString *)type{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    if ([_type isEqualToString:@"free"]) {
        self.dataTask = [DuoWanNetManager getFreeHeroListWithType:_type CompleteHandle:^(FreeHerosModel *model, NSError *error) {
            [self.dataArr removeAllObjects];
            [self.dataArr addObjectsFromArray:model.free];
            completionHandle(error);
        }];
    }else{
       self.dataTask = [DuoWanNetManager getAllHeroListWithType:_type CompleteHandle:^(AllHerosModel *model, NSError *error) {
           [self.dataArr removeAllObjects];
           [self.dataArr addObjectsFromArray:model.all];
           completionHandle(error);
       }];
    }
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

-(HeroListModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}

-(NSString *)cnNameForRow:(NSInteger)row{
    return [self modelForRow:row].cnName;
}

-(NSString *)locationForRow:(NSInteger)row{
    return [self modelForRow:row].location;
}

-(NSURL *)iconForRow:(NSInteger)row{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",[self modelForRow:row].enName]];
}
@end
