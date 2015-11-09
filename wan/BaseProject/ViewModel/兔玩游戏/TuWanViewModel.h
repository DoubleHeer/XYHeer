//
//  TuWanViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TUWanNetManager.h"

@interface TuWanViewModel : BaseViewModel
//
@property (nonatomic) NSInteger start;



/**必须使用初始化方法，需要一个类型 */
-(instancetype)initWithType:(TuWanListType)type;
@property (nonatomic) TuWanListType type;

@property (nonatomic) NSInteger rowNumber;

/**判读某一行数据是否有图*/
-(BOOL)containImages:(NSInteger)row;

/**返回列表中某行数据题目*/
-(NSString *)titleForRowInList:(NSInteger)row;
/**返回列表中某行数据的图片 */
-(NSURL *)iconURLForRowInList:(NSInteger)row;
/**返回列表中某行数据的描述 */
-(NSString *)descForRowInList:(NSInteger)row;
/**返回列表中某行数据的浏览人数 */
-(NSString *)clicksForRowInList:(NSInteger)row;
/**获取列表中某行数据对应的html5链接 */
-(NSURL *)detailURLForRowInList:(NSInteger)row;

/**存放头部滚动栏 */
@property (nonatomic,strong) NSArray *indexPicArr;
/**是否有头部滚动栏 */
@property (nonatomic,getter=isExistIndexPic) BOOL existIndexPic;
/**滚动展示栏的图片*/
-(NSURL *)iconURLForRowInIndexPic:(NSInteger)row;
/**滚动展示栏的文字 */
-(NSString *)titleForRowInIndexPic:(NSInteger)row;
/**获取展示栏中某行数据对应的html5链接 */
-(NSURL *)detailURLForRowInIndexPic:(NSInteger)row;

/**滚动展示栏的图片数量*/
@property (nonatomic) NSInteger indexPicNumber;

/**通过行数返回此行中对应的图片链接数组*/
-(NSArray *)iconURLsForRowInList:(NSInteger)row;


/**当前数据类型是视频*/
-(BOOL)isVideoInListForRow:(NSInteger)row;
-(BOOL)isVideoInIndexPicForRow:(NSInteger)row;
/**当前数据类型是图片*/
-(BOOL)isPicInListForRow:(NSInteger)row;
-(BOOL)isPicInIndexPicForRow:(NSInteger)row;
/**当前数据类型是html*/
-(BOOL)isHtmlInListForRow:(NSInteger)row;
-(BOOL)isHtmlInIndexPicForRow:(NSInteger)row;

/**返回某行数据的aid*/
-(NSString *)aidInListForRow:(NSInteger)row;
-(NSString *)aidInIndexPicForRow:(NSInteger)row;

@end
