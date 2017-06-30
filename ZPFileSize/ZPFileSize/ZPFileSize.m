//
//  ZPFileSize.m
//  ZPFileSize
//
//  Created by yueru on 2017/6/30.
//  Copyright © 2017年 赵攀. All rights reserved.
//

#import "ZPFileSize.h"

@implementation ZPFileSize

+ (long long)getFileSizeWithFilePath:(NSString *)filePath {
    long long totalSize = 0;
    NSFileManager *manager = [NSFileManager defaultManager];
    // 文件夹所有的自路径
    NSArray *subPaths = [manager subpathsAtPath:filePath];
    // 遍历所有的子文件
    for (NSString *subPath in subPaths) {
        // 获取文件全路径
        NSString *fullPath = [filePath stringByAppendingPathComponent:subPath];
        if ([fullPath containsString:@".DS"]) {
            continue;
        }
        BOOL isDirectory = NO;
        if ([manager fileExistsAtPath:fullPath isDirectory:&isDirectory]) {
            if (isDirectory) {
                continue;
            }
        }
        NSDictionary *attr = [manager attributesOfItemAtPath:fullPath error:nil];
        long long itmeSize = attr.fileSize;
        totalSize += itmeSize;
    }
    return totalSize;
}

+ (void)cleanFileWithPath:(NSString *)filePath {
    NSFileManager *manager = [NSFileManager defaultManager];
    // 文件夹所有的自路径
    NSArray *subPaths = [manager subpathsAtPath:filePath];
    for (NSString *subPath in subPaths) {
        // 获取文件全路径
        NSString *fullPath = [filePath stringByAppendingPathComponent:subPath];
        [manager removeItemAtPath:fullPath error:nil];
    }
}

@end
