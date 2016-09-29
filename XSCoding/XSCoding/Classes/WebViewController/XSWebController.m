//
//  XSWebController.m
//  XSCoding
//
//  Created by apple on 16/9/29.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSWebController.h"

@interface XSWebController ()

@property (strong, nonatomic)UIWebView *webView;

@end

@implementation XSWebController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setterNaviGation];//设置导航栏
   
    [self loadWebView];//加载本地网页
}

- (void)loadWebView{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:self.webViewUrl ofType:@"html"];
    
    NSURL *fileUrl = [NSURL fileURLWithPath:filePath];
    
    //加载本地Html文件
    //方式一
    NSString *htmlStr = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    [self.webView loadHTMLString:htmlStr baseURL:fileUrl];
    
//    //方式二
//    NSURLRequest *request = [NSURLRequest requestWithURL:fileUrl];
//    
//    [self.webView loadRequest:request];
    
}


//设置导航栏
- (void)setterNaviGation{
    self.title = @"服务条款";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar_pic_back_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(leftCancelAction)];
}



- (void)leftCancelAction{
    
    [self.navigationController popViewControllerAnimated:YES];
}



- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, XSSREENWIDTH, XSSREENHEIGHT - 64)];
        [self.view addSubview:_webView];
    }
    
    return _webView;
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
