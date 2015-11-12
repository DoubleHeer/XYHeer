//
//  EquiqListViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "EquiqListViewController.h"
#import "EquiqListViewModel.h"
#import "EquiqAndSumAbilityCell.h"



@interface EquiqListViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong) EquiqListViewModel *elVM;
@property (nonatomic,strong) UICollectionView *collectionView;
@end

@implementation EquiqListViewController
-(instancetype)initWithTag:(NSString *)tag text:(NSString *)text{
    if (self = [super init]) {
        _tag = tag;
        _text = text;
    }
    return self;
}

-(EquiqListViewModel *)elVM{
    if (!_elVM) {
        _elVM = [[EquiqListViewModel alloc]initWithTag:_tag];
    }
    return _elVM;
}


-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewFlowLayout alloc]init]];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[EquiqAndSumAbilityCell class] forCellWithReuseIdentifier:@"Cell"];
        
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
    
    self.title = _text;
    self.collectionView.hidden = NO;
    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.elVM getDataFromNetCompleteHandle:^(NSError *error) {
            [self.collectionView reloadData];
            [self.collectionView.header endRefreshing];
        }];
    }];
    [self.collectionView.header beginRefreshing];
}


#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.elVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    EquiqAndSumAbilityCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = kNavTitleColor;
    cell.titleLb.text = [self.elVM textForRow:indexPath.row];
    [cell.image.imageView setImageWithURL:[self.elVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_2"]];
    return cell;
}

#pragma mark - UICollectionViewDataDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
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
    CGFloat width = (kWindowW - 5 * 20) / 4;
    CGFloat height = width * 120/95;
    return CGSizeMake(width, height);
}

@end
