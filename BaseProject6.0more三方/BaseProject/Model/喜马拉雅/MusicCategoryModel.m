//
//  MusicCategoryModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MusicCategoryModel.h"

@implementation MusicCategoryModel


@end

@implementation MusicCategoryAlbumModel

@end


@implementation MusicCategoryTracksModel

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [MusicCategoryTracksListModel class]};
}

@end


@implementation MusicCategoryTracksListModel

@end


