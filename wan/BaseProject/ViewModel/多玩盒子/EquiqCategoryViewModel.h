//
//  EquiqCategoryViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"

@interface EquiqCategoryViewModel : BaseViewModel

@property (nonatomic) NSInteger rowNumber;

-(NSString *)tagForRow:(NSInteger)row;
-(NSString *)textForRow:(NSInteger)row;

@end
