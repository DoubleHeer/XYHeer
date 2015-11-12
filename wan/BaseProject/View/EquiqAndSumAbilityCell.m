//
//  EquiqAndSumAbilityCell.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "EquiqAndSumAbilityCell.h"

@implementation EquiqAndSumAbilityCell
-(XYImageView *)image{
    if (!_image) {
        _image = [XYImageView new];
        [self.contentView addSubview:_image];
        [_image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(_image.mas_width);
            
        }];
        
    }
    return _image;
}

-(UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont systemFontOfSize:14];
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.backgroundColor = [UIColor whiteColor];
        _titleLb.numberOfLines = 1;
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(-2);
            
        }];
    }
    return _titleLb;
}
@end
