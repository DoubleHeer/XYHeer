//
//  AmuseTableViewController.m
//  BaseProject
//
//  Created by heer on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AmuseTableViewController.h"
#import "AmuseViewModel.h"


@interface AmuseTableViewCell : UITableViewCell
@property (nonatomic,strong) UIImageView *iconView;
@property (nonatomic,strong) UILabel *titleLb;
@property (nonatomic,strong) UILabel *updateTimeLb;

@end
@implementation AmuseTableViewCell


-(UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_titleLb];
        _titleLb.textAlignment = NSTextAlignmentCenter;
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(5);
            make.right.mas_equalTo(-5);
            make.height.mas_equalTo(30);
        }];
        
    }
    return _titleLb;
}

-(UILabel *)updateTimeLb{
    if (!_updateTimeLb) {
        _updateTimeLb = [UILabel new];
        _updateTimeLb.font = [UIFont systemFontOfSize:12];
        _updateTimeLb.numberOfLines = 1;
        _updateTimeLb.textAlignment = NSTextAlignmentRight;
       //_updateTimeLb.backgroundColor = [UIColor redColor];
        _updateTimeLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_updateTimeLb];
        [_updateTimeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.bottom.right.mas_equalTo(-5);
            make.height.mas_equalTo(20);
            
        }];
    }
    return _updateTimeLb;

}
-(UIImageView *)iconView{
    if (!_iconView) {
        _iconView = [UIImageView new];
        _iconView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.contentView addSubview:_iconView];
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(2);
            make.right.mas_equalTo(-5);
            make.bottom.mas_equalTo(self.updateTimeLb.mas_top).mas_equalTo(-2);
            make.size.mas_equalTo(CGSizeMake(kWindowW-20*2, 200));
        }];
    }
    return _iconView;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //设置cell被选中后的背景色
        UIView *view = [UIView new];
        view.backgroundColor = kNavTitleColor;
        self.selectedBackgroundView = view;
        //分割线距离左侧空间
        self.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
    }
    return self;
}

@end

@interface AmuseTableViewController ()

@property (nonatomic,strong) AmuseViewModel *aVM;
//@property (nonatomic,strong) UIImage *icon;
@end

@implementation AmuseTableViewController
//
//-(UIImage *)icon{
//    if (!_icon) {
//        _icon = [UIImage new];
//    }
//    return _icon;
//}

-(AmuseViewModel *)aVM{
    if (!_aVM) {
        _aVM = [AmuseViewModel new];
    }
    return _aVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.allowsSelection = NO;
    [self.tableView registerClass:[AmuseTableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.aVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.header endRefreshing];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView.header endRefreshing];
                [self.tableView reloadData];
            });
            
        }];
    }];
    
    [self.tableView.header beginRefreshing];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.aVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView.footer endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.aVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AmuseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.titleLb.text = [self.aVM contentForRow:indexPath.row];
    cell.updateTimeLb.text = [self.aVM updateTimeForRow:indexPath.row];
    
   // [self downloadImage:indexPath];
    //cell.iconView.image = self.icon;
    [cell.iconView setImageWithURL:[self.aVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];

    
    
    return cell;
}

//
////加载图片
//-(void)downloadImage:(NSIndexPath *)indexPath{
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSData *imgData = [NSData dataWithContentsOfURL:[self.aVM iconURLForRow:indexPath.row]]; //得到图像数据
//        UIImage *image = [UIImage imageWithData:imgData];
//        
//        //在主线程中更新
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.icon = image;
//            //刷新当前行
//            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
//        });
//    });
//    
//}
//自动计算行高（需要根据图片高度，当reloadData时图片还没有加载好，则高度没有改变）
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewAutomaticDimension;
    
}




@end
