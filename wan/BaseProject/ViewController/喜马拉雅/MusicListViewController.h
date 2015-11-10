//
//  MusicListViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicListViewController : UIViewController

@property (nonatomic,copy) NSString *albumTitle;
@property (nonatomic) NSInteger albumId;

-(instancetype)initWithAlbumId:(NSInteger)albumId albumTitle:(NSString *)albumTitle;





@end
