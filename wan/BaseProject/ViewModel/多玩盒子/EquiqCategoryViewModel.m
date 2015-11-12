//
//  EquiqCategoryViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "EquiqCategoryViewModel.h"

@implementation EquiqCategoryViewModel

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [DuoWanNetManager getEquiqCategoryWithCompleteHandle:^(NSMutableArray *arr, NSError *error) {
        [self.dataArr removeAllObjects];
        [self.dataArr addObjectsFromArray:arr];
        completionHandle(error);
    }];
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

-(EquiqCategoryModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(NSString *)tagForRow:(NSInteger)row{
    return [self modelForRow:row].tag;
}
-(NSString *)textForRow:(NSInteger)row{
    return [self modelForRow:row].text;
}
@end
