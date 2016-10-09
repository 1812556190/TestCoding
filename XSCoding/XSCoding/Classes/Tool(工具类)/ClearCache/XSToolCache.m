//
//  XSToolCache.m
//  XSCoding
//
//  Created by apple on 16/10/9.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSToolCache.h"

#import <SDImageCache.h>


//#define CacheParh [NSHomeDirectory() stringByAppendingString:@"/Library/Caches"]


@implementation XSToolCache




// 缓存大小
+ (CGFloat)folderCacheSize{
    CGFloat folderSize;
    
    //获取所有文件的数组
    NSArray *files = [self cacheFilePathes];
    if (files.count == 0) {
        return 0.0;
    }
    for(NSString *path in files) {
        
        NSString*filePath = [CacheParh stringByAppendingString:[NSString stringWithFormat:@"/%@",path]];
        
        //累加
        folderSize += [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil].fileSize;
    }
    //SDWebImage框架自身计算缓存的实现
    folderSize+=[[SDImageCache sharedImageCache] getSize];
    //转换为M为单位
    CGFloat sizeM = folderSize /1024.0/1024.0;
    
    return sizeM;
}


+ (BOOL)removeCache{
    //===============清除缓存==============
    //返回路径中的文件数组
    NSArray*files = [self cacheFilePathes];
    for(NSString *p in files){
        NSError*error;
        NSString*path = [CacheParh stringByAppendingString:[NSString stringWithFormat:@"/%@",p]];
       
        if([[NSFileManager defaultManager] fileExistsAtPath:path])
        {
           [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
        }
    }
     [[SDImageCache sharedImageCache] cleanDisk];
    if ([self cacheFilePathes].count == 0) {
        return YES;
    }
    return NO;
}

//获取Cache目录下的所有子文件
+ (NSArray *)cacheFilePathes{
   return  [[NSFileManager defaultManager] subpathsAtPath:CacheParh];
}




@end
