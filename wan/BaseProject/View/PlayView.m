//
//  PlayView.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "PlayView.h"

@implementation PlayView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(PlayView *)sharedInstance{
    static PlayView *playView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        playView = [PlayView new];
    });
    return playView;
}

-(id)init{
    if (self = [super init]) {
        self.playBtn.hidden = NO;
        self.backgroundColor = kNavTitleColor;
    }
    return self;
}

-(UIButton *)playBtn{
    if (!_playBtn) {
        _playBtn = [UIButton buttonWithType:0];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"toolbar_play_n_p"] forState:UIControlStateNormal];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"toolbar_pause_n_p"] forState:UIControlStateSelected];
        [self addSubview:_playBtn];
        [_playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_playBtn bk_addEventHandler:^(UIButton *sender) {
            //selected YES:在播放  NO：暂停
            if (sender.selected) {
                [_player pause];
            }else{
                [_player play];
            }
            sender.selected = !sender.selected;
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _playBtn;
}

-(void)playMusicWithURL:(NSURL *)musicURL{
    //支持后台播放
    [[AVAudioSession sharedInstance]setCategory:AVAudioSessionCategoryPlayback error:nil];
    //激活
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    //并在info.plist中添加： Required background modes
    _player = [AVPlayer playerWithURL:musicURL];
    [_player play];
    self.playBtn.selected = YES;
    
}
@end
