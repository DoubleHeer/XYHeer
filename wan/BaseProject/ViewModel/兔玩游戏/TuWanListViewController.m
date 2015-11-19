//
//  TuWanListViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanListViewController.h"
#import "TuWanViewModel.h"
#import "TuWanListCell.h"
#import "TuWanImageCell.h"
#import "iCarousel.h"
#import "TuWanHtmlViewController.h"
#import "TuWanPicViewController.h"

@interface TuWanListViewController()<iCarouselDelegate,iCarouselDataSource>
@property (nonatomic,strong)TuWanViewModel *tuwanVM;

@end

@implementation TuWanListViewController
{
//添加成员变量。因为不需要懒加载，所有不需要使用属性
    iCarousel *_ic;
    UIPageControl *_pageControl;
    UILabel *_titleLb;
    NSTimer *_timer;
}

-(TuWanViewModel *)tuwanVM{
    if (!_tuwanVM) {
        _tuwanVM = [[TuWanViewModel alloc]initWithType:_infoType.integerValue];
    }
    return _tuwanVM;
}
/**头部滚动视图*/
-(UIView *)headerView{
    [_timer invalidate];
    
    //如果当前没有头部视图，返回nil
    if (!self.tuwanVM.isExistIndexPic) {
        return nil;
    }
    //头部视图 origin无效，宽度无效，肯定是与table同宽
    //根据宽高比例计算高度
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, kWindowW/750*500)];
    //添加底部视图
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = kRGBColor(240, 240, 240);
    [headView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(35);
    }];
    _titleLb = [UILabel new];
    [bottomView addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = self.tuwanVM.indexPicNumber;
    [bottomView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.mas_lessThanOrEqualTo(60);
        make.width.mas_greaterThanOrEqualTo(20);
        make.left.mas_equalTo(_titleLb.mas_right).mas_equalTo(-10);
    }];
    _titleLb.text = [self.tuwanVM titleForRowInIndexPic:0];
    //添加滚动栏
    _ic = [iCarousel new];
    [headView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(bottomView.mas_top).mas_equalTo(0);
        
    }];
    _ic.delegate = self;
    _ic.dataSource = self;
    _ic.pagingEnabled = YES;
    _ic.scrollSpeed = 1;
    //如果只有一张图，则不显示圆点
    _pageControl.hidesForSinglePage = YES;
    //如果只有一张图，则不可以滚动
    _ic.scrollEnabled = self.tuwanVM.indexPicNumber != 1;
    _pageControl.pageIndicatorTintColor = kNavTitleColor;
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    //取消圆点用户交互
    _pageControl.userInteractionEnabled = NO;
    
    if (self.tuwanVM.indexPicNumber > 1) {
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex+1 animated:YES];
        } repeats:YES];
       
    }

    return headView;
}
#pragma mark - iCarouselDataSource
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.tuwanVM.indexPicNumber;
}

-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/750*500-35)];
        UIImageView *imageView = [UIImageView new];
        [view addSubview:imageView];
        imageView.tag = 100;
        imageView.contentMode = 2;
        view.clipsToBounds = YES;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    [imageView setImageWithURL:[self.tuwanVM iconURLForRowInIndexPic:index] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
    
    return view;
}
/**允许循环滚动*/
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}

/**监听滚动到第几个*/
-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
   // NSLog(@"%ld",carousel.currentItemIndex);
    _titleLb.text = [self.tuwanVM titleForRowInIndexPic:carousel.currentItemIndex];
    _pageControl.currentPage = carousel.currentItemIndex;
}

/**滚动栏被选中触发*/
-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    if ([self.tuwanVM isHtmlInIndexPicForRow:index]) {
        TuWanHtmlViewController *vc = [[TuWanHtmlViewController alloc]initWithURL:[self.tuwanVM detailURLForRowInIndexPic:index]];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([self.tuwanVM isPicInIndexPicForRow:index]) {
        TuWanPicViewController *vc = [[TuWanPicViewController alloc]initWithAid:[self.tuwanVM aidInIndexPicForRow:index]];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
#pragma mark - ciewDidLoad

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerClass:[TuWanListCell class] forCellReuseIdentifier:@"ListCell"];
    [self.tableView registerClass:[TuWanImageCell class] forCellReuseIdentifier:@"ImageCell"];
    //
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.tuwanVM refreshDataCompletionHandle:^(NSError *error) {
            self.tableView.tableHeaderView = [self headerView];
            [self.tableView.header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.tuwanVM getMoreDataCompletionHandle:^(NSError *error) {
             self.tableView.tableHeaderView = [self headerView];
            [self.tableView.footer endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    //
    [self.tableView.header beginRefreshing];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tuwanVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.tuwanVM containImages:indexPath.row]) {
        TuWanImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell"];
        cell.titleLb.text = [self.tuwanVM titleForRowInList:indexPath.row];
        cell.clicksNumLb.text = [self.tuwanVM clicksForRowInList:indexPath.row];
        [cell.iconIV0.imageView setImageWithURL:[self.tuwanVM iconURLsForRowInList:indexPath.row][0] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_2"]];
        [cell.iconIV1.imageView setImageWithURL:[self.tuwanVM iconURLsForRowInList:indexPath.row][1] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_2"]];
        [cell.iconIV2.imageView setImageWithURL:[self.tuwanVM iconURLsForRowInList:indexPath.row][2] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_2"]];
        
        return cell;
    }else{
    TuWanListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    //placeholderImage 当图片没有下载完成之前显示的图片
    [cell.iconIV.imageView setImageWithURL:[self.tuwanVM iconURLForRowInList:indexPath.row]placeholderImage:[UIImage imageNamed:@"cell_bg_noData_2"]];
    cell.titleLb.text = [self.tuwanVM titleForRowInList:indexPath.row];
    cell.longTitleLb.text = [self.tuwanVM descForRowInList:indexPath.row];
    cell.clicksNumLb.text = [self.tuwanVM clicksForRowInList:indexPath.row];
        return cell;
    }
    
}

/**去掉分割线*/
kRemoveCellSeparator

//点击触发方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.tuwanVM isHtmlInListForRow:indexPath.row]) {
        TuWanHtmlViewController *vc = [[TuWanHtmlViewController alloc]initWithURL:[self.tuwanVM detailURLForRowInList:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([self.tuwanVM isPicInListForRow:indexPath.row]) {
        TuWanPicViewController *vc = [[TuWanPicViewController alloc]initWithAid:[self.tuwanVM aidInListForRow:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

/**设置cell高度*/
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.tuwanVM containImages:indexPath.row]?135:90;
}




@end
