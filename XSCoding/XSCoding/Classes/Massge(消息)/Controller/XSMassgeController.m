//
//  XSMassgeController.m
//  XSCoding
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSMassgeController.h"

#import "XSMassgeCell.h"

@interface XSMassgeController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (strong, nonatomic) NSArray *massgeCellInfo;


@end
static NSString *cellID = @"CELL";

static NSString *CELLID = @"MassgeCELL";

@implementation XSMassgeController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    [self setterNavigation];//设置导航栏
    
    [self setterTableView];
}


- (void)setterNavigation{
    self.title = @"消息";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"tweetBtn_Nav"] style:UIBarButtonItemStylePlain target:self action:@selector(rightItemAction)];
}

- (void)rightItemAction{
    
}


- (void)setterTableView{
    
//    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.tableFooterView = [[UIView alloc] init];//去掉多余的分割线
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    [self.tableView registerClass:[XSMassgeCell class] forCellReuseIdentifier:CELLID];
}


#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.massgeCellInfo.count + 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row < self.massgeCellInfo.count) {//不变的表格使用系统的cell
        NSDictionary *dict = self.massgeCellInfo[indexPath.row];//表格的数据
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.imageView.image = [UIImage imageNamed:dict[@"icon"]];
        cell.textLabel.text = dict[@"title"];
        return cell;
    }else{//变化的表格使用自定义cell
        XSMassgeCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
        [cell loadData];
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);//设置分割线线条的偏移
        return cell;
    }
}

#pragma mark - <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 61;
}




#pragma mark - 懒加载数据

- (NSArray *)massgeCellInfo{
    if (!_massgeCellInfo) {
        _massgeCellInfo = [NSMutableArray array];
        _massgeCellInfo = @[@{@"title":@"@我的",@"icon":@"messageAT"},
                            @{@"title":@"评论",@"icon":@"messageComment"},
                            @{@"title":@"系统通知",@"icon":@"messageSystem"}];
    }
    return _massgeCellInfo;
}




@end
