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

@interface TuWanListViewController()
@property (nonatomic,strong)TuWanViewModel *tuwanVM;

@end

@implementation TuWanListViewController
-(TuWanViewModel *)tuwanVM{
    if (!_tuwanVM) {
        _tuwanVM = [[TuWanViewModel alloc]initWithType:_infoType.integerValue];
    }
    return _tuwanVM;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerClass:[TuWanListCell class] forCellReuseIdentifier:@"ListCell"];
    [self.tableView registerClass:[TuWanImageCell class] forCellReuseIdentifier:@"ImageCell"];
    //
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.tuwanVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.tuwanVM getMoreDataCompletionHandle:^(NSError *error) {
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
        [cell.iconIV0 setImageWithURL:[self.tuwanVM iconURLsForRowInList:indexPath.row][0] placeholderImage:[UIImage imageNamed:@"10979716_0800"]];
        [cell.iconIV1 setImageWithURL:[self.tuwanVM iconURLsForRowInList:indexPath.row][1] placeholderImage:[UIImage imageNamed:@"10979716_0800"]];
        [cell.iconIV2 setImageWithURL:[self.tuwanVM iconURLsForRowInList:indexPath.row][2] placeholderImage:[UIImage imageNamed:@"10979716_0800"]];
        
        return cell;
    }else{
    TuWanListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    //placeholderImage 当图片没有下载完成之前显示的图片
    [cell.iconIV setImageWithURL:[self.tuwanVM iconURLForRowInList:indexPath.row]placeholderImage:[UIImage imageNamed:@"10979716_0800"]];
    cell.titleLb.text = [self.tuwanVM titleForRowInList:indexPath.row];
    cell.longTitleLb.text = [self.tuwanVM descForRowInList:indexPath.row];
    cell.clicksNumLb.text = [self.tuwanVM clicksForRowInList:indexPath.row];
        return cell;
    }
    
}

/**去掉分割线*/
kRemoveCellSeparator

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/**设置cell高度*/
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.tuwanVM containImages:indexPath.row]?135:90;
}
@end
