//
//  BestGroupViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"

@interface BestGroupViewModel : BaseViewModel

@property (nonatomic) NSInteger rowNumber;


-(NSString *)desForRow:(NSInteger)row;
-(NSString *)des1ForRow:(NSInteger)row;
-(NSString *)des2ForRow:(NSInteger)row;
-(NSString *)des3ForRow:(NSInteger)row;
-(NSString *)des4ForRow:(NSInteger)row;
-(NSString *)des5ForRow:(NSInteger)row;

-(NSURL *)iconHero1ForRow:(NSInteger)row;
-(NSURL *)iconHero2ForRow:(NSInteger)row;
-(NSURL *)iconHero3ForRow:(NSInteger)row;
-(NSURL *)iconHero4ForRow:(NSInteger)row;
-(NSURL *)iconHero5ForRow:(NSInteger)row;

-(NSString *)titleForRow:(NSInteger)row;

@end
