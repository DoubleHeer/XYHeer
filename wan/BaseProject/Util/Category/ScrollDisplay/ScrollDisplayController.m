//
//  ScrollDisplayController.m
//  BaseProject
//
//  Created by tarena on 15/10/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ScrollDisplayController.h"

@interface ScrollDisplayController ()<UIPageViewControllerDataSource,UIPageViewControllerDelegate>

@end

@implementation ScrollDisplayController

//传入图片地址数组
-(instancetype)initWithImgPaths:(NSArray *)paths{
    //图片地址 ：路径中可能的类型；NSURL,Http://,https://  本地路径：file://
    NSMutableArray *arr = [NSMutableArray new];
    for (int i=0; i<paths.count; i++) {
        id path = paths[i];
        //为了监控用户点击操作，使用button
        //UIImageView *imgView = [UIImageView new];
        UIButton *btn = [UIButton buttonWithType:0];
        if ([self isURL:path]) {
            [btn sd_setBackgroundImageWithURL:path forState:0];
        }else if ([self isNetPath:path]){
            NSURL *url = [NSURL URLWithString:path];
            //[imgView sd_setImageWithURL:url];
            [btn sd_setBackgroundImageWithURL:url forState:0];
        }else if([path isKindOfClass:[NSString class]]){
            //本地地址
            NSURL *url = [NSURL fileURLWithPath:path];
            [btn sd_setBackgroundImageWithURL:url forState:0];
            //[imgView sd_setImageWithURL:url];
        }else{
            //这里可以给imageView 设置一个裂开的本地图片
           // imgView.image = [UIImage imageNamed:@"error"];
            [btn setImage:[UIImage imageNamed:@"error"] forState:0];
        }
        UIViewController *vc = [UIViewController new];
        vc.view = btn;
        
        btn.tag = 1000+i;
        [btn bk_addEventHandler:^(UIButton *sender) {
            [self.delegate scrollDisplayViewController:self didSelectedIndex:sender.tag-1000];
        } forControlEvents:UIControlEventTouchUpInside];
        
        [arr addObject:vc];
    }
    self = [self initWithControllers:arr];
    return self;
}
//判断到底是何种类型
-(BOOL)isURL:(id)path{//判断是否URL类型
    return [path isKindOfClass:[NSURL class]];
}

-(BOOL)isNetPath:(id)path{//判断是否网络类型
    //  http://     https://
//    BOOL isStr = [path isKindOfClass:[NSString class]];
//    //为了防止非String类型调用下方崩溃
//    if (!isStr) {
//        return NO;
//    }
//    BOOL containHttp = [path rangeOfString:@"http"].location != NSNotFound;
//    BOOL containTile = [path rangeOfString:@"://"].location != NSNotFound;
//    return isStr && containHttp && containTile;
    
    //如果合写无需考虑上面问题
    return [path isKindOfClass:[NSString class]] && [path rangeOfString:@"http"].location != NSNotFound &&[path rangeOfString:@"://"].location != NSNotFound;
}

//传入图片名字数组
-(instancetype)initWithImgNames:(NSArray *)names{
   
    //图片名字 --> image --> imageView --> ViewController
    NSMutableArray *arr = [NSMutableArray new];
    for (int i=0; i<names.count; i++) {
        UIImage *img = [UIImage imageNamed:names[i]];
       // UIImageView *imgView = [[UIImageView alloc]initWithImage:img];
        //改成按钮的
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:img forState:0];
        UIViewController *vc= [UIViewController new];
        vc.view = button;
        //设置tag值，根据tag确定点击的按钮并回传
        button.tag = 1000+i;
        [button bk_addEventHandler:^(UIButton *sender) {
            [self.delegate scrollDisplayViewController:self didSelectedIndex:sender.tag -1000];
        } forControlEvents:UIControlEventTouchUpInside];
        
        [arr addObject:vc];
    }
    
    if(self = [self initWithControllers:arr]){
        
    }
    
    return self;
}

//传入视图控制器数组
-(instancetype)initWithControllers:(NSArray *)controllers{
    if (self = [super init]) {
        //为了防止实参是可变数组，需要复制一份出来，这样可以保证属性不会因为可变数组在外部被修改，而导致随之也修改了
        _controllers = [controllers copy];
//设置初始化属性
        _autoCycle = YES;
        _canCycle = YES;
        _showPageControl = YES;
        _duration = 3;
        _pageControlOffset = 0;
    }
    return self;
}

