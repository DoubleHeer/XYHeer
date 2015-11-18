//
//  MusicListViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicListViewController : UIViewController
- (instancetype)initWithAlbumId:(NSInteger)albumId albumTitle:(NSString *)title;
@property(nonatomic) NSInteger albumId;
@property (nonatomic,strong) NSString *albumTitle;
@end

