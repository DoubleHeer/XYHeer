//
//  ViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoViewController.h"
#import "VideoCell.h"
#import "VideoViewModel.h"

@interface VideoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) VideoViewModel *videoVM;
@end

@implementation VideoViewController

-(instancetype)init{
    if (self = [super init]) {
        self.title =  @"视频";
    }
    return self;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[VideoCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
    }
    return _tableView;
}
-(VideoViewModel *)videoVM{
    if (!_videoVM) {
        _videoVM = [VideoViewModel new];
        
    }
    return _videoVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    
   self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.videoVM refreshDataCompletionHandle:^(NSError *error) {
           [_tableView.header endRefreshing];
           [_tableView reloadData];
       }];
   }];
    
    [_tableView.header beginRefreshing];
    
    self.tableView.footer = [MJRefreshBackNormalFooter
                         footerWithRefreshingBlock:^{
                             [self.videoVM getMoreDataCompletionHandle:^(NSError *error) {
                                 [_tableView.footer endRefreshing];
                                 [_tableView reloadData];
                             }];
                         }];
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.videoVM.rowNumber;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLabel.text = [self.videoVM titleForRow:indexPath.section];
    cell.descLabel.text = [self.videoVM descForRow:indexPath.section];
    [cell.iconBtn setBackgroundImageForState:0 withURL:[self.videoVM iconURLForRow:indexPath.section]];
    cell.videoURL = [self.videoVM videoURLForRow:indexPath.section];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
@end
