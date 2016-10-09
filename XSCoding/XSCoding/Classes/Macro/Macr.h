//
//  Macr.h
//  XSCoding
//
//  Created by apple on 16/9/27.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#ifndef Macr_h
#define Macr_h



//当编译模式为release 时屏蔽NSLog(...)
#ifdef DEBUG

#else

#define NSLog(...)

#endif


#define XSKwindow ([UIApplication sharedApplication].keyWindow)

#define XSSREENWIDTH [UIScreen mainScreen].bounds.size.width
#define XSSREENHEIGHT [UIScreen mainScreen].bounds.size.height

#define DocumentPath [NSHomeDirectory() stringByAppendingString:@"/Documents"]

#define CacheParh [NSHomeDirectory() stringByAppendingString:@"/Library/Caches"]



#define ClassName NSStringFromClass([self class])



#endif /* Macr_h */
