//
//  HeroListViewCell.m
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroListViewCell.h"

@implementation HeroListViewCell

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:14];
        
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconImg.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(0);
            
        }];
    }
    return _titleLb;
}

- (UILabel *)cNameLb {
    if(_cNameLb == nil) {
        _cNameLb = [[UILabel alloc] init];
        _cNameLb.font = [UIFont systemFontOfSize:12];
        _cNameLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_cNameLb];
        [_cNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconImg.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(2);
            make.right.mas_equalTo(0);
        }];
    }
    return _cNameLb;
}

- (UILabel *)locationLb {
    if(_locationLb == nil) {
        _locationLb = [[UILabel alloc] init];
        
        _locationLb.font = [UIFont systemFontOfSize:12];
        _locationLb.textColor = [UIColor blueColor];
        [self.contentView addSubview:_locationLb];
        [_locationLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconImg.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(self.cNameLb.mas_bottom).mas_equalTo(2);
            make.right.mas_equalTo(0);
        }];
    }
    return _locationLb;
}

- (XYImageView *)iconImg {
    if(_iconImg == nil) {
        _iconImg = [[XYImageView alloc] init];
        [self.contentView addSubview:_iconImg];
        [_iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
    }
    return _iconImg;
}


@end
