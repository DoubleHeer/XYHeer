//
//  BestGroupCell.h
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYImageView.h"

@interface BestGroupCell : UITableViewCell

@property (nonatomic,strong) XYImageView *img1;
@property (nonatomic,strong) XYImageView *img2;
@property (nonatomic,strong) XYImageView *img3;
@property (nonatomic,strong) XYImageView *img4;
@property (nonatomic,strong) XYImageView *img5;

@property (nonatomic,strong) UILabel *titleLb;
@property (nonatomic,strong) UILabel *desLb;
@end
