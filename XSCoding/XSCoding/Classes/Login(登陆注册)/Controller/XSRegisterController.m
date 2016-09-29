//
//  XSRegisterController.m
//  XSCoding
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSRegisterController.h"
#import <MJExtension.h>

#import "XSRegisterCell.h"

#import "XSToolHttpRequst.h"
#import "XSRegisterRequst.h"
#import "XSCaptchaRespon.h"



@interface XSRegisterController ()<UITableViewDelegate,UITableViewDataSource>{
    BOOL _isCaptcha;
}

@property (weak, nonatomic) IBOutlet UITableView *reigsterTableView;


@property (weak, nonatomic) IBOutlet UILabel *serverLabel;

@property (strong, nonatomic) XSRegisterRequst *registerRequst;

@end


static NSString *cellId = @"CELLID";
@implementation XSRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self isRegisterCaptcha];//判断是否需要验证吗
    [self setterSubView];//加载子视图

}




#pragma mark - settingSubView


- (void)setterSubView{

    [self navigationSetter];//设置导航栏及状态栏
    
    [self setterTableView];//设置tableview
    
    [self addTapGesture];//添加手势
    
    
}


#pragma mark - 判断注册是否需要验证

- (void)isRegisterCaptcha{
    
    //进行get请求
    [XSToolHttpRequst requstIsCaptchaUrlStr:XSRegisterCaptchaURLString withSuccessHander:^(id resulst, NSError *error) {
        if (error) {
            _isCaptcha = NO;
        }else{
            XSCaptchaRespon *respon = [XSCaptchaRespon mj_objectWithKeyValues:resulst];
            _isCaptcha = respon.data;
            NSLog(@"%d",respon.data);
        }
        [self.reigsterTableView reloadData];//刷新表格
    }];
     
    
    
}



- (void)addTapGesture{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.serverLabel addGestureRecognizer:tap];
}

- (void)navigationSetter{
    
    //设置状态栏
     [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
  
    self.title = @"注册";
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(leftCancel)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
}

- (void)setterTableView{
    
    [self.reigsterTableView registerClass:[XSRegisterCell class] forCellReuseIdentifier:cellId];
}




#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _isCaptcha ? 4 : 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XSRegisterCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    NSInteger cellIndex = indexPath.row;
    __weak typeof(self) weakSelf = self;//防止block引起循环引用
    if (cellIndex == 3) {
        cell.capImage.isCaptchaHiden = NO;
    }else{
       cell.capImage.isCaptchaHiden = YES;
    }
    switch (cellIndex) {
        case 0:{
            cell.textField.placeholder = @"用户名,个性后缀";
            cell.textChangeBlock = ^(NSString *text){
                weakSelf.registerRequst.global_key = text;
            };
            break;
        }
        case 1:{
            cell.textField.placeholder = @"邮箱";
            cell.textChangeBlock = ^(NSString *text){
                weakSelf.registerRequst.email = text;
            };
            break;
        }
        case 2:{
            cell.textField.placeholder = @"密码";
            cell.textChangeBlock = ^(NSString *text){
                weakSelf.registerRequst.password = text;
            };
            break;
        }
        case 3:{
            cell.textField.placeholder = @"验证码";
            cell.textChangeBlock = ^(NSString *text){
                weakSelf.registerRequst.j_captcha = text;
            };
            break;
        }
        default:
            break;
    }
    
    
    return cell;
}



#pragma mark - BtnAction

- (void)leftCancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//手势调用
- (void)tapAction:(UITapGestureRecognizer *)tap{
    
   
}

- (IBAction)registerAction:(UIButton *)sender {
    
    //1.判断数据的合理性(邮箱和用户名是否合法)
    
    
    //2.数据的加工
       //2.1密码进行sha1加密
    self.registerRequst.password = [self.registerRequst.password stringWithSha1];
       //2.2密码验证
    self.registerRequst.confirm = self.registerRequst.password;
    
    NSLog(@"%@",self.registerRequst.mj_keyValues);
   
    //3.进行注册请求
    __weak typeof(self) weakSelf = self;
    [XSToolHttpRequst registerRequstParameter:self.registerRequst.mj_keyValues withSuccessHander:^(id resulst, NSError *error) {
        if (error) {
            [weakSelf isRegisterCaptcha];
            
        }else{
            //注册成功后进行处理
            NSLog(@"注册成功");
        }
    }];
    
}

#pragma mark - Custom 

- (XSRegisterRequst *)registerRequst{
    if (!_registerRequst) {
        _registerRequst = [[XSRegisterRequst alloc] init];
    }
    return _registerRequst;
}



@end
