//
//  XSToolHttpManager.m
//  XSCoding
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSToolHttpManager.h"
#import <AFNetworking.h>
#import "XSHUDView.h"

static XSToolHttpManager *networking = nil;

@interface XSToolHttpManager ()

@property (strong, nonatomic) AFHTTPSessionManager *manager;


@end


@implementation XSToolHttpManager

#pragma mark - instance

+ (instancetype)shareInstance{
    return networking = [[XSToolHttpManager alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        networking = [super allocWithZone:zone];
    });
    return networking;
}

- (id)copy{
    return networking;
}



#pragma mark - private

//post请求
- (void)postHttpUrl:(NSString *)url Parameter:(NSDictionary *)parameter withSuccessHander:(successHandler)successHander{
    
    [self.manager POST:url parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error = [self handlerErrorWithData:responseObject];
        if (successHander) {
            successHander(responseObject,error);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         [self handlerErrorWithData:error];
        if (successHander) {
            successHander(nil,error);
        }
    }];
}
//get请求
- (void)getHttpUrl:(NSString *)url Parameter:(NSDictionary *)parameter withSuccessHander:(successHandler)successHander{
    [self.manager GET:url parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         NSError *error = [self handlerErrorWithData:responseObject];
        if (successHander) {
            successHander(responseObject,error);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         [self handlerErrorWithData:error];
        if (successHander) {
            successHander(nil,error);
        }
    }];
}


//处理错误
- (NSError *)handlerErrorWithData:(id)data{
    NSError *error;
    if ([data isKindOfClass:[NSDictionary class]]) {
        NSInteger errorCode = [data[@"code"] integerValue];
        if (errorCode == 0) {
            return nil;
        }else if (errorCode == 404) {
            [XSHUDView showHUDViewTitle:@"网络错误，请稍后再试！"];
        }else if (errorCode == 1000){
           
        }
        error = [NSError errorWithDomain:@"Http://www.coding.com" code:errorCode userInfo:data];
    }
    if ([data isKindOfClass:[NSError class]]) {
        [XSHUDView showHUDViewTitle:@"不可预料的错误,请稍后再试!"];
    }
    
    return error;
}




#pragma mark - Custom Accessors

- (AFHTTPSessionManager *)manager{
    if (!_manager) {
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:XSBaseAPIURLString]];
        _manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    }
    return _manager;
}


@end
