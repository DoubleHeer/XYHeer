//
//  TUWanNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TUWanNetManager.h"

#define kTuWanPath      @"http://cache.tuwan.com/app/"
#define kAppId          @"appid": @1
#define kAppVer         @"appver": @2.1
#define kClassMore      @"classmore": @"indexpic"
#define kTuWanDetailPath     @"http://api.tuwan.com/app/"

//定义成宏，防止哪天服务器人员犯病，突然改动所有dtid键为tuwanID。 我们只需要改变宏中的字符串即可。
#define kRemoveClassMore(dic)        [dic removeObjectForKey:@"classmore"];
#define kSetDtId(string, dic)        [dic setObject:string forKey:@"dtid"];
#define kSetClass(string, dic)       [dic setObject:string forKey:@"class"];
#define kSetMod(string, dic)         [dic setObject:string forKey:@"mod"];

@implementation TUWanNetManager

//当传入path和参数字典时调用方法
//方法：把path和参数拼接起来，把字符串中 中文 转换为 百分号形式，因为有的服务器不接受中文编码
+(NSString *)percentPathWithPath:(NSString *)path params:(NSDictionary *)params{
    
    NSMutableString *percentPath = [NSMutableString stringWithString:path];
    
    NSArray *keys = params.allKeys;
    for (int i=0; i<keys.count; i++) {
        if (i==0) {
            [percentPath appendFormat:@"?%@=%@",keys[i],params[keys[i]]];
        }else{
            [percentPath appendFormat:@"&%@=%@",keys[i],params[keys[i]]];
        }
    }
    //把字符串中中文转为%形式
    return [percentPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

//头条http://cache.tuwan.com/app/?appid=1&classmore=indexpic&appid=1&appver=2.1
//http://cache.tuwan.com/app/?appid=1&classmore=indexpic&appid=1&appver=2.1&start=11

//独家http://cache.tuwan.com/app/?appid=1&class=heronews&mod=八卦&appid=1&appver=2.1
//http://cache.tuwan.com/app/?appid=1&class=heronews&mod=八卦&appid=1&appver=2.1&start=11

//暗黑3http://cache.tuwan.com/app/?appid=1&dtid=83623&classmore=indexpic&appid=1&appver=2.1&start=11
//http://cache.tuwan.com/app/?appid=1&dtid=83623&classmore=indexpic&appid=1&appver=2.1&start=22
//http://cache.tuwan.com/app/?appid=1&dtid=83623&classmore=indexpic&appid=1&appver=2.1&start=33

//魔兽http://cache.tuwan.com/app/?appid=1&dtid=31537&classmore=indexpic&appid=1&appver=2.1
//http://cache.tuwan.com/app/?appid=1&dtid=31537&classmore=indexpic&appid=1&appver=2.1&start=11

//风暴http://cache.tuwan.com/app/?appid=1&dtid=31538&classmore=indexpic&appid=1&appver=2.1
//http://cache.tuwan.com/app/?appid=1&dtid=31538&classmore=indexpic&appid=1&appver=2.1&start=11

//炉石 http://cache.tuwan.com/app/?appid=1&dtid=31528&classmore=indexpic&appid=1&appver=2.1

//星际2http://cache.tuwan.com/app/?appid=1&dtid=91821&appid=1&appver=2.1

//守望http://cache.tuwan.com/app/?appid=1&dtid=57067&appid=1&appver=2.1

//图片http://cache.tuwan.com/app/?appid=1&type=pic&dtid=83623,31528,31537,31538,57067,91821&appid=1&appver=2.1

//视频http://cache.tuwan.com/app/?appid=1&type=video&dtid=83623,31528,31537,31538,57067,91821&appid=1&appver=2.1
//攻略http://cache.tuwan.com/app/?appid=1&type=guide&dtid=83623,31528,31537,31538,57067,91821&appid=1&appver=2.1

//幻化http://cache.tuwan.com/app/?appid=1&class=heronews&mod=幻化&appid=1&appver=2.1

//趣闻http://cache.tuwan.com/app/?appid=1&dtid=0&class=heronews&mod=趣闻&classmore=indexpic&appid=1&appver=2.1

//COShttp://cache.tuwan.com/app/?appid=1&class=cos&mod=cos&classmore=indexpic&dtid=0&appid=1&appver=2.1

//美女http://cache.tuwan.com/app/?appid=1&class=heronews&mod=美女&classmore=indexpic&typechild=cos1&appid=1&appver=2.1
//通过type来区分 请求的地址
+(id)getTuWanListType:(TuWanListType)type
                 start:(NSInteger)start
     completionHandle:(void(^)(TuWanBaseModel *model,NSError *error))completionHandle{
    NSString *path = nil;
    switch (type) {
        case TuWanListTypeTouTiao:
            path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&classmore=indexpic&appid=1&appver=2.1&start=%ld",start];
            break;
        case TuWanListTypeDuJia:
            path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&class=heronews&mod=八卦&appid=1&appver=2.1&start=%ld",start];
            break;
        case TuWanListTypeAnHei3:
            path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&dtid=83623&classmore=indexpic&appid=1&appver=2.1&start=%ld",start];
            break;
        case TuWanListTypeMoShou:
            path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&dtid=31537&classmore=indexpic&appid=1&appver=2.1&start=%ld",start];
            break;
        case TuWanListTypeFengBao:
            path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&dtid=31538&classmore=indexpic&appid=1&appver=2.1&start=%ld",start];
            break;
        case TuWanListTypeLuShi:
            path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&dtid=31528&classmore=indexpic&appid=1&appver=2.1&start=%ld",start];
            break;
        case TuWanListTypeXingJi:
            path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&dtid=91821&appid=1&appver=2.1&start=%ld",start];
            break;
        case TuWanListTypeShouWang:
            path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&dtid=57067&appid=1&appver=2.1&start=%ld",start];
            break;
        case TuWanListTypeTuPian:
            path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&type=pic&dtid=83623,31528,31537,31538,57067,91821&appid=1&appver=2.1&start=%ld",start];
            break;
        case TuWanListTypeShiPin:
            path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&type=video&dtid=83623,31528,31537,31538,57067,91821&appid=1&appver=2.1&start=%ld",start];
            break;
        case TuWanListTypeGonglue:
            path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&type=guide&dtid=83623,31528,31537,31538,57067,91821&appid=1&appver=2.1&start=%ld",start];
            break;
        case TuWanListTypeHuanHua:
            path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&class=heronews&mod=幻化&appid=1&appver=2.1&start=%ld",start];
            break;
        case TuWanListTypeQuWen:
            path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&dtid=0&class=heronews&mod=趣闻&classmore=indexpic&appid=1&appver=2.1&start=%ld",start];
            break;
        case TuWanListTypeCOS:
            path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&class=cos&mod=cos&classmore=indexpic&dtid=0&appid=1&appver=2.1&start=%ld",start];
            break;
        case TuWanListTypeMeiNv:
            path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&class=heronews&mod=美女&classmore=indexpic&typechild=cos1&appid=1&appver=2.1&start=%ld",start];
            break;
        default:
            break;
    }
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //只要请求下来的数据共用一个解析类，就可以合写
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([TuWanBaseModel objectWithKeyValues:responseObj],error);
    }];
  
}



+ (id)getVideoDetailWithId:(NSString *)aid kCompletionHandle{
    return [self GET:[self percentPathWithPath:kTuWanDetailPath params:@{kAppId, @"aid": aid}] parameters:nil completionHandler:^(id responseObj, NSError *error) {
        //这里一定要用firstObj方法来取，不能用[0]。 如果数组为空  第一种不会崩溃，值为nil。  第二种会数组越界
        completionHandle([TuWanVideoModel objectArrayWithKeyValuesArray:responseObj].firstObject, error);
    }];
}

+ (id)getPicDetailWithId:(NSString *)aid kCompletionHandle{
    return [self GET:[self percentPathWithPath:kTuWanDetailPath params:@{kAppId, @"aid": aid}] parameters:nil completionHandler:^(id responseObj, NSError *error) {
        //这里一定要用firstObj方法来取，不能用[0]。 如果数组为空  第一种不会崩溃，值为nil。  第二种会数组越界
        completionHandle([TuWanPicModel objectArrayWithKeyValuesArray:responseObj].firstObject, error);
    }];
}


@end
