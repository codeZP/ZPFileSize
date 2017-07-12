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
 得到文件夹的大小

 @param filePath 文件夹路径
 */
+ (void)getFileSizeWithFilePath:(NSString *)filePath completion:(void (^)(NSInteger))completion;

/**
 清除文件夹里所有文件

 @param filePath 文件夹路径
 */
+ (void)cleanFileWithPath:(NSString *)filePath;

@end
