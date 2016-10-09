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


#import "XSHUDView.h"

#import "XSUserInfo.h"

#import "XSToolUserInfo.h"

#import "AppDelegate.h"






@interface XSLoginController ()<UITableViewDelegate,UITableViewDataSource>{
    BOOL _isCaptcha;
    BOOL _isRefreshCaptcha;//是否刷新验证码
}
@property (weak, nonatomic) IBOutlet UITableView *LoginTableView;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (strong, nonatomic) XSLoginRequst *requstModel;


@property (strong, nonatomic) UIImageView *backImageView;


@end

static NSString *cellId = @"cellID";

@implementation XSLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isRefreshCaptcha = NO;//设置初始值
    
    //设置状态栏
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    [self.navigationController.navigationBar setHidden:YES];//隐藏导航栏
    
    self.LoginTableView.backgroundView = self.backImageView;
    
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
    cell.isRefreshCaptcha = _isRefreshCaptcha;
    if (cellIndex == 2) {
        cell.isCapIamgeHiden = NO;
    }else{
        cell.isCapIamgeHiden = YES;
    }
    __weak typeof(self) weakSelf = self;
    switch (cellIndex) {
        case 0:{
            cell.textPlaceholder = @"手机号码/电子邮箱/个性后缀";
            cell.textTitle = [XSToolUserInfo obtainAccount];
            cell.textChangeBlock = ^(NSString *text){
                weakSelf.requstModel.account = text;
            };
            break;
        }
        case 1:{
            cell.textPlaceholder = @"密码";
            cell.isTextSecureTextEntry = YES;
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
    
     cell.placeholderColor = [UIColor colorR:223 withG:223 withB:223 Alpha:0.8];//设置颜色
 
    return cell;
}
#pragma mark - <UITableViewDelegate>
////设置边框线
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    // 这两句的含义跟上面两句代码相同,就不做解释了
//    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
//        [cell setSeparatorInset:UIEdgeInsetsMake(0, 18, 0, 18)];
//    }
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
//        [cell setLayoutMargins:UIEdgeInsetsMake(0, 18, 0, 18)];
//    }
//}


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
    
    if (!self.requstModel.account) {
        self.requstModel.account = [XSToolUserInfo obtainAccount];
    }
    //1.验证登陆数据的合理性(正则)
    //2.数据处理
    self.requstModel.password = [self.requstModel.password stringWithSha1];
    //3.登陆请求
    __weak typeof(self) weakSelf = self;
    [XSHUDView showLoadingProcessText:@"正在登陆..."];
    
    [XSToolHttpRequst requstLoginParameter:self.requstModel.mj_keyValues withSuccessHander:^(id resulst, NSError *error) {
        [XSHUDView hideHUD];
        if (error) {
            [weakSelf isNeedLoginCaptcha];
            [XSHUDView showHUDViewError:error];
            _isRefreshCaptcha = YES;
        }else{
            //登陆成功后的处理
//            NSLog(@"%@",resulst);
            
            [XSToolUserInfo saveAccount:self.requstModel.account];//保存账号到属性列表
            
            AppDelegate *del = (AppDelegate *)[UIApplication sharedApplication].delegate;
            
            [del setUpStartMainView];//加载主页面
            
            
            
//            NSLog(@"归档前----:%@",resulst[@"data"][@"name"]);
            XSUserInfo *user = [XSUserInfo mj_objectWithKeyValues:resulst[@"data"]];
            [user saveData];//归档
//            NSLog(@"解档----:%@",[XSUserInfo obtainData].name);
            
        }
    }];
    
    
}

- (IBAction)forgetPassWordAction:(UIButton *)sender {
    
    XSBackPassWordController *back = [[XSBackPassWordController alloc] init];
    
    [self.navigationController pushViewController:back animated:YES];
    
}


//注册
- (IBAction)goRegisterAction:(UIButton *)sender {
    UIViewController *reigsterVc = [UIViewController storyboardWithName:PublicStorboard instantiateViewControllerWithIdentifier:RegisterController];
//    UINavigationController *nva = [[UINavigationController alloc] initWithRootViewController:reigsterVc];
    
    [self.navigationController pushViewController:reigsterVc animated:YES];
}


#pragma mark -

- (XSLoginRequst *)requstModel{
    if (!_requstModel) {
        _requstModel = [[XSLoginRequst alloc] init];
    }
    return _requstModel;
}

- (UIImageView *)backImageView{
    if (!_backImageView) {
        UIImage *image = [UIImage imageNamed:@"STARTIMAGE"];
        _backImageView = [[UIImageView alloc] initWithImage:image];
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        [_backImageView addSubview:effectView];
        
        [effectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_backImageView);
        }];

    }
   return _backImageView;
}



@end
