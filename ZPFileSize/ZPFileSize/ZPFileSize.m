//
//  ZPFileSize.m
//  ZPFileSize
//
//  Created by yueru on 2017/6/30.
//  Copyright © 2017年 赵攀. All rights reserved.
//

#import "ZPFileSize.h"

@implementation ZPFileSize

+ (void)getFileSizeWithFilePath:(NSString *)filePath completion:(void (^)(NSInteger))completion {
    NSFileManager *manager = [NSFileManager defaultManager];
    // 文件夹所有的自路径
    NSArray *subPaths = [manager subpathsAtPath:filePath];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSInteger totalSize = 0;
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
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (completion) {
                completion(totalSize);
            }
        });
    });
    
}

+ (void)cleanFileWithPath:(NSString *)filePath {
    NSFileManager *manager = [NSFileManager defaultManager];
    // 文件夹所有的自路径
    NSArray *subPaths = [manager subpathsAtPath:filePath];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (NSString *subPath in subPaths) {
            // 获取文件全路径
            NSString *fullPath = [filePath stringByAppendingPathComponent:subPath];
            [manager removeItemAtPath:fullPath error:nil];
        }
    });
}

@end
