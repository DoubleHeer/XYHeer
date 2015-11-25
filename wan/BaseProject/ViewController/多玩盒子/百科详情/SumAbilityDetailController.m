//
//  SumAbilityDetailController.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SumAbilityDetailController.h"
#import "XYImageView.h"

@interface SumAbilityDetailCell : UITableViewCell
@property (nonatomic,strong) UILabel *descLb;

@end
@implementation SumAbilityDetailCell

- (UILabel *)descLb{
    if (!_descLb) {
        _descLb = [UILabel new];
        _descLb.font=[UIFont systemFontOfSize:14];
        //黑线方框背景，正常由美工提供。 如果没有美工 可以考虑使用灰色视图套白色视图，两者边缘差距1像素来解决
        UIView *grayView = [UIView new];
        grayView.backgroundColor=[UIColor lightGrayColor];
        [self.contentView addSubview:grayView];
        grayView.layer.cornerRadius = 4;
        [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(3, 10, 3, 10));
        }];
        
        UIView *whiteView =[UIView new];
        whiteView.backgroundColor = [UIColor whiteColor];
        [grayView addSubview:whiteView];
        whiteView.layer.cornerRadius = 4;
        
        [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(1, 1, 1, 1));
            make.height.mas_greaterThanOrEqualTo(28);
        }];
        
        [whiteView addSubview:_descLb];
        _descLb.numberOfLines = 0;
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
        }];
        
    }
    return _descLb;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        //设置cell被选中后的背景色
//        UIView *view = [UIView new];
//        view.backgroundColor = kNavTitleColor;
//        self.selectedBackgroundView = view;
        self.backgroundColor = kRGBColor(239, 239, 244);
        //分割线距离左侧空间
         //self.separatorInset = UIEdgeInsetsMake(0, 20, 0, -20);
        
    }
    return self;
}
@end

@interface SumAbilityDetailController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
/** 包含技能图标、技能名称、等级、冷却时间的内容视图 */
@property(nonatomic,strong) UIView *topView;

@end

@implementation SumAbilityDetailController
-(instancetype)initWithRow:(NSInteger)row SumAbilityViewModel:(SumAbilityViewModel *)saVM{
    if (self = [super init]) {
        _row = row;
        _saVM = saVM;
    }
    return self;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.allowsSelection = NO;
         _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        [_tableView registerClass:[SumAbilityDetailCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(self.topView.mas_bottom).mas_equalTo(0);
        }];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
    self.title = @"召唤师技能详情";
    self.tableView.hidden = NO;
   //
}


- (UIView *)topView {
    if(_topView == nil) {
        _topView = [[UIView alloc] init];
        _topView.backgroundColor = kRGBColor(239, 239, 244);
        [self.view addSubview:_topView];
        [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(75);
        }];
        
        //        技能图标
        XYImageView *imageView = [XYImageView new];
        [_topView addSubview:imageView];
       
        [imageView.imageView setImageWithURL:[self.saVM iconURLForRow:_row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_5"]];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60, 60));
            make.left.top.mas_equalTo(8);
        }];
        //        技能名称
        UILabel *abilityLb=[UILabel new];
        abilityLb.text = [self.saVM nameForRow:_row];
        [_topView addSubview:abilityLb];
        [abilityLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(imageView);
        }];
        
        //        需要等级
        UILabel *levelLb=[UILabel new];
        levelLb.text = [@"需要等级 " stringByAppendingString:[self.saVM levelForRow:_row]];
        levelLb.font=[UIFont systemFontOfSize:12];
        levelLb.textColor=[UIColor lightGrayColor];
        [_topView addSubview:levelLb];
        [levelLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.rightMargin.mas_equalTo(abilityLb);
            make.top.mas_equalTo(abilityLb.mas_bottom).mas_equalTo(5);
        }];
        //        冷却时间
        UILabel *coolLb=[UILabel new];
        coolLb.text = [@"冷却时间 " stringByAppendingString:[self.saVM cooldownForRow:_row]];
        coolLb.font=[UIFont systemFontOfSize:12];
        coolLb.textColor=[UIColor lightGrayColor];
        [_topView addSubview:coolLb];
        [coolLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.rightMargin.mas_equalTo(abilityLb);
            make.top.mas_equalTo(levelLb.mas_bottom).mas_equalTo(5);
        }];
        
    }
    return _topView;
}



#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SumAbilityDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    
    if (indexPath.section == 0) {
        cell.descLb.text = [self.saVM desForRow:_row];
    }else if (indexPath.section == 1){
        cell.descLb.text = [self.saVM strongForRow:_row];
    }else{
        cell.descLb.text = [self.saVM desForRow:_row];
    }
    return cell;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return  @"描述";
    }else if (section == 1){
        return @"天赋强化";
    }else{
        return @"提示";
    }
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
@end
