//
//  NSString+XSEncryption.m
//  XSCoding
//
//  Created by apple on 16/9/28.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "NSString+XSEncryption.h"
#import <CommonCrypto/CommonDigest.h>
#import "sys/utsname.h"


@implementation NSString (XSEncryption)


- (NSString *)stringWithSha1{
    
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

- (NSString *)imageUrlWithStringSize:(CGFloat)size{
    
   return [self stringByAppendingString:[NSString stringWithFormat:@"?imageMogr2/auto-orient/thumbnail/!%.0fx%.0fr", size, size]];

}


@end
