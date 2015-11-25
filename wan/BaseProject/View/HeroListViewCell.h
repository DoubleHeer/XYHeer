//
//  HeroListViewCell.h
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYImageView.h"

@interface HeroListViewCell : UICollectionViewCell

@property (nonatomic,strong) UILabel *titleLb;
@property (nonatomic,strong) UILabel *cNameLb;
@property (nonatomic,strong) UILabel *locationLb;
@property (nonatomic,strong) XYImageView *iconImg;



@end
