//
//  JokeTableViewController.m
//  BaseProject
//
//  Created by heer on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "JokeTableViewController.h"
#import "JokeViewModel.h"

@interface JokeCell : UITableViewCell
@property (nonatomic,strong) UILabel *contentLb;
@property (nonatomic,strong) UILabel *updateTimeLb;

@end
@implementation JokeCell

-(UILabel *)contentLb{
    if (!_contentLb) {
        _contentLb = [UILabel new];
        _contentLb.font = [UIFont systemFontOfSize:15];
        _contentLb.numberOfLines = 0;
        [self.contentView addSubview:_contentLb];
        [_contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(5);
            make.right.mas_equalTo(-5);
            
        }];
    }
    return _contentLb;
}

-(UILabel *)updateTimeLb{
    if (!_updateTimeLb) {
        _updateTimeLb = [UILabel new];
        _updateTimeLb.font = [UIFont systemFontOfSize:12];
        _updateTimeLb.textColor = [UIColor lightGrayColor];
        _updateTimeLb.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_updateTimeLb];
        [_updateTimeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.top.mas_equalTo(self.contentLb.mas_bottom).mas_equalTo(2);
            make.bottom.right.mas_equalTo(-5);
            
        }];
    }
    return _updateTimeLb;
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

@interface JokeTableViewController ()
@property (nonatomic,strong) JokeViewModel *jVM;

@end

@implementation JokeTableViewController



-(JokeViewModel *)jVM{
    if (!_jVM) {
        _jVM = [JokeViewModel new];
    }
    return _jVM;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[JokeCell class] forCellReuseIdentifier:@"Cell"];
  self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
      [self.jVM refreshDataCompletionHandle:^(NSError *error) {
          [self.tableView.header endRefreshing];
          [self.tableView reloadData];
      }];
  }];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.jVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView.footer endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.tableView.header beginRefreshing];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.jVM.rowNumber;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JokeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
   
//    cell.contentLb.text = [NSString stringWithFormat:@"\t%@",[[self.jVM contentForRow:indexPath.row]stringByReplacingOccurrencesOfString:@"\\n" withString:@"\r\n"]];
    cell.contentLb.text = [NSString stringWithFormat:@"\t%@",[self.jVM contentForRow:indexPath.section]];
    cell.updateTimeLb.text = [self.jVM updatetimeForRow:indexPath.section];
    
    return cell;
}

//自动计算行高
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

@end
