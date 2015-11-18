//
//  VideoModel.m
//  BaseProject
//
//  Created by tarena on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel
//定义两个数组对象中的元素对应的解析类
+(NSDictionary *)objectClassInArray{
    return @{@"videoSidList":[VideoVideoSidListModel class],@"videoList":[VideoVideoListModel class]};
}

@end


@implementation VideoVideoSidListModel



@end

/**************************/
@implementation VideoVideoListModel
//因为服务器传入串的key是description,是系统关键词。我们属性无法命名为系统关键词，只能改为desc,改动后需要通知MJExtension

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"desc":@"description",
             @"mp4Url":@"mp4_url",
             @"m3u8HdUrl":@"m3u8Hd_url",
             @"mp4HdUrl":@"mp4Hd_url",
             @"m3u8Url":@"m3u8_url"
             };
}

//快捷的把例如 m3u8_url  转为 m3u8Url
//underlineFromCamel:loveYou --> love_you
//此方法要求服务器人员，命名规范

//+(NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
//    return [propertyName underlineFromCamel];
//}

@end