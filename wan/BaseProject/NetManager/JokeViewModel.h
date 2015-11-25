//
//  JokeViewModel.h
//  BaseProject
//
//  Created by heer on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "JokeNetManager.h"
 
@interface JokeViewModel : BaseViewModel

@property (nonatomic) NSInteger page;
@property (nonatomic) NSInteger rowNumber;

-(NSString *)updatetimeForRow:(NSInteger)row;
-(NSString *)contentForRow:(NSInteger)row;
@end
