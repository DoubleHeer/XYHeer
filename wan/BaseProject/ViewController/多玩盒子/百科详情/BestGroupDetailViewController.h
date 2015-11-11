//
//  BestGroupDetailViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BestGroupViewModel.h"

@interface BestGroupDetailViewController : UIViewController

-(instancetype)initWithRow:(NSInteger)row BestGroupViewModel:(BestGroupViewModel *)bestVM;
@property (nonatomic) NSInteger row;
@property (nonatomic,strong) BestGroupViewModel *bgVM;
@end
