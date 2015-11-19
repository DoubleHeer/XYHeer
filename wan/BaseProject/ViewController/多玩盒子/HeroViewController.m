//
//  HeroViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroViewController.h"
#import "HeroListViewCell.h"

@interface HeroViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UISegmentedControl *segmentedControl;

@property (nonatomic,strong) UICollectionView *collectionView;
@end

@implementation HeroViewController

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
            if(sender.selectedSegmentIndex == 0){
                NSLog(@"%ld",sender.selectedSegmentIndex);
            }else{
                NSLog(@"%ld",sender.selectedSegmentIndex);
            }
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

    
  
}

#pragma mark - UICollectionViewDataSource




@end
