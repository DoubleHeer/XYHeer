//
//  XYImageView.m
//  BaseProject
//
//  Created by tarena on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XYImageView.h"

@implementation XYImageView

-(instancetype)init{
    if (self = [super init]) {
        _imageView = [UIImageView new];
        [self addSubview:_imageView];
        //按比例放大，充满
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        //当前容器剪掉超出自身区域的视图
        self.clipsToBounds = YES;
    }
    return self;
}
@end
