//
//  XiMaCategoryCell.m
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaCategoryCell.h"

@implementation XiMaCategoryCell

-(UILabel *)orderLb{
    if (!_orderLb) {
        _orderLb = [[UILabel alloc]init];
        _orderLb.font = [UIFont boldSystemFontOfSize:17];
        _orderLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_orderLb];
    }
    return _orderLb;
}

-(XYImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [XYImageView new];
        [self.contentView addSubview:_iconIV];
    }
    return _iconIV;
}

-(UILabel *)titleLb{
    if(!_titleLb){
    _titleLb = [UILabel new];
        _titleLb.font = [UIFont boldSystemFontOfSize:18];
      
        [self.contentView addSubview:_titleLb];
    }
    return _titleLb;
}
-(UILabel *)descLb{
    if(!_descLb){
        _descLb = [UILabel new];
        _descLb.font = [UIFont boldSystemFontOfSize:15];
        _descLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_descLb];
    }
    return _descLb;
}
-(UILabel *)numberLb{
    if(!_numberLb){
        _numberLb = [UILabel new];
        _numberLb.font = [UIFont boldSystemFontOfSize:12];
        _numberLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_numberLb];
    }
    return _numberLb;
}


-(XYImageView *)numberIV{
    if (!_numberIV) {
        _numberIV = [XYImageView new];
        _numberIV.imageView.image = [UIImage imageNamed:@"album_tracks"];
        [self.contentView addSubview:_numberIV];
    }
    return _numberIV;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //右箭头样式
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //添加依赖autolayout - 一定要有顺序，即从左到右，从上到下
        [self.orderLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(10);
            make.width.mas_equalTo(20);
            
        }];
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(65, 65));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(self.orderLb.mas_right).mas_equalTo(0);
        }];
        
    }
    return self;
}
@end
