//
//  XSRegisterController.m
//  XSCoding
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSRegisterController.h"

@interface XSRegisterController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *userEmail;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@property (weak, nonatomic) IBOutlet UILabel *serverLabel;

@end

@implementation XSRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setterSubView];

}


#pragma mark - settingSubView


- (void)setterSubView{

    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
    [self navigationSetter];
    
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.serverLabel addGestureRecognizer:tap];
    
}

- (void)navigationSetter{
  
    self.title = @"注册";
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(leftCancel)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
}



#pragma mark - BtnAction

- (void)leftCancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)tapAction:(UITapGestureRecognizer *)tap{
    
    NSLog(@"----");
}

- (IBAction)registerAction:(UIButton *)sender {
}


- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
