//
//  MusicDetailCell.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MusicDetailCell.h"

@implementation MusicDetailCell

-(XYImageView *)coverIV{
    if (!_coverIV) {
        _coverIV = [XYImageView new];
        [self.contentView addSubview:_coverIV];
        [_coverIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(55, 55));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(10);
        }];
        _coverIV.layer.cornerRadius = 55/2;
        //添加播放标识
        UIImageView *playIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"find_album_play"]];
        [_coverIV addSubview:playIV];
        [playIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(25, 25));
            make.center.mas_equalTo(0);
        }];
    }
    return _coverIV;
}

-(UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.coverIV.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(self.timeLb.mas_left).mas_equalTo(-10);
            _titleLb.numberOfLines = 0;
        }];
    }
    return _titleLb;
}

-(UILabel *)timeLb{
    if (!_timeLb) {
        _timeLb = [UILabel new];
        [self.contentView addSubview:_timeLb];
        _timeLb.font = [UIFont systemFontOfSize:12];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.width.mas_lessThanOrEqualTo(50);
            make.width.mas_greaterThanOrEqualTo(30);
        
        }];
        _timeLb.textAlignment = NSTextAlignmentRight;
         _timeLb.textColor = [UIColor lightGrayColor];
    }
    return _timeLb;
}
-(UILabel *)sourceLb{
    if (!_sourceLb) {
        _sourceLb = [UILabel new];
        [self.contentView addSubview:_sourceLb];
        [_sourceLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(4);
            make.rightMargin.mas_equalTo(self.titleLb.mas_rightMargin);
        }];
        _sourceLb.font = [UIFont systemFontOfSize:15];
        _sourceLb.textColor = [UIColor lightGrayColor];
    }
    return _sourceLb;
}
-(UILabel *)playCountLb{
    if (!_playCountLb) {
        _playCountLb = [UILabel new];
        [self.contentView addSubview:_playCountLb];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_play"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.leftMargin.mas_equalTo(self.sourceLb.mas_leftMargin);
            make.bottom.mas_equalTo(-10);
            make.top.mas_equalTo(self.sourceLb.mas_bottom).mas_equalTo(8);
        }];
        
        [_playCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imageView);
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(3);
            
        }];
        _playCountLb.textColor = [UIColor lightGrayColor];
        _playCountLb.font = [UIFont systemFontOfSize:12];
    }
    return _playCountLb;
}

-(UILabel *)favourCountLb{
    if (!_favourCountLb) {
        _favourCountLb = [UILabel new];
        [self.contentView addSubview:_favourCountLb];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_likes"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.playCountLb);
            make.left.mas_equalTo(self.playCountLb.mas_right).mas_equalTo(7);
            make.size.mas_equalTo(CGSizeMake(20,20));
        }];
        _favourCountLb.textColor = [UIColor lightGrayColor];
        _favourCountLb.font = [UIFont systemFontOfSize:12];
        [_favourCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(3);
            make.centerY.mas_equalTo(imageView);
        }];
    }
    return _favourCountLb;
}
-(UILabel *)commentCountLb{
    if (!_commentCountLb) {
        _commentCountLb = [UILabel new];
       [self.contentView addSubview:_commentCountLb];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_comments"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.favourCountLb);
            make.left.mas_equalTo(self.favourCountLb.mas_right).mas_equalTo(7);
            make.size.mas_equalTo(CGSizeMake(18,18));
        }];
        _commentCountLb.textColor = [UIColor lightGrayColor];
        _commentCountLb.font = [UIFont systemFontOfSize:12];
        [_commentCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(3);
            make.centerY.mas_equalTo(imageView);
        }];
        
    }
    return _commentCountLb;
}

-(UILabel *)durationLb{
    if (!_durationLb) {
        _durationLb = [UILabel new];
        [self.contentView addSubview:_durationLb];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_duration"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.commentCountLb.mas_right).mas_equalTo(7);
            make.centerY.mas_equalTo(self.commentCountLb);
            make.size.mas_equalTo(CGSizeMake(18, 18));
        }];
        _durationLb.textColor = [UIColor lightGrayColor];
        _durationLb.font = [UIFont systemFontOfSize:12];
        [_durationLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(3);
            make.centerY.mas_equalTo(imageView);
        }];
    }
    return _durationLb;
}


-(UIButton *)downloadBtn{
    if (!_downloadBtn) {
        _downloadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_downloadBtn setBackgroundImage:[UIImage imageNamed:@"cell_download"] forState:0];
        [_downloadBtn bk_addEventHandler:^(id sender) {
            DDLogVerbose(@"下载按钮");
        } forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_downloadBtn];
        [_downloadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-5);
            make.centerY.mas_equalTo(self.durationLb);
            make.size.mas_equalTo(CGSizeMake(24, 24));
        }];
    }
    return _downloadBtn;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //设置cell被选中后的背景色
        UIView *view = [UIView new];
        view.backgroundColor = kRGBColor(243, 255, 254);
        self.selectedBackgroundView = view;
        //分割线距离左侧空间
        self.separatorInset = UIEdgeInsetsMake(0, 60, 0, 0);
        //为了触发下载按钮的懒加载
        self.downloadBtn.hidden = NO;
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
