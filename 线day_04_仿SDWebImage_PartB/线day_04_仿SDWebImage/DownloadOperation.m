//
//  DownloadOperation.m
//  线day_04_仿SDWebImage
//
//  Created by sean on 17/6/23.
//  Copyright © 2017年 AAAA. All rights reserved.
//

#import "DownloadOperation.h"

@interface DownloadOperation ()

@property (nonatomic,copy) NSString *URLString;

//接收completionBlock
@property (nonatomic,copy) void(^finishedBlock)(UIImage *image);


@end

@implementation DownloadOperation




//自定义实例化方法
+(instancetype)downloadOpreationWithURLString:(NSString *)string finishedBlock:(void(^)(UIImage *image))block {
    
    DownloadOperation *op = [DownloadOperation new];
    
    op.finishedBlock = block;
    
    op.URLString = string;
   
    return op;
}


-(void)main{
    
    NSLog(@"开始下载%@",[NSThread currentThread]);
    
    //模拟延迟
    [NSThread sleepForTimeInterval:2];
    
    NSURL *url = [NSURL URLWithString:_URLString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    if (self.isCancelled){
        NSLog(@"取消下载%@",[NSThread currentThread]);
        return;
    }
        
    if (self.finishedBlock) {
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            self.finishedBlock(image);
        }];
    }
  
}

@end
