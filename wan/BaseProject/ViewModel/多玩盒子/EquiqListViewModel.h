//
//  EquiqListViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"

@interface EquiqListViewModel : BaseViewModel

-(instancetype)initWithTag:(NSString *)tag;
@property (nonatomic) NSString *tag;

@property (nonatomic) NSInteger rowNumber;

-(NSInteger)equiqIDForRow:(NSInteger)row;
-(NSString *)textForRow:(NSInteger)row;
-(NSURL *)iconURLForRow:(NSInteger)row;
@end
