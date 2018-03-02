//
//  ZPFileSize.h
//  ZPFileSize
//
//  Created by yueru on 2017/6/30.
//  Copyright © 2017年 赵攀. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZPFileSize : NSObject

/**
 异步得到文件夹的大小

 @param filePath 文件名称
 @param completion 得到缓存大小回调
 */
+ (void)getFileSizeWithFilePath:(NSString *)filePath completion:(void (^)(NSInteger))completion;

/**
 清除文件夹里所有文件

 @param filePath 文件夹路径
 */

/**
 异步清除文件夹里所有文件

 @param filePath 文件名称
 @param completion 清空回调
 */
+ (void)cleanFileWithPath:(NSString *)filePath completion:(void (^)())completion;

@end
