//
//  XSMineController.m
//  XSCoding
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSMineController.h"

#import "XSSettingController.h"

#import "XSMineHeaderView.h"


#import "XSUserInfo.h"

@interface XSMineController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic)NSMutableArray *mineCellInfoS;

@property (strong, nonatomic) XSMineHeaderView *mineHeaderView;

@end

static NSString *cellID = @"MienCELL";
@implementation XSMineController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setterNavigation];//设置导航栏
    
    [self setterTableView];//设置tableView
}



- (void)setterTableView{
    
//    self.tableView.sectionHeaderHeight = 20;
//    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.separatorInset = UIEdgeInsetsMake(0,50, 0, 0);
    self.tableView.tableHeaderView = self.mineHeaderView;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
}

#pragma mark - <UITableViewDataSource>


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
 
    return self.mineCellInfoS.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *itme = self.mineCellInfoS[section];
    return itme.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//设置右边的箭头
    NSArray *array = self.mineCellInfoS[indexPath.section];
    NSDictionary *dict = array[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:dict[@"icon"]];
    cell.textLabel.text = dict[@"title"];
    
    return cell;
}

#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    //CGFLOAT_MIN 最小值
    return CGFLOAT_MIN;
}



- (void)setterNavigation{
    
    self.title = @"我";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"addUserBtn_Nav"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnAction)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settingBtn_Nav"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnAction)];
    
}





#pragma mark - navigationAction

- (void)leftBtnAction{
    
}

- (void)rightBtnAction{
    
    UIViewController *settingVc = [UIViewController storyboardWithName:MainStorboard instantiateViewControllerWithIdentifier:SettingController];
    settingVc.hidesBottomBarWhenPushed = YES;//隐藏tabBar
    [self.navigationController pushViewController:settingVc animated:YES];
}


#pragma mark - 懒加载头部视图

- (XSMineHeaderView *)mineHeaderView{
    if (!_mineHeaderView) {
        _mineHeaderView = [XSMineHeaderView shareUserInfo:[XSUserInfo shareDefaultUserInfo] withBackgroundImageName:@"STARTIMAGE"];
        _mineHeaderView.frame = CGRectMake(0, 0, XSSREENWIDTH,190);
    }
    return _mineHeaderView;
}



#pragma mark - 懒加载数据
- (NSMutableArray *)mineCellInfoS{
    if (!_mineCellInfoS) {
        _mineCellInfoS = [NSMutableArray array];
        [_mineCellInfoS addObject:@[@{@"title":@"详细信息",@"icon":@"user_info_detail"}]];
        [_mineCellInfoS addObject:@[
                                  @{@"title":@"我的项目",@"icon":@"user_info_project"},
                                  @{@"title":@"我的冒泡",@"icon":@"user_info_tweet"},
                                  @{@"title":@"我的话题",@"icon":@"user_info_topic"},
                                  @{@"title":@"本地文件",@"icon":@"user_info_file"}]];
        [_mineCellInfoS addObject:@[@{@"title":@"我的码币",@"icon":@"user_info_point"}]];
    }
    
    return _mineCellInfoS;
}


@end