-(void)setAutoCycle:(BOOL)autoCycle{
    _autoCycle = autoCycle;
    //停止定时器
    [_timer invalidate];
    if (!autoCycle) {//如果为NO,表示不执行循环,直接返回
        return;
    }
    _timer = [NSTimer bk_scheduledTimerWithTimeInterval:_duration block:^(NSTimer *timer) {
        
        UIViewController *vc = _pageVC.viewControllers.firstObject;
        NSInteger index = [_controllers indexOfObject:vc];
        UIViewController *nextVC = nil;
        if (index == _controllers.count-1) {
            nextVC = _controllers.firstObject;
        }else{
            nextVC = _controllers[index+1];
        }
        __block id VC1 = self;
        [_pageVC setViewControllers:@[nextVC] direction:0 animated:YES completion:^(BOOL finished) {
            //回调小圆点滚动
            [VC1 configPageControl];
        }];
    } repeats:YES];
}
//是否显示小圆点
-(void)setShowPageControl:(BOOL)showPageControl{
    _showPageControl = showPageControl;
    _pageControl.hidden = !showPageControl;
}

//
-(void)setDuration:(NSTimeInterval)duration{
    _duration = duration;
    self.autoCycle = _autoCycle;
    
}

//用于保存当前选择的页面
-(void)setCurrentPage:(NSInteger)currentPage{
    //设置新的显示页面，情况有三种
    //情况一：新页面和老页面是同一个 ，则什么都不做
    //情况二：新页面 在 老页面 的右侧，动画效果应该是向右滚动
    //情况三：新页面 在 老页面 的左侧，动画效果应该向左滚动
    /*方向枚举值
     UIPageViewControllerNavigationDirectionForward,
     UIPageViewControllerNavigationDirectionReverse
     */
    NSInteger direction = 0;
    if (_currentPage == currentPage) {
        return;
    }else if (_currentPage > currentPage){
        direction = 1;
    }else{
        direction = 0;
    }
    _currentPage = currentPage;
    UIViewController *vc = _controllers[currentPage];
    [_pageVC setViewControllers:@[vc] direction:direction animated:YES completion:nil];
}
//距离底部位置
-(void)setPageControlOffset:(CGFloat)pageControlOffset{
    _pageControlOffset = pageControlOffset;
    //更新页面数量控件， bottom 约束
    [_pageControl mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_pageControlOffset);
    }];
}

/****************************/

- (void)viewDidLoad {
    [super viewDidLoad];
    //如果控制器数组  为空 或者 不存在 则不在进行之后方法
    if (!_controllers || _controllers.count == 0) {
        return;
    }
    
    //第一个 1 代表枚举滚动  第二个 0 代表横向
    _pageVC = [[UIPageViewController alloc]initWithTransitionStyle:1 navigationOrientation:0 options:nil];
    
    _pageVC.delegate = self;
    _pageVC.dataSource = self;
    [self addChildViewController:_pageVC];
    [self.view addSubview:_pageVC.view];
    //需要使用pod 引入 Masonry 第三方类库
    //进行布局
    [_pageVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    //设置滚动页初始状态
    [_pageVC setViewControllers:@[_controllers.firstObject] direction:0 animated:YES completion:nil];
    
    //配置小圆点
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = _controllers.count;
    [self.view addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(0);
    }];
    //取消小圆点用户交互
    _pageControl.userInteractionEnabled = NO;
    
    self.autoCycle = _autoCycle;
    self.showPageControl = _showPageControl;
    self.pageControlOffset = _pageControlOffset;
}

//操作圆点位置
-(void)configPageControl{
    NSInteger index = [_controllers indexOfObject:_pageVC.viewControllers.firstObject];
    _pageControl.currentPage = index;
}

#pragma mark - UIPageViewController
//前一页
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSInteger index = [_controllers indexOfObject:viewController];
    if (index == 0) {
        return  _canCycle?_controllers.lastObject:nil;
    }
    return _controllers[index-1];
}

//下一页
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSInteger index = [_controllers indexOfObject:viewController];
    if (index == _controllers.count-1) {
        return _canCycle?_controllers.firstObject:nil;
    }
    return _controllers[index+1];
}

//页面完成滚动切换时调用
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{
    if (completed && finished) {
        [self configPageControl];
        NSInteger index = [_controllers indexOfObject:pageViewController.viewControllers.firstObject];
        //respondsToSelector可以判断 某个对象是否有某个方法
        if ([self.delegate respondsToSelector:@selector(scrollDisplayViewController:currentIndex:)]) {
              [self.delegate scrollDisplayViewController:self currentIndex:index];
        }
      
    }
}

@end
