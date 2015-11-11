//
//  BestGroupCell.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupCell.h"

@implementation BestGroupCell

-(UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont systemFontOfSize:18];
        _titleLb.numberOfLines = 1;
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.right.mas_equalTo(-5);
            make.top.mas_equalTo(3);
        }];
    }
    return _titleLb;
}

-(XYImageView *)img1{
    if (!_img1) {
        _img1 = [XYImageView new];
        [self.contentView addSubview:_img1];
        [_img1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(45, 45));
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(3);
        }];
    }
    return _img1;
}

-(XYImageView *)img2{
    if (!_img2) {
        _img2 = [XYImageView new];
        [self.contentView addSubview:_img2];
        [_img2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.img1);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(3);
            make.left.mas_equalTo(self.img1.mas_right).mas_equalTo((kWindowW-20-45*5)/4);
        }];
    }
    return _img2;
}
-(XYImageView *)img3{
    if (!_img3) {
        _img3 = [XYImageView new];
        [self.contentView addSubview:_img3];
        [_img3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.img1);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(3);
            make.left.mas_equalTo(self.img2.mas_right).mas_equalTo((kWindowW-20-45*5)/4);
        }];
    }
    return _img3;
}
-(XYImageView *)img4{
    if (!_img4) {
        _img4 = [XYImageView new];
        [self.contentView addSubview:_img4];
        [_img4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.img1);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(3);
            make.left.mas_equalTo(self.img3.mas_right).mas_equalTo((kWindowW-20-45*5)/4);
        }];
    }
    return _img4;
}
-(XYImageView *)img5{
    if (!_img5) {
        _img5 = [XYImageView new];
        [self.contentView addSubview:_img5];
        [_img5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.img1);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(3);
            make.left.mas_equalTo(self.img4.mas_right).mas_equalTo((kWindowW-20-45*5)/4);
        }];
    }
    return _img5;
}

-(UILabel *)desLb{
    if (!_desLb) {
        _desLb = [UILabel new];
        _desLb.font = [UIFont systemFontOfSize:15];
        _desLb.numberOfLines = 2;
        _desLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_desLb];
        [_desLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.right.mas_equalTo(-5);
            make.top.mas_equalTo(self.img1.mas_bottom).mas_equalTo(5);
            make.bottom.mas_equalTo(-5);
        }];
    }
    return _desLb;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //设置cell被选中后的背景色
        UIView *view = [UIView new];
        view.backgroundColor = kNavTitleColor;
        self.selectedBackgroundView = view;
        //分割线距离左侧空间
        // self.separatorInset = UIEdgeInsetsMake(0, 60, 0, 0);
        
    }
    return self;
}

@end
