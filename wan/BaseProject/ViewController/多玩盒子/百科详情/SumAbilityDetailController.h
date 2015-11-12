//
//  SumAbilityDetailController.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SumAbilityViewModel.h"

@interface SumAbilityDetailController : UIViewController

-(instancetype)initWithRow:(NSInteger)row SumAbilityViewModel:(SumAbilityViewModel *)saVM;
@property (nonatomic)NSInteger row;
@property (nonatomic,strong) SumAbilityViewModel *saVM;
@end
