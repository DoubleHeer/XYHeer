//
//  AmuseViewModel.h
//  BaseProject
//
//  Created by heer on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "JokeNetManager.h"

@interface AmuseViewModel : BaseViewModel
@property (nonatomic) NSInteger page;
@property (nonatomic) NSInteger rowNumber;

-(NSString *)contentForRow:(NSInteger)row;
-(NSString *)updateTimeForRow:(NSInteger)row;
-(NSURL *)iconURLForRow:(NSInteger)row;

@end
