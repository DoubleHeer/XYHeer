//
//  TuWanPicViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanPicViewModel.h"

@implementation TuWanPicViewModel

-(id)initWithAid:(NSString *)aid{
    if (self = [super init]) {
        _aid = aid;
    }
    return self;    
}

/**防御性编程*/
-(id)init{
    if (self = [super init]) {
        NSAssert1(NO, @"%s,必须使用initWithAid初始化", __func__);
    }
    return self;
}

-(NSInteger)rowNumber{
    return self.picModel.content.count;
}

-(NSURL *)picURLForRow:(NSInteger)row{
    TuWanPicContentModel *model = self.picModel.content[row];
    return [NSURL URLWithString:model.pic];
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [TUWanNetManager getPicDetailWithId:_aid completionHandle:^(TuWanPicModel *model, NSError *error) {
        NSMutableArray *arr = [NSMutableArray new];
        for (TuWanPicContentModel *contentModel in model.content) {
            NSURL *url = [NSURL URLWithString:contentModel.pic];
            [arr addObject:url];
        }
        self.picModel = model;
        
        completionHandle(error);
    
    }];
}
@end
