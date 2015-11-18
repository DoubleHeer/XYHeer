//
//  VideoCell.m
//  BaseProject
//
//  Created by tarena on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoCell.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@implementation VideoCell

+(AVPlayerViewController *)sharedInstance{
    static AVPlayerViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [AVPlayerViewController new];
    });
    return vc;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.numberOfLines = 1;
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
        }];
    }
    return _titleLabel;
}
-(UILabel *)descLabel{
    if (!_descLabel) {
        _descLabel = [UILabel new];
        _descLabel.font = [UIFont systemFontOfSize:14];
        _descLabel.textColor = [UIColor lightGrayColor];
        _descLabel.numberOfLines = 2;
        [self.contentView addSubview:_descLabel];
        [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_equalTo(2);
        }];
    }
    return _descLabel;
}

-(UIButton *)iconBtn{
    if (!_iconBtn) {
        _iconBtn = [UIButton buttonWithType:0];
        [_iconBtn bk_addEventHandler:^(id sender) {
        
            AVPlayer *player = [AVPlayer playerWithURL:self.videoURL];
            [player play];
            [sender addSubview:[VideoCell sharedInstance].view];
            [[VideoCell sharedInstance].view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(0);
            }];
        } forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_iconBtn];
        [_iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.bottom.mas_equalTo(-10);
            make.top.mas_equalTo(self.descLabel.mas_bottom).mas_equalTo(3);
            make.height.mas_equalTo(220);
            
        }];
    }
    return _iconBtn;
}


//如果cell被复用了，需要把cell上的播放器删除掉
-(void)prepareForReuse{
    [super prepareForReuse];
    //判断当前cell是否有播放，如果有则删除
    if ([VideoCell sharedInstance].view.superview == self.iconBtn ) {
        [[VideoCell sharedInstance].view removeFromSuperview];
        [VideoCell sharedInstance].player = nil;
    }
    
}
@end
