//
//  BaiKeViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaiKeViewController.h"
#import "ToolMenuViewModel.h"
#import "XYImageView.h"
#import "BestGroupViewController.h"
#import "EquiqCategoryController.h"
#import "SumAbilityViewController.h"
#import "NovelViewController.h"
#import "ServiceViewController.h"

@interface BaiKeViewCell : UITableViewCell
@property (nonatomic,strong) XYImageView *icon;
@property (nonatomic,strong) UILabel *label;
@end
@implementation BaiKeViewCell
-(XYImageView *)icon{
    if (!_icon) {
        _icon = [XYImageView new];
        [self.contentView addSubview:_icon];
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(40, 40));
            
        }];
    }
    return _icon;
}

-(UILabel *)label{
    if (!_label) {
        _label = [UILabel new];
        [self.contentView addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.icon).mas_equalTo(0);
            make.left.mas_equalTo(self.icon.mas_right).mas_equalTo(5);
            make.right.mas_equalTo(-20);
        }];
    }
    return _label;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //设置cell被选中后的背景色
        UIView *view = [UIView new];
        view.backgroundColor = kNavTitleColor;
        self.selectedBackgroundView = view;
        //分割线距离左侧空间
        self.separatorInset = UIEdgeInsetsMake(0, 60, 0, 0);
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}
@end
@interface BaiKeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) ToolMenuViewModel *tmVM;
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation BaiKeViewController
-(ToolMenuViewModel *)tmVM{
    if (!_tmVM) {
        _tmVM = [ToolMenuViewModel new];
    }
    return _tmVM;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[BaiKeViewCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
      
        
    }
    return _tableView;
}
-(instancetype)init{
    if (self = [super init]) {
        self.title = @"游戏百科";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.hidden = NO;
    [self showProgress];
    [self.tmVM getDataFromNetCompleteHandle:^(NSError *error) {
        [self hideProgress];
        [self.tableView reloadData];
    }];
  
}


#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
    return self.tmVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaiKeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.icon.imageView setImageWithURL:[self.tmVM iconForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
    cell.label.text = [self.tmVM titleForRow:indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([[self.tmVM tagForRow:indexPath.row]isEqualToString:@"best_group"]) {
        BestGroupViewController *vc = [BestGroupViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([[self.tmVM tagForRow:indexPath.row]isEqualToString:@"item"]){
        EquiqCategoryController *vc = [EquiqCategoryController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([[self.tmVM tagForRow:indexPath.row]isEqualToString:@"sum_ability"]){
        SumAbilityViewController *vc = [SumAbilityViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([[self.tmVM tagForRow:indexPath.row]isEqualToString:@"lol_story"]){
        NovelViewController *vc = [NovelViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([[self.tmVM tagForRow:indexPath.row]isEqualToString:@"lol_keywords"]){
        ServiceViewController *vc = [ServiceViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
