//
//  TuWanPicViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanPicViewController.h"
#import "TuWanPicViewModel.h"

@interface TuWanPicViewController()<MWPhotoBrowserDelegate>

@property (nonatomic,strong) TuWanPicViewModel *tuwanPicVM;

@end
@implementation TuWanPicViewController

-(TuWanPicViewModel *)tuwanPicVM{
    if (!_tuwanPicVM) {
        _tuwanPicVM = [[TuWanPicViewModel alloc]initWithAid:_aid];
    }
    return _tuwanPicVM;
}

-(id)initWithAid:(NSString *)aid{
    if (self = [super init]) {
        _aid = aid;
    }
    return self;
}

-(id)init{
    if (self = [super init]) {
        NSAssert1(NO, @"%s,必须使用initWithAid方法初始化", __FUNCTION__);
    }
    return self;
}


-(void)viewDidLoad{
    [super viewDidLoad];
    //手写代码默认背景色是透明
    self.view.backgroundColor = [UIColor whiteColor];
    //添加返回按钮
    [Factory addBackItemToVC:self];
    //请求时要有正在操作的提示
    [self showProgress];
    [self.tuwanPicVM getDataFromNetCompleteHandle:^(NSError *error) {
        [self hideProgress];
        //创建图片展示页面,Github排名最高的图片展示类控件
        MWPhotoBrowser *photoB = [[MWPhotoBrowser alloc]initWithDelegate:self];
        //[self.navigationController pushViewController:photoB animated:YES];
        //图片展示页面不应该是当前页面推出的，而应该是取代当前页在导航控制器中的位置
        NSMutableArray *naciVCs = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
    //删除掉最后一个控制器，即当前白色控制器
        [naciVCs removeLastObject];
        //把图片控制器添加到最后
        [naciVCs addObject:photoB];
        //把图片控制器数组赋值给导航控制器
        self.navigationController.viewControllers = naciVCs;
    }];
}


#pragma mark - MWPhotoBrowserDelegate
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return [self.tuwanPicVM rowNumber];
}
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    
    MWPhoto *photo = [MWPhoto photoWithURL:[self.tuwanPicVM picURLForRow:index]];
    return photo;
}
@end
