//
//  XSToolCache.h
//  XSCoding
//
//  Created by apple on 16/10/9.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XSToolCache : NSObject


/**
 计算应用缓存的大小

 @return 返回缓存的大小(M)
 */
+ (CGFloat)folderCacheSize;

/**
 清除缓存
 */
+ (BOOL)removeCache;

@end
