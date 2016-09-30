//
//  XSRegisterController.m
//  XSCoding
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSRegisterController.h"
#import <MJExtension.h>

#import "XSUserInfo.h"

#import "XSBaseTextFieldCell.h"

#import "XSToolHttpRequst.h"
#import "XSRegisterRequst.h"
#import "XSCaptchaRespon.h"


#import "XSWebController.h"

#import "AppDelegate.h"



@interface XSRegisterController ()<UITableViewDelegate,UITableViewDataSource>{
    BOOL _isCaptcha;
    BOOL _isRefreshCaptcha;//是否刷新验证码
}

@property (weak, nonatomic) IBOutlet UITableView *reigsterTableView;

@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

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
    
    _isRefreshCaptcha = NO;
    self.registerBtn.enabled = NO;
    
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
    
    [self.navigationController.navigationBar setHidden:NO];
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(leftCancel)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
}

- (void)setterTableView{
    
    self.reigsterTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.reigsterTableView registerClass:[XSBaseTextFieldCell class] forCellReuseIdentifier:cellId];

}




#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _isCaptcha ? 4 : 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XSBaseTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.isRefreshCaptcha = _isRefreshCaptcha;//是否刷新验证码
   
    NSInteger cellIndex = indexPath.row;
    __weak typeof(self) weakSelf = self;//防止block引起循环引用
    if (cellIndex == 3) {
        cell.isCapIamgeHiden = NO;
    }else{
       cell.isCapIamgeHiden = YES;
    }
    switch (cellIndex) {
        case 0:{
            cell.textPlaceholder = @"用户名,个性后缀";
            cell.textChangeBlock = ^(NSString *text){
                weakSelf.registerRequst.global_key = text;
            };
            break;
        }
        case 1:{
            cell.textPlaceholder = @"邮箱";
            cell.textChangeBlock = ^(NSString *text){
                weakSelf.registerRequst.email = text;
            };
            break;
        }
        case 2:{
            cell.textPlaceholder = @"密码";
            cell.isTextSecureTextEntry = YES;
            cell.textChangeBlock = ^(NSString *text){
                weakSelf.registerRequst.password = text;
                weakSelf.registerBtn.enabled = YES;
            };
            break;
        }
        case 3:{
            cell.textPlaceholder = @"验证码";
            cell.textChangeBlock = ^(NSString *text){
                weakSelf.registerRequst.j_captcha = text;
                 weakSelf.registerBtn.enabled = YES;
            };
            break;
        }
        default:
            break;
    }
    
    cell.placeholderColor = [UIColor colorR:223 withG:223 withB:223 Alpha:0.8];//设置颜色
    
    return cell;
}



#pragma mark - BtnAction

//返回上一页面
- (void)leftCancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//手势调用
- (void)tapAction:(UITapGestureRecognizer *)tap{
    XSWebController *webViewVc = [[XSWebController alloc] init];
    webViewVc.webViewUrl = XSServerHTML;
    [self.navigationController pushViewController:webViewVc animated:YES];
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
            _isRefreshCaptcha = YES;
            
        }else{
            //注册成功后进行处理
            NSLog(@"注册成功");
            
            AppDelegate *del = (AppDelegate *)[UIApplication sharedApplication].delegate;
            
            [del setUpStartMainView];
            
            
            
            XSUserInfo *user = [XSUserInfo mj_objectWithKeyValues:@{@"lavatar":@"kkkk"}];
            [user saveData];//归档
            NSLog(@"%@",NSHomeDirectory());
           [XSUserInfo  obtainData];//解档

            NSLog(@"%@",user.lavatar);
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
