//
//  DownloadManager.m
//  线day_04_仿SDWebImage
//
//  Created by sean on 17/6/24.
//  Copyright © 2017年 AAAA. All rights reserved.
//

#import "DownloadManager.h"
#import "DownloadOperation.h"

@interface DownloadManager ()

@property (nonatomic,strong) NSOperationQueue *queue;

@property (nonatomic,strong) NSMutableDictionary *opCache;

@property (nonatomic,strong) NSMutableDictionary *imgCache;

@end


@implementation DownloadManager

//shared
+(instancetype)sharedManager{
    
    static id instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    
    return instance;
}

//单例的初始化
- (instancetype)init
{
    self = [super init];
    if (self) {
       
        _queue = [NSOperationQueue new];
        
        _opCache = [NSMutableDictionary dictionary];
        
        _imgCache = [NSMutableDictionary dictionary];
        
    }
    return self;
}
    



-(void)downloadOpreationWithURLString:(NSString *)string finishedBlock:(void(^)(UIImage *image))block{
    
    //查看是否有缓存
    if ([self checkCacheWithString:string]) {
        UIImage *image = [_imgCache objectForKey:string];
        block(image);
        return;
    }
    
    //如果已在队列中 则防止重复下载
    if ([_opCache objectForKey:string] != nil) {
        return;
    }
    
    //让operation接管下载
    DownloadOperation *op =[DownloadOperation downloadOpreationWithURLString:string finishedBlock:^(UIImage *image)
    {
        
    //把由operation传来的image传给外界(viewController)
        if (block != nil)
        {
            block(image);
        }
    
        if (image != nil)
        {
            [_imgCache setObject:image forKey:string];
        }
    //完成下载从opCache中移除op
        [_opCache removeObjectForKey:string];
    }
            ];

    [_queue addOperation:op];
}

-(BOOL)checkCacheWithString:(NSString *)string{
    
    if ([_imgCache objectForKey:string] != nil) {
//        block([_imgCache objectForKey:string]);
        NSLog(@"从内存中加载");
        return YES;
    }

    UIImage *image = [UIImage imageWithContentsOfFile:[string appendCachePath]];
    if (image != nil) {
        NSLog(@"从沙河中加载");
        [_imgCache setObject:image forKey:string];
        return YES;
    }
    
    return NO;
}

-(void)cancelLastOpWithString:(NSString *)lastString{
    
    DownloadOperation *op = [_opCache objectForKey:lastString];
    [op cancel];
}




@end
