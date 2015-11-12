//
//  EquiqListViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EquiqListViewController : UIViewController

-(instancetype)initWithTag:(NSString *)tag text:(NSString *)text;
@property (nonatomic,strong) NSString *tag;
@property (nonatomic,strong) NSString *text;
@end
