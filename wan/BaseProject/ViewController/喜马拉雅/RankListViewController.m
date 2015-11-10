//
//  RankListViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RankListViewController.h"
#import "XiMaCategoryCell.h"
#import "XiMaCategoryViewModel.h"
#import "MusicListViewController.h"

@interface RankListViewController()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) XiMaCategoryViewModel *ximaVM;

@end
@implementation RankListViewController
-(XiMaCategoryViewModel *)ximaVM{
    if (!_ximaVM) {
        _ximaVM = [XiMaCategoryViewModel new];
    }
    return _ximaVM;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[XiMaCategoryCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _tableView;
}

+(UINavigationController *)defaultNavi{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        RankListViewController *vc = [RankListViewController new];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    self.title = @"音乐TOP50";
    //刷新
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.ximaVM refreshDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
            }else{
             
                [self.tableView reloadData];
            }
            [_tableView.header endRefreshing];
        }];
    }];
    //加载更多
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.ximaVM getMoreDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
                if (error.code == 999) {
                    [self.tableView.footer endRefreshingWithNoMoreData];
                }else{
                    [_tableView.footer endRefreshing];
                }
            }else{
                [self.tableView reloadData];
            }
            //重置脚部，没有更多数据
            [_tableView.footer resetNoMoreData];
            [_tableView.footer endRefreshing];
        }];
    }];
    [self.tableView.header beginRefreshing];
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.ximaVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XiMaCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.ximaVM titleForRow:indexPath.row];
    cell.descLb.text = [self.ximaVM descForRow:indexPath.row];
    cell.numberLb.text = [self.ximaVM numberForRow:indexPath.row];
    [cell.iconIV.imageView setImageWithURL:[self.ximaVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"a4813743"]];
    cell.orderLb.text = @(indexPath.row + 1).stringValue;
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 170/2;
}
//
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MusicListViewController *vc = [[MusicListViewController alloc]initWithAlbumId:[self.ximaVM albumIdForRow:indexPath.row] albumTitle:[self.ximaVM titleForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
