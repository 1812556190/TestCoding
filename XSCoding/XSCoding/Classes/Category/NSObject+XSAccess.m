//
//  NSObject+XSAccess.m
//  XSCoding
//
//  Created by apple on 16/9/30.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "NSObject+XSAccess.h"
#import <MJExtension.h>

#define FilePath [DocumentPath stringByAppendingPathComponent:ClassName]

@implementation NSObject (XSAccess)



- (BOOL)saveData{
    
    
//    NSLog(@"--%@",FilePath);
    return  [NSKeyedArchiver archiveRootObject:self toFile:FilePath];
}


+ (instancetype)obtainData{
   
//    NSLog(@"--%@",FilePath);
   return [NSKeyedUnarchiver unarchiveObjectWithFile:FilePath];
}







@end
