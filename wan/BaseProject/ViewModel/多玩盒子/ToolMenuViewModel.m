//
//  ToolMenuViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ToolMenuViewModel.h"

@implementation ToolMenuViewModel
/** 不是分页，只实现getData方法即可 */
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [DuoWanNetManager getGameSubjectListWithCompleteHandle:^(NSMutableArray *arr, NSError *error) {
        [self.dataArr addObjectsFromArray:arr];
        completionHandle(error);
    }];
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

-(GameSubjectListModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
/** 某行的图标URL */
-(NSURL *)iconForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].icon];
}
/** 某行的题目 */
-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].name;
}
/** 某行的数据类型 */
-(NSString *)typeForRow:(NSInteger)row{
    return [self modelForRow:row].type;
}
/** 某行的tag值 */
-(NSString *)tagForRow:(NSInteger)row{
    return [self modelForRow:row].tag;
}

@end
