//
//  JokeTableViewController.h
//  BaseProject
//
//  Created by heer on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JokeTableViewController : UITableViewController
/**接收外部传参，决定当前控制器显示哪种类型的信息*/
@property (nonatomic,strong) NSNumber *infoType;
@end
