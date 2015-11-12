//
//  SumAbilityViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SumAbilityViewModel.h"

@implementation SumAbilityViewModel

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [DuoWanNetManager getSumAbilityWithCompleteHandle:^(NSMutableArray *arr, NSError *error) {
        [self.dataArr removeAllObjects];
        [self.dataArr addObjectsFromArray:arr];
        completionHandle(error);
    }];
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

-(SumAbilityModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/spells/png/%@.png",[self modelForRow:row].ID]];
}
-(NSString *)desForRow:(NSInteger)row{
    return [self modelForRow:row].des;
}
-(NSString *)nameForRow:(NSInteger)row{
    return [self modelForRow:row].name;
}
-(NSString *)levelForRow:(NSInteger)row{
    return [self modelForRow:row].level;
}
-(NSString *)cooldownForRow:(NSInteger)row{
    return [self modelForRow:row].cooldown;
}
-(NSString *)tipsForRow:(NSInteger)row{
    return [self modelForRow:row].tips;
}
-(NSString *)strongForRow:(NSInteger)row{
    return [self modelForRow:row].strong;
}
@end
