//
//  HeroViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroViewController.h"
#import "HeroListViewCell.h"
#import "HeroViewModel.h"

@interface HeroViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UISegmentedControl *segmentedControl;

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) HeroViewModel *freeHeroVM;
@property (nonatomic,strong) HeroViewModel *allHeroVM;

@end

@implementation HeroViewController

-(HeroViewModel *)allHeroVM{
    if (!_allHeroVM) {
        _allHeroVM = [[HeroViewModel alloc]initWithType:@"all"];
    }
    return _allHeroVM;
}

-(HeroViewModel *)freeHeroVM{
    if (!_freeHeroVM) {
        _freeHeroVM = [[HeroViewModel alloc]initWithType:@"free"];
    }
    return _freeHeroVM;
}

-(instancetype)init{
    if (self = [super init]) {
        self.title = @"英雄";
    }
    return self;
}

-(UISegmentedControl *)segmentedControl{
    if (!_segmentedControl) {
        _segmentedControl = [[UISegmentedControl alloc]initWithItems:@[@"周免英雄",@"全部英雄"]];
        _segmentedControl.selectedSegmentIndex = 0;
        //设置颜色
        _segmentedControl.tintColor = kNavTitleColor;
        [_segmentedControl bk_addEventHandler:^(UISegmentedControl *sender) {
            [self.collectionView.header beginRefreshing];
        } forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:_segmentedControl];
        [_segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
            make.height.mas_equalTo(30);
        }];
    }
    return _segmentedControl;
}


-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewFlowLayout alloc]init]];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[HeroListViewCell class] forCellWithReuseIdentifier:@"Cell"];
        
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(70);
        }];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    self.view.backgroundColor = [UIColor whiteColor];
    self.segmentedControl.hidden = NO;
    self.collectionView.hidden = NO;
    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        if (self.segmentedControl.selectedSegmentIndex == 0) {
            [self.freeHeroVM getDataFromNetCompleteHandle:^(NSError *error) {
                [self.collectionView.header endRefreshing];
                [self.collectionView reloadData];
            }];
        }else{
            [self.allHeroVM getDataFromNetCompleteHandle:^(NSError *error) {
                [self.collectionView.header endRefreshing];
                [self.collectionView reloadData];
            }];
        }
    }];
      [self.collectionView.header beginRefreshing];
  
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        
        return self.freeHeroVM.rowNumber;
    }else{
        return self.allHeroVM.rowNumber;
    }
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HeroListViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        [cell.iconImg.imageView setImageWithURL:[self.freeHeroVM iconForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_2"]];
        cell.titleLb.text = [self.freeHeroVM titleForRow:indexPath.row];
        cell.cNameLb.text = [self.freeHeroVM cnNameForRow:indexPath.row];
        cell.locationLb.text = [self.freeHeroVM locationForRow:indexPath.row];
        return cell;
    }else{
        [cell.iconImg.imageView setImageWithURL:[self.allHeroVM iconForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_2"]];
        cell.titleLb.text = [self.allHeroVM titleForRow:indexPath.row];
        cell.cNameLb.text = [self.allHeroVM cnNameForRow:indexPath.row];
        cell.locationLb.text = [self.allHeroVM locationForRow:indexPath.row];
        return cell;
    }
        
}


#pragma mark - UICollectionViewDelegateFlowLayout
/** section的上下左右边距 */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 20, 5, 20);
}
/** 最小行间距 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
/** 最小列间距 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 20;
}
/** 每格cell的 宽高 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kWindowW - 3 * 20) / 2;
    CGFloat height = 75;
    return CGSizeMake(width, height);
}

@end
