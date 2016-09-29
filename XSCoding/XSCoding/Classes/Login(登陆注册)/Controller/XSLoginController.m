//
//  XSLoginController.m
//  XSCoding
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSLoginController.h"

#import "XSBaseTextFieldCell.h"

#import "XSLoginRequst.h"

#import "XSRegisterController.h"

#import "XSToolHttpRequst.h"
#import "XSCaptchaRespon.h"

#import <MJExtension.h>


#import "XSBackPassWordController.h"






@interface XSLoginController ()<UITableViewDelegate,UITableViewDataSource>{
    BOOL _isCaptcha;
}
@property (weak, nonatomic) IBOutlet UITableView *LoginTableView;

@property (strong, nonatomic) XSLoginRequst *requstModel;


@end

static NSString *cellId = @"cellID";

@implementation XSLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置状态栏
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
    [self isNeedLoginCaptcha];//判断登陆是否需要验证吗
      
    [self setterSubView];
}


#pragma mark - 判断登陆是否需要密码
- (void)isNeedLoginCaptcha{
    
    [XSToolHttpRequst requstIsCaptchaUrlStr:XSLoginCaptchaURLString withSuccessHander:^(id resulst, NSError *error) {
        NSLog(@"%@",resulst);
        if (error) {
            _isCaptcha = NO;
        }else{
  
            XSCaptchaRespon *capRespon = [XSCaptchaRespon mj_objectWithKeyValues:resulst];
            _isCaptcha = capRespon.data;
        }
        [self.LoginTableView reloadData];
    }];
    
}





#pragma mark - settingSubView


- (void)setterSubView{
    
    
    [self setterTableView];//设置tableview

}

- (void)setterTableView{
    
    [self.LoginTableView registerClass:[XSBaseTextFieldCell class] forCellReuseIdentifier:cellId];
  //分割线样式
    self.LoginTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.LoginTableView.separatorColor = [UIColor lightGrayColor];
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _isCaptcha ? 3 : 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    XSBaseTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    NSInteger cellIndex = indexPath.row;
    cell.separaLineSelectColor = [UIColor whiteColor];
    if (cellIndex == 2) {
        cell.isCapIamgeHiden = NO;
    }else{
        cell.isCapIamgeHiden = YES;
    }
    __weak typeof(self) weakSelf = self;
    switch (cellIndex) {
        case 0:{
            cell.textPlaceholder = @"手机号码/电子邮箱/个性后缀";
            cell.textChangeBlock = ^(NSString *text){
                weakSelf.requstModel.account = text;
            };
            break;
        }
        case 1:{
            cell.textPlaceholder = @"密码";
            cell.textChangeBlock = ^(NSString *text){
                weakSelf.requstModel.password = text;
            };
            break;
        }
        case 2:{
            cell.textPlaceholder = @"验证码";
            cell.textChangeBlock = ^(NSString *text){
                weakSelf.requstModel.j_captcha = text;
            };
            break;
        }
        default:
            break;
    }
    
    
 
    return cell;
}
#pragma mark - <UITableViewDelegate>
//设置边框线
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // 这两句的含义跟上面两句代码相同,就不做解释了
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 18, 0, 18)];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsMake(0, 18, 0, 18)];
    }
}


#pragma mark - btnAction

- (IBAction)btnCancelAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


//验证
- (IBAction)certificationBtn:(UIButton *)sender {
}

//
- (IBAction)loginAction:(UIButton *)sender {
    [self.view endEditing:NO];
    //1.验证登陆数据的合理性(正则)
    //2.数据处理
    self.requstModel.remember_me = self.requstModel.account;
    
    //3.登陆请求
    __weak typeof(self) weakSelf = self;
    [XSToolHttpRequst requstLoginParameter:self.requstModel.mj_keyValues withSuccessHander:^(id resulst, NSError *error) {
        if (error) {
            [weakSelf isNeedLoginCaptcha];
        }else{
            //登陆成功后的处理
            NSLog(@"登陆成功！");
        }
    }];
    
    
}

- (IBAction)forgetPassWordAction:(UIButton *)sender {
    
    XSBackPassWordController *back = [[XSBackPassWordController alloc] init];
    
    [self presentViewController:back animated:YES completion:nil];
    
}


//注册
- (IBAction)goRegisterAction:(UIButton *)sender {
    UIViewController *reigsterVc = [UIViewController storyboardWithName:PublicStorboard instantiateViewControllerWithIdentifier:RegisterController];
    UINavigationController *nva = [[UINavigationController alloc] initWithRootViewController:reigsterVc];
    
    [self presentViewController:nva animated:YES completion:nil];
}


#pragma mark -

- (XSLoginRequst *)requstModel{
    if (!_requstModel) {
        _requstModel = [[XSLoginRequst alloc] init];
    }
    return _requstModel;
}



@end
