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


#pragma mark - Public


- (void)login:(NSDictionary *)parameter withSuccessHander:(successHandler)successHander{
    [self postHttpUrl:@"" Parameter:parameter withSuccessHander:^(id resulst, NSError *error) {
        if (successHander) {
            if (error) {
                successHander(nil,error);
            }else{
                successHander(resulst,nil);
            }
        }
    }];
}


#pragma mark - private


- (void)postHttpUrl:(NSString *)url Parameter:(NSDictionary *)parameter withSuccessHander:(successHandler)successHander{
    
    [self.manager POST:url parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successHander) {
            successHander(responseObject,nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
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
        if (errorCode == 404) {
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
#warning NO setting Base URL
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:nil]];
        _manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    }
    return _manager;
}


@end
