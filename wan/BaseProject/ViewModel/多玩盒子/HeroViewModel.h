//
//  HeroViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"

@interface HeroViewModel : BaseViewModel

@property (nonatomic) NSInteger rowNumber;
@property (nonatomic,strong) NSString *type;

-(instancetype)initWithType:(NSString *)type;

-(NSString *)titleForRow:(NSInteger)row;
-(NSString *)cnNameForRow:(NSInteger)row;
-(NSString *)locationForRow:(NSInteger)row;
-(NSURL *)iconForRow:(NSInteger)row;

@end
