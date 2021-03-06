//
//  TuWanImageCell.h
//  BaseProject
//
//  Created by tarena on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYImageView.h"

@interface TuWanImageCell : UITableViewCell
/**图片标签*/
@property (nonatomic,strong) UILabel *titleLb;
/**点击数标签*/
@property (nonatomic,strong) UILabel *clicksNumLb;
/**图片0*/
@property (nonatomic,strong) XYImageView *iconIV0;
/**图片1*/
@property (nonatomic,strong) XYImageView *iconIV1;
/**图片2*/
@property (nonatomic,strong) XYImageView *iconIV2;

@end
