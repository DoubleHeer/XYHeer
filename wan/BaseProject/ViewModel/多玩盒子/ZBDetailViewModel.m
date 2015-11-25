//
//  ZBDetailViewModel.m
//  BaseProject
//
//  Created by heer on 15/11/25.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBDetailViewModel.h"

@implementation ZBDetailViewModel

-(id)initWithEquipId:(NSInteger)equipId
{
    if(self = [super init])
    {
        _equipId = equipId;
    }
    return self;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    
    self.dataTask = [DuoWanNetManager getEquiqDetailWithId:_equipId completeHandle:^(EquiqDetailModel *model, NSError *error) {
        self.model = model;
        completionHandle(error);
    }];
        
   
}

-(NSString *)nameFromModel{
    
    return self.model.name;
}

-(NSString *)descFromModel{
    
    return self.model.desc;
}

-(NSString *)priceFromModel{
    
    return [NSString stringWithFormat:@"升级价格:%ld 总价格:%ld 出售价格:%ld",self.model.price,self.model.allPrice,self.model.sellPrice];
}

-(NSArray *)needArrayFromModel{
    
    NSArray *array = [self.model.need componentsSeparatedByString:@","];
    return array;
}

-(NSArray *)composeArrayFromModel{
    
    NSArray *array = [self.model.compose componentsSeparatedByString:@","];
    return array;
}

@end
