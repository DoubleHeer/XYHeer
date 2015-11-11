//
//  BestGroupDetailViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupDetailViewController.h"
#import "BestGroupCell.h"


@interface BestGroupDetailCell : UITableViewCell
@property (nonatomic,strong) XYImageView *img;
@property (nonatomic,strong) UILabel *desLb;
@end
@implementation BestGroupDetailCell

-(XYImageView *)img{
    if (!_img) {
        _img = [XYImageView new];
        [self.contentView addSubview:_img];
        [_img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(49, 49));
            make.left.top.mas_equalTo(10);
        }];
    }
    return _img;
}

-(UILabel *)desLb{
    if (!_desLb) {
        _desLb = [UILabel new];
        _desLb.font = [UIFont systemFontOfSize:16];
        _desLb.numberOfLines = 0;
        [self.contentView addSubview:_desLb];
        [_desLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(64);
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(-10);
        }];
    }
    return _desLb;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //设置cell被选中后的背景色
        UIView *view = [UIView new];
        view.backgroundColor = kNavTitleColor;
        self.selectedBackgroundView = view;
        //分割线距离左侧空间
        // self.separatorInset = UIEdgeInsetsMake(0, 60, 0, 0);
        
    }
    return self;
}

@end

@interface BestGroupDetailViewController ()<UITableViewDelegate
,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation BestGroupDetailViewController
/**
 1.数据传入：通过在BestGroupViewController中点击任意的cell。获取到对应的BestGroupModel类对象
 2.整体式一个tableView，group风格，两个section
 3.有两种类型cell，负责团队简介显示 不可选
 4.另一种,BestGroupDetailCell，显示每个角色的简介 可选中
 5.cell选择以后是浅黄色，色值自己量取
 
 */
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[BestGroupCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[BestGroupDetailCell class] forCellReuseIdentifier:@"DetailCell"];
        
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

-(instancetype)initWithRow:(NSInteger)row BestGroupViewModel:(BestGroupViewModel *)bestVM{
    if (self = [super init]) {
        _row = row;
        _bgVM = bestVM;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
    self.title = @"阵容详情";
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.hidden = NO;
    
    
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return 5;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        BestGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        cell.titleLb.numberOfLines = 0;
        cell.desLb.numberOfLines = 0;
        [cell.img1.imageView setImageWithURL:[self.bgVM iconHero1ForRow:_row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
        [cell.img2.imageView setImageWithURL:[self.bgVM iconHero2ForRow:_row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
        [cell.img3.imageView setImageWithURL:[self.bgVM iconHero3ForRow:_row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
        [cell.img4.imageView setImageWithURL:[self.bgVM iconHero4ForRow:_row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
        [cell.img5.imageView setImageWithURL:[self.bgVM iconHero5ForRow:_row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
        cell.titleLb.text = [self.bgVM titleForRow:_row];
        cell.desLb.text = [self.bgVM desForRow:_row];
        //设置cell不可点击
        cell.selectionStyle = UITableViewScrollPositionNone;
        return cell;
    }else{
        BestGroupDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell"];
        
        switch (indexPath.row) {
            case 0:
                [cell.img.imageView setImageWithURL:[self.bgVM iconHero1ForRow:_row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
                cell.desLb.text = [self.bgVM des1ForRow:_row];
                return cell;
            case 1:
                [cell.img.imageView setImageWithURL:[self.bgVM iconHero2ForRow:_row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
                cell.desLb.text = [self.bgVM des2ForRow:_row];
                return cell;
            case 2:
                [cell.img.imageView setImageWithURL:[self.bgVM iconHero3ForRow:_row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
                cell.desLb.text = [self.bgVM des3ForRow:_row];
                return cell;
            case 3:
                [cell.img.imageView setImageWithURL:[self.bgVM iconHero4ForRow:_row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
                cell.desLb.text = [self.bgVM des4ForRow:_row];
                return cell;
            case 4:
                [cell.img.imageView setImageWithURL:[self.bgVM iconHero5ForRow:_row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
                cell.desLb.text = [self.bgVM des5ForRow:_row];
                return cell;
            default:
                return 0;
        }
    }
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewAutomaticDimension;
}

@end
