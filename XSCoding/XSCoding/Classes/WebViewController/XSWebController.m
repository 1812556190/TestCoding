//
//  XSWebController.m
//  XSCoding
//
//  Created by apple on 16/9/29.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSWebController.h"
#import <WebKit/WebKit.h>

@interface XSWebController ()


@property (strong, nonatomic)WKWebView *wkWebView;

@end

@implementation XSWebController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setterNaviGation];//设置导航栏
   
    [self loadWebView];//加载本地网页
}

- (void)loadWebView{
    
    
    
    //获取HTML文件的本地路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:self.webViewUrl ofType:@"html"];
    //将本地路径转成URL
    NSURL *fileUrl = [NSURL fileURLWithPath:filePath];
    
    //加载本地Html文件
    //方式一
    //将本地路径转成NSString
    NSString *htmlStr = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    //通过字符串的方式加载html
    [self.wkWebView loadHTMLString:htmlStr baseURL:fileUrl];
    
//    //方式二
    //创建一个请求
//    NSURLRequest *request = [NSURLRequest requestWithURL:fileUrl];
//    //加载请求
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


#pragma mark - 懒加载web视图
- (WKWebView *)wkWebView{
    if (!_wkWebView) {
        _wkWebView = [[WKWebView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:_wkWebView];
    }
    
    return _wkWebView;
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
