//
//  SumAbilityViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"

@interface SumAbilityViewModel : BaseViewModel

@property (nonatomic) NSInteger rowNumber;

-(NSURL *)iconURLForRow:(NSInteger)row;
-(NSString *)desForRow:(NSInteger)row;
-(NSString *)nameForRow:(NSInteger)row;
-(NSString *)levelForRow:(NSInteger)row;
-(NSString *)cooldownForRow:(NSInteger)row;
-(NSString *)tipsForRow:(NSInteger)row;
-(NSString *)strongForRow:(NSInteger)row;
@end
