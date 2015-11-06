//
//  TuWanImageCell.m
//  BaseProject
//
//  Created by tarena on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanImageCell.h"

@implementation TuWanImageCell



-(UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc]init];
        _titleLb.font = [UIFont systemFontOfSize:17];
    }
    return _titleLb;
}



-(UILabel *)clicksNumLb{
    if (!_clicksNumLb) {
        _clicksNumLb = [UILabel new];
        _clicksNumLb.font = [UIFont systemFontOfSize:12];
        _clicksNumLb.textColor = [UIColor lightGrayColor];
        _clicksNumLb.textAlignment = NSTextAlignmentRight;
    }
    return _clicksNumLb;
}


-(XYImageView *)iconIV0{
    if (!_iconIV0) {
        _iconIV0 = [[XYImageView alloc]init];
     
    }
    return _iconIV0;
}

-(XYImageView *)iconIV1{
    if (!_iconIV1) {
        _iconIV1 = [[XYImageView alloc]init];
      
    
    }
    return _iconIV1;
}

-(XYImageView *)iconIV2{
    if (!_iconIV2) {
        _iconIV2 = [[XYImageView alloc]init];
   
      
    }
    return _iconIV2;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.clicksNumLb];
        [self.contentView addSubview:self.iconIV0];
        [self.contentView addSubview:self.iconIV1];
        [self.contentView addSubview:self.iconIV2];
    /**题目 左上10 右10 */
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.right.mas_equalTo(_clicksNumLb.mas_left).mas_equalTo(-10);
            
        }];
        /**点击数 右上10，宽最大70，最小40 */
        [self.clicksNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.width.mas_greaterThanOrEqualTo(40);
            make.width.mas_lessThanOrEqualTo(70);
        }];
        /**图片：宽高相等 间距5，边缘10，高88，上边缘5*/
        [self.iconIV0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(88);
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(_titleLb.mas_bottom).mas_equalTo(5);
        }];
        [self.iconIV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_iconIV0);
            make.left.mas_equalTo(_iconIV0.mas_right).mas_equalTo(5);
            make.topMargin.mas_equalTo(_iconIV0);
        }];
        [self.iconIV2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_iconIV0);
            make.left.mas_equalTo(_iconIV1.mas_right).mas_equalTo(5);
            make.topMargin.mas_equalTo(_iconIV0);
            make.right.mas_equalTo(-10);
        }];
        
    }
    return self;
}
@end
