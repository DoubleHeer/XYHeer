//
//  JokeViewController.m
//  BaseProject
//
//  Created by heer on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "JokeViewController.h"
#import "JokeTableViewController.h"
#import "AmuseTableViewController.h"

@interface JokeViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>
//存放控制器数组
@property (nonatomic,strong) NSArray *controllers;

@property (nonatomic,strong) UIPageViewController *pVC;

@end

@implementation JokeViewController

+(UINavigationController *)standardInstance{
    static UINavigationController *jvc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        jvc = [[UINavigationController alloc]initWithRootViewController:[JokeViewController new]];
    });
    return jvc;
}


-(UIPageViewController *)pVC{
    if (!_pVC) {
        _pVC = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        _pVC.delegate = self;
        _pVC.dataSource = self;
        //设置当前显示的控制器
        [_pVC setViewControllers:@[self.controllers.firstObject] direction:0 animated:YES completion:^(BOOL finished) {
            
        }];
    }
    return _pVC;
}

-(NSArray *)controllers{
    if (!_controllers) {
        _controllers = @[[JokeTableViewController new],[AmuseTableViewController new]];
    }
    return _controllers;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"笑话趣图";
    [Factory addMenuItemToVC:self];
    self.view.backgroundColor = [UIColor whiteColor];
    //添加子控制器 主要作用保存指针，防止释放
    [self addChildViewController:self.pVC];
    
    //把pVC的视图 添加到当前控制器，显示出来
    [self.view addSubview:self.pVC.view];
    [self.pVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
}
#pragma mark - UIPageViewControllerDataSouce

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSInteger index = [self.controllers indexOfObject:viewController];
    if (index == 0) {
        return nil;
    }
    return self.controllers[index-1];
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSInteger index = [self.controllers indexOfObject:viewController];
    if (index == self.controllers.count-1) {
        return nil;
    }
    return self.controllers[index+1];
}

@end
