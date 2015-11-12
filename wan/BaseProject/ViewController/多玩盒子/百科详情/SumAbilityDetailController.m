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
@property (nonatomic,strong) UILabel *lb;

@end
@implementation SumAbilityDetailCell

-(UILabel *)lb{
    if (!_lb) {
        _lb = [UILabel new];
        _lb.numberOfLines = 0;
        _lb.font  = [UIFont systemFontOfSize:15];
        _lb.backgroundColor = [UIColor whiteColor];
      
        [self.contentView addSubview:_lb];
        [_lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_greaterThanOrEqualTo(40);
        }];
    }
    return _lb;
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
            make.height.mas_equalTo(90);
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
        cell.lb.text = [self.saVM desForRow:_row];
    }else if (indexPath.section == 1){
        cell.lb.text = [self.saVM strongForRow:_row];
    }else{
        cell.lb.text = [self.saVM desForRow:_row];
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


@end
