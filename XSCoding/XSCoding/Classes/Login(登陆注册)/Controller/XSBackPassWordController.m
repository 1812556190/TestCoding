//
//  XSBackPassWordController.m
//  XSCoding
//
//  Created by apple on 16/9/29.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSBackPassWordController.h"
#import "XSBaseTextFieldCell.h"


static NSString *cellId = @"cellID";

@interface XSBackPassWordController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation XSBackPassWordController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect tableViewFrame = self.view.bounds;
    UITableView *tableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    [tableView registerClass:[XSBaseTextFieldCell class] forCellReuseIdentifier:cellId];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XSBaseTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.separaLineSelectColor = [UIColor redColor];
    cell.isCapIamgeHiden = YES;
    cell.isSeparaLineHiden = YES;
    cell.textPlaceholder = @"你诗歌智障";
    cell.textChangeBlock = ^(NSString *text){
        NSLog(@"%@",text);
    };
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
