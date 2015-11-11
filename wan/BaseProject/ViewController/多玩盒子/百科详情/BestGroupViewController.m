//
//  BestGroupViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupViewController.h"
#import "BestGroupViewModel.h"
#import "BestGroupCell.h"
#import "BestGroupDetailViewController.h"

@interface BestGroupViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) BestGroupViewModel *bgVM;

@end

@implementation BestGroupViewController
//步骤：
//1.创建BestGroupViewModel
    //只需要实现getData就可以了，没有分页问题
//model只提供了英雄英文名，需要拼接英雄头像链接地址http://img.lolbox.duowan.com/champions/Annie_120x120.jpg
//2.创建BestGroupCell ，继承UITableViewCell，头像大小固定，间距自己计算
//cell题目最多一行，详情简介 最多两行
//3.BestGroupViewController制作，cell的高度：只需要实现estimatedHeightForRow 协议即可自动适应
//4.在百科ViewController的cell点击事件中vm层的tag值，是best_group,则跳转

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[BestGroupCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.tableFooterView = [UIView new];
        //给个猜测的行高，让cell可以自行计算应有的高度
        _tableView.estimatedRowHeight = UITableViewAutomaticDimension;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _tableView;
}

-(BestGroupViewModel *)bgVM{
    if (!_bgVM) {
        _bgVM = [BestGroupViewModel new];
    }
    return _bgVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
    self.title = @"最佳阵容";
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.hidden = NO;
    
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.bgVM getDataFromNetCompleteHandle:^(NSError *error) {
        
            [self.tableView reloadData];
            [_tableView.header endRefreshing];
        }];
    }];
    [_tableView.header beginRefreshing];

}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%ld",self.bgVM.rowNumber);
    return self.bgVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BestGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.img1.imageView setImageWithURL:[self.bgVM iconHero1ForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
    [cell.img2.imageView setImageWithURL:[self.bgVM iconHero2ForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
    [cell.img3.imageView setImageWithURL:[self.bgVM iconHero3ForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
    [cell.img4.imageView setImageWithURL:[self.bgVM iconHero4ForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
    [cell.img5.imageView setImageWithURL:[self.bgVM iconHero5ForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
    cell.titleLb.text = [self.bgVM titleForRow:indexPath.row];
    cell.desLb.text = [self.bgVM desForRow:indexPath.row];
     
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewAutomaticDimension;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 124;
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BestGroupDetailViewController *vc = [[BestGroupDetailViewController alloc]initWithRow:indexPath.row BestGroupViewModel:self.bgVM];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
