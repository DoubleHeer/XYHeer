//
//  EquiqListViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "EquiqListViewModel.h"

@implementation EquiqListViewModel
-(instancetype)initWithTag:(NSString *)tag{
    if (self = [super init]) {
        _tag = tag;
    }
    return self;
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [DuoWanNetManager getEquiqListWithTag:_tag completeHandle:^(NSMutableArray *arr, NSError *error) {
        [self.dataArr removeAllObjects];
        [self.dataArr addObjectsFromArray:arr];
        completionHandle(error);
    }];
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

-(EquiqListModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
-(NSInteger)equiqIDForRow:(NSInteger)row{
    return [self modelForRow:row].ID;
}
-(NSString *)textForRow:(NSInteger)row{
    return [self modelForRow:row].text;
}

- (NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%ld_64x64.png", [self modelForRow:row].ID]];
}
@end
